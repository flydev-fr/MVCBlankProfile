<?php namespace ProcessWire;
/**
 * @var Config $config
 * @var WireInput $input
 * @var Modules $modules
 * @var $user User
 * @var $sanitizer Sanitizer
 * @var $session Session
 * @var $pages Pages
 * @var $page Page
 */

if(!$config->ajax) :

    ?>

    <!DOCTYPE html>
    <html lang="<?php echo _x('en', 'HTML language code'); ?>">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title><?php echo $title; ?></title>
        <meta name="description" content="<?php echo $page->summary; ?>" />

        <?php if($config->debug == true) { ?>
            <link rel="stylesheet" type="text/css" href="<?= $assets_url ?>css/main.css" />
            <?php
            if (!$user->isLoggedin()) {
                echo "<link rel='stylesheet' type='text/css' href='{$assets_url}css/login.css' />";
            }
            ?>
        <?php } else { ?>
            <?php
            echo "<link id='main' rel='stylesheet' type='text/css' href='{$assets_url}dist/main.min.css'/>";
            if (!$user->isLoggedin()) {
                echo "<link id='login' rel='stylesheet' type='text/css' href='{$assets_url}dist/login.min.css'/>";
            }
            ?>
        <?php } ?>
    </head>

    <body class="<?php echo $page->template->name; if($sidebar) echo 'has-sidebar'; ?>">

<?php endif; // end ajax ?>


    <div id="content-drive">
        <?= $content ?>
    </div>


    <script type="text/javascript">
        <?php
        if(!function_exists('ProcessWire\\siteProtocol')) {
            function siteProtocol() {
                $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
                return $protocol;
            }
        }
        $jsConfig = $config->js();
        $jsConfig['debug'] = $config->debug;
        $jsConfig['protocol'] = siteProtocol();
        $jsConfig['httpHost'] = $config->httpHost;
        $jsConfig['pageid'] = $page->id;
        $jsConfig['pageclass'] = strtolower($page->name) . '-' . $page->id;
        $jsConfig['templateid'] = $page->template->id;
        $jsConfig['urls'] = array(
            'current' => $page->url,
            'root' => $config->urls->root,
            'templates' => $config->urls->templates
        );

        ?>
        var config = <?php echo json_encode($jsConfig); ?>;
    </script>


<?php if(!$config->ajax) { ?>

    <?php if($config->debug === true) { ?>
    <script src="<?= $assets_url ?>js/main.js"></script>
<?php } else { ?>
    <script id="main" src='<?= $assets_url ?>dist/main.min.js'></script>
<?php } ?>

    </body>
    </html>
<?php } ?>