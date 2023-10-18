let routeUrl = routePenjadwalan;
var calendar = {};
var reportCalendar = {};
var newEvent = {};
var reportApiUrl = '/backend/jadwal/penjadwalan/get_jadwal_perprodi?';
// let activeTab = '#palembang';
let activeTab = '#area1';
$(function(){
	get_data_jadwal(activeTab);
	loadCalender(activeTab);
	loadReport();

});
function dump_data(data){
	data = JSON.parse(data);
	let htm = '';
	for(i in data){
		htm += `
		<tr>
		<td class="text-center">`+(parseInt(i)+1)+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_hari+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_jam_masuk+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_jam_keluar+`</td>
		<td class="text-center">`+data[i]['jadwal'].ruang_kode+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_sks+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_semester+`</td>
		<td class="text-center">`+data[i]['jadwal'].jadwal_kelas+`</td>
		<td class="text-center">`+data[i]['jadwal'].mk_nama+`</td>
		<td class="text-left"><ul>`;

		for(j in data[i]['dosen']){
			htm+=`<li>${data[i]['dosen'][j].dosen_nama}</li>`;
		}
		/*<a href="#" class="btn btn-social  btn-warning " onclick="editJadwal('`+data[i]['jadwal'].jadwal_id+`','`+data[i]['jadwal'].jadwal_hari+`','`+data[i]['jadwal'].jadwal_jam_masuk+`','`+data[i]['jadwal'].jadwal_jam_keluar+`','`+data[i]['jadwal'].ruang_id+`','`+data[i]['jadwal'].jadwal_sks+`','`+data[i]['jadwal'].jadwal_semester+`','`+data[i]['jadwal'].jadwal_kelas+`','`+data[i]['jadwal'].mk_id+`','`+data[i]['jadwal'].dosen_id+`')" data-toggle="modal" data-target="#modalForm"  title="Edit" id="updateData">
		<i class="fa fa-pencil"></i>
		</a>*/
		htm+=`</ul></td>
		<td class="text-center">
		
		<a href="#" class="btn btn-social  btn-danger " onclick="deleteData('`+data[i]['jadwal'].jadwal_id+`')" title="Delete">
		<i class="fa fa-trash"></i>
		</a>
		</td>
		</tr>
		`;
	}


	$('#mydata-tables').DataTable().destroy();
	$('#mydata-tables').find('tbody').html(htm);
	$('#mydata-tables').DataTable({
		"aLengthMenu": [
		[10, 25, 50, -1],
		[10, 25, 50, "All"]
		],
		"iDisplayLength": 10,
		"language": {
			search: ""
		}
	}).draw();
}
function resetJadwalForm() {
	newEvent = {};
	$('#jadwal-id').val('');
	$('#jadwal-hari').val('');
	$('#jadwal-masuk').val('');
	$('#jadwal-keluar').val('');
	$('#ruang-id').val('');
	$('#mk-id').val('');
	$('#dosen-id').val('');
	$('#jadwal-kelas').val('');
	$('#jadwal-semester').val('');
	$('#jadwal-sks').val('');
}
$('#filter-jadwal').click(function () {
	var namaProdi = $( "#prodi-id option:selected" ).text();
	var prodiId = $( "#prodi-id" ).val();
	var namaTa = $( "#tahun-id option:selected" ).text();
	var taId = $( "#tahun-id" ).val();
	reportCalendar.removeAllEventSources();
	reportCalendar.addEventSource(getReportEventSource(`prodi=${prodiId}&ta=${taId}`));
	$('#judul-filter').text(`Filter Jadwal Berdasarkan Prodi ${namaProdi} dan Tahun Ajaran ${namaTa}`);
});
$('#save_changes').click(function(){
	let data = {
		jadwal_id:$('#jadwal-id').val(),
		jadwal_hari:$('#jadwal-hari').val(),
		jadwal_masuk:$('#jadwal-masuk').val(),
		jadwal_keluar:$('#jadwal-keluar').val(),
		ruang_id:$('#ruang-id').val(),
		mk_id:$('#mk-id').val(),
		dosen_id:$('#dosen-id').val(),
		jadwal_kelas:$('#jadwal-kelas').val(),
		jadwal_semester:$('#jadwal-semester').val(),
		jadwal_sks:$('#jadwal-sks').val()
	};
	if($('#save_changes').data('action') == 'create'){
		url = 'create_data';
	} else {
		url = 'update_data';
	}
	send_data_jadwal(JSON.stringify(data),url);
	$('#div-calender').html('');
	$('#div-calender').append(`<div id='calendar'></div>`);
	$('#tab-jadwal a[href="'+activeTab+'"]').trigger('click');
});
function editJadwal(jadwal_id,jadwal_hari,jadwal_jam_masuk,jadwal_jam_keluar,ruang_id,jadwal_sks,jadwal_semester,jadwal_kelas,mk_id,dosen_id){
	$('#modalTite').text('Edit Data');
	$('#save_changes').data('action','update');
	$('#jadwal-id').val(jadwal_id);
	$('#jadwal-hari').val(jadwal_hari);
	$('#jadwal-masuk').val(jadwal_jam_masuk);
	$('#jadwal-keluar').val(jadwal_jam_keluar);
	$('#ruang-id').val(ruang_id);
	$('#mk-id').val(mk_id);
	$('#dosen-id').val(dosen_id);
	$('#jadwal-kelas').val(jadwal_kelas);
	$('#jadwal-semester').val(jadwal_semester);
	$('#jadwal-sks').val(jadwal_sks);
}
$('#tab-jadwal').on("click", "li", function (event) {         
	activeTab = $(this).find('a').attr('href');
	$('#div-calender').html('');
	$('#div-calender').append(`<div id='calendar'></div>`);
	loadCalender();
	get_data_jadwal(activeTab);
});


