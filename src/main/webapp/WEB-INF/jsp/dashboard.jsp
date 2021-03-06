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
    <style>
        .star-rating {
            line-height:32px;
            font-size:1.25em;
        }

        .star-rating .fa-star{color: yellow;}
    </style>
</head>
<body>

<c:import url="./header.jsp"></c:import>
<!--Le sidebar/navigation drawer (android) -->
<c:import url="./sidebar.jsp"></c:import>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>

            var ratesTab;
            $.ajax(
                {
                    type: "GET",
                    url: "http://data.fixer.io/api/latest?access_key=e89947dd575d22268b627200651ecc1f&format=1"
                }
            )
            .done(function (data) {
               console.log(data);
               console.log(data.rates["EUR"]);
                rates = data;
            })
            .error(function (data) {
                console.log("Error loading currencies");

            });

</script>


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
                                <c:if test="${rents.size() >0}">
                                <c:forEach begin="0" end="${rents.size() - 1}" varStatus="loop">
                                    <c:if test="${rents.get(loop.index).ordre == 1}">
                                    <tr class="clickable-row">
                                        <td class="text-center">${loop.index+1}</td>
                                        <td class="tb-model">${rents.get(loop.index).car_id.brand} ${rents.get(loop.index).car_id.model}</td>
                                        <td class="tb-date-from">${rents.get(loop.index).date_from}</td>
                                        <td class="tb-date-to">${rents.get(loop.index).date_to}</td>

                                        <td >
                                            <ul class="actions text-center">
                                                <li>
                                                    <a class="rent_end" id="${rents.get(loop.index).id}">
                                                        <i class="zmdi zmdi-arrow-left " ></i>
                                                    </a>
                                                </li>
                                            </ul>


                                        </td>
                                    </tr>
                                    </c:if>
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
                                <c:if test="${rents.size() >0}">
                                    <c:forEach begin="0" end="${rents.size() - 1}" varStatus="loop">
                                        <c:if test="${rents.get(loop.index).ordre > 1}">
                                        <tr class="clickable-row">
                                            <td class="text-center-res">${loop.index+1}</td>
                                            <td class="tb-model-res">${rents.get(loop.index).car_id.brand} ${rents.get(loop.index).car_id.model}</td>
                                            <td class="tb-date-from-res">${rents.get(loop.index).date_from}</td>
                                            <td class="tb-date-to-res">${rents.get(loop.index).date_to}</td>
                                            <td class="tb-date-ordre-res">${rents.get(loop.index).ordre}</td>
                                            <td class="tb-car-id-res" style="display: none;">${rents.get(loop.index).car_id.id}</td>

                                            <td >
                                                <ul class="actions text-center">
                                                    <li>
                                                        <a class="reservation_end"  data-action="${rents.get(loop.index).car_id.id}" id="${rents.get(loop.index).id}">
                                                            <i class="zmdi zmdi-arrow-left " ></i>
                                                        </a>
                                                    </li>
                                                </ul>


                                            </td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>


                                </tbody>


                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
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
                            <c:if test="${purchases.size() >0}">
                            <c:forEach begin="0" end="${purchases.size() - 1}" varStatus="loop">
                                <tr class="clickable-row">
                                    <td class="text-center">${loop.index}</td>
                                    <td>${purchases.get(loop.index).car_id.brand}  ${purchases.get(loop.index).car_id.model}</td>
                                    <td>${purchases.get(loop.index).purchase_date}</td>
                                    <td class="text-center">

                                        <script>
                                            var userCurrency = ${userCurrency.currency_name};
                                            var valu = ${purchases.get(loop.index).purchase_price};
                                            var ratesTab;
                                            var res = valu * data.rates[""+userCurrency];
                                            res;
                                            userCurrency;
                                            print(""+res+"  "+userCurrency+"   :"+valu);
                                            $(this).closest("td").append(""+res+"  "+userCurrency+"   :"+valu);
                                        </script>

                                    </td>

                                </tr>
                            </c:forEach>
                            </c:if>
                            </tbody>


                        </table>
                    </div>
                </div>
            </div>


        </div>
    </section>


</section>


<div class="modal fade" id="evalModal"  tabindex="1" role="dialog" aria-hidden="true">
    <div  class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Evaluation/5</h4>
            </div>
            <div class="modal-body">
                <input type="number" id="rent_rating_value" max="5" min="0">
            </div>
            <div class="modal-footer">
                <button type="button" id="renduConfirm" class="btn btn-primary waves-effect ">Valider</button>
                <button type="button" class="btn btn-link" data-dismiss="modal">Annuler
                </button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="js/jquery.barrating.min.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>

<script type="text/javascript" src="js/waves.min.js"></script>
<script type="text/javascript" src="js/sweetalert2.min.js"></script>


<!--Bibliotheque pour le sidebar -->
<script type="text/javascript" src="js/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<script type="text/javascript" src="js/functions_dashboard.js"></script>

</body>

</html>