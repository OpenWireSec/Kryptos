<?php
require_once 'core/Init.php';


$page = new Page;
$page->setTitle('Results');
$page->startBody();
?>

    <div class="row">
        <div class="col-md-12">

            <div class="tabs-vertical-env">

                <ul class="nav tabs-vertical">
                    <li class="active"><a href="#v-home" data-toggle="tab">Hosts <div style="float: right"><span class="badge badge-primary badge-roundless">1</span></div></a></li>
                    <li><a href="#v-profile" data-toggle="tab">Vulnerabilities <div style="float: right"><span class="badge badge-primary badge-roundless">1</span></div></a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="v-home">

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="panel-title">Hosts</div>

                                <div class="panel-options">
                                    <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                                    <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                                </div>
                            </div>
                            <table class="table table-bordered datatable" id="table-1">
                                <thead>
                                <tr>
                                    <th>Host</th>
                                    <th>Vulnerabilities</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td>192.168.1.1</td>
                                    <td><div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" style="width: 30%">
                                                <span class="sr-only">30% Complete (success)</span>
                                            </div>
                                            <div class="progress-bar progress-bar-warning" style="width: 20%">
                                                <span class="sr-only">15% Complete (warning)</span>
                                            </div>
                                            <div class="progress-bar progress-bar-danger" style="width: 40%">
                                                <span class="sr-only">40% Complete (danger)</span>
                                            </div>
                                        </div></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>


                    <div class="tab-pane" id="v-profile">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="panel-title">Vulnerabilities</div>

                                <div class="panel-options">
                                    <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                                    <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                                </div>
                            </div>
                            <table class="table table-bordered datatable" id="table-2">
                                <thead>
                                <tr>
                                    <th width="3%">Severity</th>
                                    <th>Plugin Name</th>
                                    <th>Plugin Family</th>
                                    <th>Count</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td><button type="button" class="btn btn-warning">Warning</button></td>
                                    <td>MS08_065</td>
                                    <td>Win 2k/Win XP</td>
                                    <td class="center">4</td>
                                </tr>
                                </tbody>
                            </table>

                            <script type="text/javascript">
                                jQuery(document).ready(function($)
                                {
                                    $("#table-1").dataTable({
                                        "sPaginationType": "bootstrap",
                                        "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                                        "bStateSave": true
                                    });

                                    $("#table-2").dataTable({
                                        "sPaginationType": "bootstrap",
                                        "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                                        "bStateSave": true
                                    });

                                    $(".dataTables_wrapper select").select2({
                                        minimumResultsForSearch: -1
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
$page->endBody();
echo $page->render('includes/template.php');