function loadCalender(){
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: ['bootstrap','interaction', 'resourceTimeline' ],
		themeSystem: 'bootstrap',
		defaultView: 'resourceTimelineWeek',
		header: {
			left : "",
			right : "",
		},
		height: 450,
		resourceGroupField: 'gedung_nama',
		slotLabelFormat: [
			{ weekday: 'long' },
			{
				hour: 'numeric',
				minute: '2-digit',
				omitZeroMinute: false,
				hour12: false
			},
		],
		resourceLabelText: 'Ruangan',
		minTime : "08:00:00",
		maxTime : "17:00:00",
		resourceAreaWidth : "15%",
		weekends: false,
		businessHours: {
			daysOfWeek: [ 1, 2, 3, 4,5 ],
			startTime: '08:00',
			endTime: '17:00',
		},
		eventOverlap : false,
		editable: true,
		selectable : true,
		selectOverlap : false,
		eventClick: function(e) {	
			console.log(e);
			$.get({
				url : routeUrl + "get_data_id",
				data:{id:e.event.id},
				beforeSend: function(){
					$('#mydata-tables').addClass('loading');
				},
				complete: function(){
					$('#mydata-tables').removeClass('loading');
				},
				success: function (data) {
					data = JSON.parse(data);
					console.log(data);
					if(data.response.info == 'error'){
						$.toast({
							heading: data.response.info,
							text: data.response.text,
							showHideTransition: 'plain',
							position: 'top-right',
							hideAfter: 2000, 
							icon: data.response.info
						});
					} else {
						data = data.data;
						let jadwal = data.jadwal;
						let dosen = data.dosen;
						$('#modalForm').modal('show');
						$('#modalTite').text('Edit Data');
						$('#save_changes').data('action','update');
						$('#jadwal-id').val(jadwal.jadwal_id);
						$('#ruang-id').val(jadwal.ruang_id);
						$('#mk-id').val(jadwal.mk_id);
						let arrdosen = [];
						for(i in dosen){
							arrdosen.push(dosen[i].dosen_id);
						}
						$('#dosen-id').val(arrdosen).trigger('change');

						$('#jadwal-kelas').val(jadwal.jadwal_kelas);
						$('#jadwal-semester').val(jadwal.jadwal_semester);
						$('#jadwal-sks').val(jadwal.jadwal_sks);
						$('#jadwal-hari').val(jadwal.jadwal_hari);
						$('#jadwal-masuk').val(jadwal.jadwal_jam_masuk);
						$('#jadwal-keluar').val(jadwal.jadwal_jam_keluar);
					}

				},
				error: function (response) {
					console.log("Error in fetching data");
				}
			})
			.fail(function(data){
				console.log("Fail in fetching data");
			});
		},
		select : function(selectInfo){
			resetJadwalForm();
			var start = selectInfo.start;
			var end = selectInfo.end;
			newEvent = {
				startTime : moment(start).format("HH:mm"),
				endTime : moment(end).format("HH:mm"),
				daysOfWeek : [start.getDay()],
				resourceId : selectInfo.resource.id
			};
			$('.select2').val(null).trigger('change');
			$('#modalForm').modal('show');
			$('#modalTite').text('Add Data');
			$('#save_changes').data('action','create');
			$('#jadwal-id').val('');
			$('#ruang-id').val('');
			$('#mk-id').val('');
			$('#dosen-id').val('');
			$('#jadwal-kelas').val('');
			$('#jadwal-semester').val('');
			$('#jadwal-sks').val('');
			$('#jadwal-hari').val(getHariIndex(newEvent.daysOfWeek[0]));
			$('#jadwal-masuk').val(newEvent.startTime);
			$('#jadwal-keluar').val(newEvent.endTime);
			$('#ruang-id').val(newEvent.resourceId);
		},
		selectAllow: function(selectInfo) {
			var start = selectInfo.start;
			var end = selectInfo.end;
			return start.getDay() == end.getDay();
		},
		resources: function(fetchInfo, successCallback, failureCallback) {
			convertActiveTab = activeTab.replace("#","");
			fetch(base_url+'backend/jadwal/penjadwalan/get_ruangan?lokasi='+convertActiveTab)
				.then(response => response.json())
				.then(data => {
					successCallback(data)
				})
				.catch((error) => {
					console.error('Error:', error);
					failureCallback(error);
				});
		},
		events: function(fetchInfo, successCallback, failureCallback) {
			$.post({
				url : base_url+'backend/jadwal/penjadwalan/get_data',
				data:{gedung:activeTab},
				success: function (data) {
					data = JSON.parse(data);
					successCallback(data.map(jadwal=>{
						return {
							resourceId : jadwal.jadwal.ruang_id,
							id : jadwal.jadwal.jadwal_id,
							startTime: jadwal.jadwal.jadwal_jam_masuk,
							endTime: jadwal.jadwal.jadwal_jam_keluar,
							s: jadwal.jadwal.prodi_id,
							color: jadwal.jadwal.prodi_warna,
							daysOfWeek: [hariToNumber(jadwal.jadwal.jadwal_hari)],
							title : jadwal.jadwal.mk_nama+" "+jadwal.jadwal.jadwal_kelas
						}
					}));
				},
				error: function (response) {
					console.log("Error in fetching data");
				}
			})
				.fail(function(data){
					console.log("Fail in fetching data");
				});
		},
		eventDrop: function(event) {
			editTanggal(event.event.id,event.event.start,event.event.end);
		},
		eventResize: function(event) {
			editTanggal(event.event.id,event.event.start,event.event.end);
		},
	});

