<?php

class Home extends NAILS_Controller
{
    public function index()
    {
        $this->load->view('home/index', $this->data);
    }
}
