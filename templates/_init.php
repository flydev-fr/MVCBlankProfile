<?php namespace ProcessWire;


if($config->debug == true) {
    $assets_url = $config->urls->httpRoot . 'assets-dev/';
    $images_url = $config->urls->httpRoot . 'assets-dev/images/';
    $bowercomp = $config->urls->httpRoot . 'assets-dev/bower_components/';
    $nodecomp = $config->urls->httpRoot . 'assets-dev/node_modules/';
} else {
    $assets_url = $config->urls->templates . 'assets/';
    $images_url = $config->urls->templates . 'assets/images/';
}

$homepage = $pages->get('/');
$title = $page->get('headline|title');
$content = $page->body;
$sidebar = $page->sidebar;


$view->set('assets_url', $assets_url);
if($config->debug == true) {
    $view->set('bowercomp', $bowercomp);
    $view->set('nodecomp', $nodecomp);
}
$view->set('images_url', $images_url);
$view->set('homepage', $homepage);
$view->set('title', $title);
$view->set('content', $content);
$view->set('sidebar', $sidebar);


// Include shared functions
include_once("./_func.php");