calendar.render();
}

function loadReport(){
	var calendarReportEl = document.getElementById('calendar_report');
	reportCalendar = new FullCalendar.Calendar(calendarReportEl, {
		plugins: ['bootstrap','interaction', 'timeGrid', 'list' ],
		defaultView: 'timeGridWeek',
		themeSystem: 'bootstrap',
		nowIndicator: false,
		slotEventOverlap : false,
		header: {
			left : "toggleView, openReportFilter",
			right : "",
		},
		allDaySlot:false,
		height: 700,
		minTime : "08:00:00",
		maxTime : "17:00:00",
		weekends: false,
		listDayAltFormat : false,
		columnHeaderFormat : { weekday: 'long' },
		slotLabelFormat : {
			hour: 'numeric',
			minute: '2-digit',
			omitZeroMinute: true,
			meridiem: false,
			hour12 : false
		},
		noEventsMessage : 'Belum ada jadwal',
		businessHours: {
			daysOfWeek: [ 1, 2, 3, 4,5 ],
			startTime: '08:00',
			endTime: '17:00',
		},
		customButtons: {
			toggleView: {
				text: 'Ubah Tampilan',
				click: function() {
					reportCalendar.view.type == 'listWeek' ? reportCalendar.changeView('timeGridWeek') : reportCalendar.changeView('listWeek');
				}
			},
			openReportFilter: {
				text: 'Buka Filter',
				click: function() {
					$('#report-filter').modal('toggle')
				}
			},
		},
		events: getReportEventSource(),
		dayRender : function(day) {
			var idx = null;
			var today = new Date().toDateString();
			var ddate = new Date(day.date).toDateString();
			if (ddate == today) {
				$(day.el).removeClass('alert alert-info')
			}
		},
		eventRender : function (info) {
			let jadwal = info.event.extendedProps.jadwal;
			let dosen = jadwal.dosen.map(dosen=>dosen.dosen_nama).join(', ');
			let stringInfo = `<div class="text-left">
									Matkul: ${jadwal.mk_nama} </br> 
									Lokasi: ${jadwal.gedung_nama} </br> 
									Ruangan: ${jadwal.ruang_kode} </br> 
									Dosen: ${dosen} </br>									
								</div> 
								` ;
			$(info.el).tooltip({
				title : stringInfo,
				html : true
			})

		}
	});

	reportCalendar.render();
}

