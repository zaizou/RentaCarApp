<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript" src="js/moment.js"></script>

<!--Le header/toolbar la barre en haut qui contient les notification et les traitements generaux  -->
<c:import url="./header.jsp"></c:import>
<!--Le sidebar/navigation drawer (android) -->
<c:import url="./sidebar.jsp"></c:import>
<!-- L'interface principale -->


<section id="main">
    <!--Le contenu central -->
    <section id="content">
        <div class="container">


            <div class=" card col-sm-12">

                <c:import url="dashboard_pages/resume_magasins.jsp">
                </c:import>
            </div>


            <script>
                var years = new Array();
                var yearsTransfert = new Array();
                var mois = new Array();
                var magasins = new Array();

                var testMontant = 0;
            </script>


            <c:set var="count" scope="session" value="${0}}"/>


            <c:if test="${listMagasins.size() >0}">
                <c:forEach begin="0" end="${listMagasins.size()-1}" varStatus="loop">
                    <c:set var="count" scope="session" value="${loop.index}"/>

                    <div class="row" id="magasin${loop.index}">

                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2 id="titleCompta${loop.index}">Recettes et Dépenses #</h2>

                                </div>

                                <div class="card-body card-padding-sm">
                                    <div id="bar-chart${loop.index}" class="flot-chart"></div>
                                    <div class="flc-bar${loop.index}"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2 id="titleTransert${loop.index}">Transferts #</h2>

                                </div>

                                <div class="card-body">
                                    <div id="transfert-bar-chart${loop.index}" class="flot-chart"></div>
                                    <div class="transfert-flc-bar${loop.index}"></div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <script>
                        var magasin = new Object();
                        magasin.id = "${listMagasins.get(count).idMagasin}";
                        magasin.nom = "${listMagasins.get(count).nomMagazin}";
                        magasin.nomResponsable = "${listMagasins.get(count).responsableMagasin.nom}";
                        magasin.prenomResponsable = "${listMagasins.get(count).responsableMagasin.prenom}";
                        magasin.comptas = new Array();
                        magasin.depenses = new Array();

                        var dat;


                        <c:if test="${listMagasins.get(count).comptabiliteMagasin!=null}">
                        <c:if test="${listMagasins.get(count).comptabiliteMagasin.size()>0}">
                        <c:forEach begin="0" end="${listMagasins.get(count).comptabiliteMagasin.size()-1}" varStatus="loop">
                        dat = "${listMagasins.get(count).comptabiliteMagasin.get(loop.index).dateCompta}";
                        if (years.indexOf(moment(dat).year()) < 0) {
                            years[years.length] = moment(dat).year();
                            magasin.comptas[years.indexOf(moment(dat).year())] = new Array();
                            magasin.depenses[years.indexOf(moment(dat).year())] = new Array();

                            for (i = 0; i < 12; i++) {
                                magasin.comptas[years.indexOf(moment(dat).year())][i] = 0;
                                magasin.depenses[years.indexOf(moment(dat).year())][i] = 0;
                            }

                        }


                        magasin.comptas[years.indexOf(moment(dat).year())][moment(dat).month()] += parseFloat(${listMagasins.get(count).comptabiliteMagasin.get(loop.index).montantCompta});
                        magasin.depenses[years.indexOf(moment(dat).year())][moment(dat).month()] += parseFloat(${listMagasins.get(count).comptabiliteMagasin.get(loop.index).depense});


                        </c:forEach>
                        </c:if>
                        </c:if>

                        <c:if test="${listMagasins.get(count).comptabiliteMagasin!=null || listMagasins.get(count).comptabiliteMagasin.size() <=0}">

                        magasin.comptas[years.indexOf(moment(dat).year())]=    [moment(dat).month()]
                        </c:if>



                        magasin.transferts = new Array();


                        <c:if test="${listMagasins.get(count).transfertsMagasin!=null}">
                        <c:if test="${listMagasins.get(count).transfertsMagasin.size()>0}">
                        <c:forEach begin="0" end="${listMagasins.get(count).transfertsMagasin.size()-1}" varStatus="loop">

                        dat = "${listMagasins.get(count).transfertsMagasin.get(loop.index).dateTransfert}";

                        if (yearsTransfert.indexOf(moment(dat).year()) < 0) {
                            yearsTransfert[yearsTransfert.length] = moment(dat).year();
                            magasin.transferts[yearsTransfert.indexOf(moment(dat).year())] = new Array();
                            for (i = 0; i < 12; i++)

                                magasin.transferts[yearsTransfert.indexOf(moment(dat).year())][i] = 0;


                        }
                        magasin.transferts[yearsTransfert.indexOf(moment(dat).year())][moment(dat).month()] += parseFloat(${listMagasins.get(count).transfertsMagasin.get(loop.index).montantTransfert});

                        </c:forEach>
                        </c:if>
                        </c:if>

                        magasins.push(magasin);

                    </script>

                </c:forEach>
            </c:if>


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

<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/flot/jquery.flot.js"></script>
<script src="js/flot-orderBars/js/jquery.flot.pie.js"></script>
<script src="js/flot/jquery.flot.resize.js"></script>
<script src="js/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="js/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="js/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<!--

<script src="js/flot-charts/curved-line-chart.js"></script>

-->

<script type="text/javascript" src="js/jquery.bootgrid.js"></script>
<script type="text/javascript" src="js/jquery.bootgrid.updated.min.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<script type="text/javascript" src="js/functions_dashboard.js"></script>

</body>

</html>