<?php 

class Mata_kuliah_m extends MY_Model 
{
	public function __construct()
	{
		parent::__construct();
		$this->data['table_name']	= 'mata_kuliah';
		$this->data['primary_key']	= 'mk_id';
	}
}