function editTanggal(id,start,end){
	$.post({
		url : base_url+'backend/jadwal/penjadwalan/editTanggal',
		data:{id:id,start:moment(start).format("HH:mm"),end:moment(end).format("HH:mm"),hari:getHariIndex(start.getDay())},
		success: function (data) {
			data = JSON.parse(data);
			$.toast({
				heading: data.info,
				text: data.text,
				showHideTransition: 'plain',
				position: 'top-right',
				hideAfter: 2000, 
				icon: data.info
			});
			if(data.info == 'error'){
				$('#div-calender').html('');
				$('#div-calender').append(`<div id='calendar'></div>`);
				$('#tab-jadwal a[href="'+activeTab+'"]').trigger('click');
			}
		},
		error: function (response) {
			console.log("Error in fetching data");
		}
	})
	.fail(function(data){
		console.log("Fail in fetching data");
	});
}
function parseEventData(data) {
	return data.map(jadwal=>{
		let dosen = jadwal.dosen.map(dosen=>dosen.dosen_nama).join(', ');
		let stringInfo = `Matkul: ${jadwal.mk_nama}  Lokasi: ${jadwal.gedung_nama}  Ruangan: ${jadwal.ruang_kode} Dosen: ${dosen} ` ;
		return {
			id : jadwal.jadwal_id,
			startTime: jadwal.jadwal_jam_masuk,
			endTime: jadwal.jadwal_jam_keluar,
			s: jadwal.prodi_id,
			daysOfWeek: [hariToNumber(jadwal.jadwal_hari)],
			title : stringInfo,
			extendedProps: {
				jadwal : jadwal
			},

		}
	})
}
function getReportEventSource(filter) {
	filter = filter ? filter : 'prodi=all';
	return function (fetchInfo, successCallback, failureCallback) {
		$.get({
			url: reportApiUrl + filter,
			success: function (data) {
				successCallback(parseEventData(JSON.parse(data)));
			},
			error: function (response) {
				failureCallback("Error in fetching data");
			}
		}).always(()=>$('#report-filter').modal('hide'))
	}
}
