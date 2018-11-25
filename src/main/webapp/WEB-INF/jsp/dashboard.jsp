<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<html lan="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/material-design-iconic-font.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-select.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/malihu-scrollbar/jquery.mCustomScrollbar.min.css" rel="stylesheet">
    <link href="css/sweetalert2.css" rel="stylesheet">
    <link href="css/jquery.bootgrid.min.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="css/app.min.1.css" rel="stylesheet">
    <link href="css/app.min.2.css" rel="stylesheet">
    <title></title>
</head>
<body>

<c:import url="./header.jsp"></c:import>
<!--Le sidebar/navigation drawer (android) -->
<c:import url="./sidebar.jsp"></c:import>

<!--Le header/toolbar la barre en haut qui contient les notification et les traitements generaux  -->
<header id="header" class="clearfix" data-current-skin="bluegray">

    <ul class="header-inner" style="display: inline-flex; width: 100%;">
        <li id="menu-trigger" data-trigger="#sidebar" class="">
            <div class="line-wrap">
                <div class="line top"></div>
                <div class="line center"></div>
                <div class="line bottom"></div>
            </div>
        </li>
        <!--
                <li class="logo hidden-xs" style="position: absolute; right: 0px;" >
                    <img src="img/Dev17.png" style="height:53px;">
                </li>
        -->
    </ul>






</header>
<!--Le sidebar/navigation drawer (android) -->
<!-- L'interface principale -->


<section id="main">
    <!--Le contenu central -->
    <section id="content">
        <div class="container" >
            <div class="row">
                <div class="card">
                        <div class="card-header">
                            <h2>Bonjour Monsieur :)</h2>
                        </div>

                        <div class="table-responsive">
                           
                        </div>
                    </div>

            </div>

            <div class="row">
                <div class="col-md-6" >
                    <div class="card">
                        <div class="card-header">
                            <h2>Catalogue</h2>

                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Intitulé</th>
                                        <th>location</th>
                                        <th>Vente</th>
                                        <th>Evaluation</th>
                                    </tr>
                                </thead>
                                <tbody>

                                <c:if test="${carsList.size()>0}">
                                <c:forEach begin="0" end="${carsList.size()-1}" varStatus="loop">
                                         <tr class="clickable-row"  data-href='management_get_car_web.html?car_id=${carsList.get(loop.index).id}' >
                                            <td><img src="img/mer.jpg" height="70px" width="100px" /></td>
                                            <td>${carsList.get(loop.index).brand}  ${carsList.get(loop.index).model}</td>
                                            <td>${carsList.get(loop.index).rent_price} $</td>
                                            <td>${carsList.get(loop.index).sell_price} $</td>
                                            <td>
                                                <div class="rl-star">
                                                    <i class="zmdi zmdi-star active"></i>
                                                    <i class="zmdi zmdi-star active"></i>
                                                    <i class="zmdi zmdi-star active"></i>
                                                    <i class="zmdi zmdi-star"></i>
                                                    <i class="zmdi zmdi-star"></i>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>


                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h2>Voitures Louées</h2>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Intitulé</th>
                                        <th>Début</th>
                                        <th>Fin</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="clickable-row" data-href='www.google.com'>
                                        <td class="text-center">1</td>
                                        <td>Mercedes Benz</td>
                                        <td>25/11/2018</td>
                                        <td>12/12/2018</td>
                                        
                                        <td >
                                            <ul class="actions text-center">
                                            <li>
                                        <a href="">
                                            <i class="zmdi zmdi-arrow-left"></i>
                                        </a>
                                    </li>
                                </ul>


                                        </td>
                                    </tr>
                                

                                </tbody>


                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h2>Réservations</h2>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Intitulé</th>
                                        <th>Début</th>
                                        <th>Fin</th>
                                        <th>Ordre</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="clickable-row" data-href='www.google.com'>
                                        <td class="text-center">1</td>
                                        <td>Mercedes Benz</td>
                                        <td>25/11/2018</td>
                                        <td>12/12/2018</td>
                                        <td class="text-center">
                                            10
                                        </td>
                                        <td >
                                            <ul class="actions text-center">
                                            <li>
                                        <a href="">
                                            <i class="zmdi zmdi-delete"></i>
                                        </a>
                                    </li>
                                </ul>


                                        </td>
                                    </tr>
                                

                                </tbody>


                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h2>Achats</h2>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Intitulé</th>
                                        <th>Date</th>
                                        <th class="text-center">Prix d'achat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="clickable-row" data-href='www.google.com'>
                                        <td class="text-center">1</td>
                                        <td>Mercedes Benz</td>
                                        <td>12/12/2018</td>
                                        <td class="text-center">
                                            10
                                        </td>
                   
                                    </tr>
                                

                                </tbody>


                            </table>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </section>


</section>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>

<script type="text/javascript" src="js/waves.min.js"></script>
<script type="text/javascript" src="js/sweetalert2.min.js"></script>
<!--Bibliotheque pour le sidebar -->
<script type="text/javascript" src="js/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/flot/jquery.flot.js"></script>
<script src="js/flot/jquery.flot.resize.js"></script>
<script src="js/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="js/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="js/flot.curvedlines/curvedLines.js"></script>
<script src="js/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="js/flot-charts/bar-chart.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<script type="text/javascript" src="js/functions_dashboard.js"></script>

</body>

</html>