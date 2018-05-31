<?php namespace ProcessWire;
/**
 *
 * @var $page Page
 * @var $factory \TemplateEngineFactory
 * @var $view \TemplateEngineFactory
 */

$subtpl = $factory->load('basic-page');
$subtpl->set('title', $title);

$content = $subtpl->render();

$view->set('content', $content);


