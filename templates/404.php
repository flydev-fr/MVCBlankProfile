<?php namespace ProcessWire;
/**
 * @var $page Page
 * @var $factory \TemplateEngineFactory
 * @var $view \TemplateEngineFactory
 */

$subtpl = $factory->load('404');
$subtpl->set('title', $title);

$content = $subtpl->render();

$view->set('content', $content);
