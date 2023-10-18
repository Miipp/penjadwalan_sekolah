<?php 

class Jadwal_m extends MY_Model 
{
	public function __construct()
	{
		parent::__construct();
		$this->data['table_name']	= 'jadwal';
		$this->data['primary_key']	= 'jadwal_id';
	}

	public function group_jam(){
		$q = $this->db->query("SELECT jadwal_jam_masuk,jadwal_jam_keluar FROM jadwal GROUP BY jadwal_jam_masuk,jadwal_jam_keluar ORDER BY jadwal_jam_masuk ASC")->result();

		return $q;
	}

	public function group_gedung($day){
		$q = $this->db->query("SELECT a.ruang_id,b.ruang_kode,c.gedung_nama FROM jadwal a INNER JOIN ruang b ON a.ruang_id=b.ruang_id INNER JOIN gedung c ON b.gedung_id=c.gedung_id  WHERE a.jadwal_hari='$day' GROUP BY c.gedung_id ORDER BY c.gedung_nama ASC")->result();

		return $q;
	}

	public function get_data_id($id){
		$q=$this->db->query("SELECT 
			a.*,b.mk_nama,c.ruang_kode,c.ruang_status,b.prodi_id 
			FROM jadwal a INNER JOIN mata_kuliah b ON a.mk_id=b.mk_id INNER JOIN ruang c ON a.ruang_id=c.ruang_id INNER JOIN gedung d ON c.gedung_id=d.gedung_id WHERE a.jadwal_id = '$id' ORDER BY a.jadwal_id ASC")->row();

		$res = [];
		if(!empty($q)){
			$res = [
				'jadwal' => $q,
				'dosen' => $this->get_dosen_jadwal($q->jadwal_id)
			];
		}

		return $res;
	}

	public function get_data($ta_id,$gedung){
		$q=$this->db->query("SELECT 
			a.*,b.mk_nama,c.ruang_kode,c.ruang_status,e.prodi_warna,b.prodi_id 
			FROM jadwal a 
			INNER JOIN mata_kuliah b ON a.mk_id=b.mk_id 
			INNER JOIN ruang c ON a.ruang_id=c.ruang_id 
			INNER JOIN gedung d ON c.gedung_id=d.gedung_id 
			INNER JOIN prodi e ON b.prodi_id=e.prodi_id 
			WHERE a.ta_id = '$ta_id' AND d.gedung_lokasi = '$gedung' ORDER BY a.jadwal_id ASC")->result();

		$res = [];
		if(count($q) > 0){
			foreach($q as $i){
				$res[] = [
					'jadwal' => $i,
					'dosen' => $this->get_dosen_jadwal($i->jadwal_id)
				];
			}
		}

		return $res;
	}
	public function get_jadwal_per_prodi($prodi, $ta_id){
		$listJadwal =  $this->listJadwalPerProdi($prodi, $ta_id);
		foreach ($listJadwal as $index => $jadwal){
			$listJadwal[$index]->dosen = $this->get_dosen_jadwal($jadwal->jadwal_id);
		}
		return $listJadwal;
	}
	public function get_dosen_jadwal($jadwal_id){
		$q = $this->db->query("SELECT * FROM dosen_jadwal a INNER JOIN dosen b ON a.dosen_id=b.dosen_id WHERE a.jadwal_id = '$jadwal_id'")->result();

		return $q;
	}

	public function get_jadwal_ruangan($ta_id){
		$q  =$this->db->query("SELECT 
			a.*,b.mk_nama,c.ruang_kode,e.dosen_nama,c.ruang_status 
			FROM jadwal a INNER JOIN mata_kuliah b ON a.mk_id=b.mk_id INNER JOIN ruang c ON a.ruang_id=c.ruang_id INNER JOIN dosen e ON a.dosen_id=e.dosen_id WHERE a.ta_id = '$ta_id' ORDER BY a.jadwal_id ASC")->result();
		return $q;
	}
	private function listJadwalPerProdi($prodi, $ta_id){
		$prodi = $prodi == 'all' ? 'IS NOT NULL' : ' = '.$prodi;
		$ta_id = $ta_id  ? $ta_id : 3;
		return $this->db->query("
			SELECT jadwal.*, mata_kuliah.mk_nama, mata_kuliah.mk_kode, mata_kuliah.prodi_id, ruang.ruang_kode, ruang.ruang_lantai, gedung.gedung_nama, gedung.gedung_lokasi
			FROM jadwal
			LEFT JOIN mata_kuliah ON jadwal.mk_id = mata_kuliah.mk_id
			LEFT JOIN ruang ON jadwal.ruang_id = ruang.ruang_id
			LEFT JOIN gedung ON ruang.gedung_id = gedung.gedung_id
			WHERE jadwal.ta_id = '$ta_id' AND mata_kuliah.prodi_id $prodi
		")->result();
	}
}
