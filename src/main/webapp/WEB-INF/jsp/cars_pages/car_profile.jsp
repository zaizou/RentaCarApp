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
    <style>
        td.disabled.disabled-date.day{
            color: #7C0A02;
            background-color: #9E9E9E;

        }
        td.disabled.disabled-date.day:hover{
            color: #7C0A02;
            background-color: #9E9E9E;

        }
    </style>
    <title></title>
</head>

<body>


<c:import url="../header.jsp"></c:import>

<c:import url="../sidebar.jsp"></c:import>




<section id="main">
    <!--Le contenu central -->
    <section id="content">
        <div class="container" >
            <div class="row">
                <div class="card">
                        <div class="card-header">
                            <h2>${car.brand}  ${car.model} </h2>
                        </div>

                        <script>
                            var current_car_id = ${car.id}
                            var current_user_id = "${pageContext.request.userPrincipal.getName()}";
                            var car_rent_price =${ (car.rent_price!=null) ? car.rent_price : 0};
                            var car_sell_price = ${ (car.sell_price!=null) ? car.rent_price :0  };
                        </script>

                        <div class="table-responsive">
                           
                        </div>
                    </div>

            </div>

            <div class="card" id="profile-main">
                        <div class="pm-overview c-overflow mCustomScrollbar _mCS_3 mCS-autoHide" style="overflow: visible;"><div id="mCSB_3" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical_horizontal mCSB_outside" style="max-height: none;" tabindex="0"><div id="mCSB_3_container" class="mCSB_container mCS_x_hidden mCS_no_scrollbar_x" style="position: relative; top: 0px; left: 0px; width: 100%;" dir="ltr">

                            <div class="pmo-pic">
                                <div class="p-relative">
                                    <a href="">
                                        <img class="img-responsive mCS_img_loaded" src="img/mer.jpg" alt="">
                                    </a>

                                    

                                    
                                </div>


                                <div class="pmo-stat">
                                    <div class="card rating-list">
                            <div class="card-header text-center">
                                <h2>Etat :  3.0/5.0 </h2>
                                <div class="rl-star">

                                    <i class="zmdi zmdi-star active"></i>
                                    <i class="zmdi zmdi-star active"></i>
                                    <i class="zmdi zmdi-star active"></i>
                                    <i class="zmdi zmdi-star"></i>
                                    <i class="zmdi zmdi-star"></i>
                                </div>
                            </div>
                            
                        </div>
                                </div>
                            </div>

                            <div class="pmo-block pmo-contact hidden-xs">
                                <h2>Actions</h2>

                                

                                        <button id="modal-rent-btn" class="btn btn-primary btn-block waves-effect align-right">Louer | Réserver</button>
                                        <button id="modal-rend-btn" class="btn btn-green btn-block waves-effect align-right">Rendre</button>
                                <!--
                                <a data-toggle="modal" href="#rentModal" class="btn btn-primary btn-block waves-effect align-right">Louer</a>
                                <a data-toggle="modal" href="#rentModal" class="btn btn-sm btn-default waves-effect">Modal -
                                    Large</a>
                                    -->
                                    
                                    
                                        <button id="modal-buy-btn" class="btn btn-default btn-block waves-effect">Acheter</button>
                                    
                                    
                                
                            </div>

                            
                        </div></div><div id="mCSB_3_scrollbar_vertical" class="mCSB_scrollTools mCSB_3_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_3_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 617px; max-height: 713px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 50px;"></div></div><div class="mCSB_draggerRail"></div></div></div><div id="mCSB_3_scrollbar_horizontal" class="mCSB_scrollTools mCSB_3_scrollbar mCS-minimal-dark mCSB_scrollTools_horizontal" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_3_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 50px; width: 0px; left: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar"></div></div><div class="mCSB_draggerRail"></div></div></div></div>

                        <div class="pm-body clearfix">
                            <ul class="tab-nav tn-justified">
                                <!--
                                <li class="active"><a href="profile-about.html">About</a></li>
                                <li><a href="profile-timeline.html">Timeline</a></li>
                                <li><a href="profile-photos.html">Photos</a></li>
                                <li><a href="profile-connections.html">Connections</a></li>
                            -->
                            </ul>


                            <div class="pmb-block">
                                <div class="pmbb-header">
                                    <h2><i class="zmdi zmdi-present-to-all m-r-10"></i> Présentation</h2>

                                </div>
                                <div class="pmbb-body p-l-30">
                                    <div class="pmbb-view">

                                    </div>

                                    <div class="pmbb-edit">
                                        <div class="fg-line">
                                            <textarea class="form-control" rows="5" placeholder="Summary...">${car.description}</textarea>
                                        </div>
                                        <div class="m-t-10">
                                            <button class="btn btn-primary btn-sm waves-effect">Save</button>
                                            <button data-ma-action="profile-edit-cancel" class="btn btn-link btn-sm waves-effect">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="pmb-block">
                                <div class="pmbb-header">
                                    <h2><i class="zmdi zmdi-equalizer m-r-10"></i> Moteur</h2>

                                  
                                </div>
                                <div class="pmbb-body p-l-30">
                                    <div class="pmbb-view">
                                        <dl class="dl-horizontal">
                                            <dt>Nombre de cylindres</dt>
                                            <dd>${car.cylinders_number}</dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Nombre de soupapes par cylindre</dt>
                                            <dd>${car.soupapes_number}</dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Cylindrée </dt>
                                            <dd>${car.cylinder_size} cc</dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Puissance din</dt>
                                            <dd>${car.din_power}</dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Couple moteur</dt>
                                            <dd>${car.motors_couple}</dd>
                                        </dl>
                                    </div>

                                    

                                  
                                </div>
                            </div>

                            <div class="pmb-block">
                                <div class="pmbb-header">
                                    <h2><i class="zmdi zmdi-trending-up m-r-10"></i> Performance</h2>

                                    
                                </div>
                                <div class="pmbb-body p-l-30">
                                    <div class="pmbb-view">
                                        <dl class="dl-horizontal">
                                            <dt>Vitesse maximum</dt>
                                            <dd>${car.max_speed} Km/h</dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Accéleration 0/100km/h </dt>
                                            <dd>${car.acceleration} sec</dd>
                                        </dl>
                                    </div>

                                    <div class="pmbb-edit">
                                        <dl class="dl-horizontal">
                                            <dt class="p-t-10">Mobile Phone</dt>
                                            <dd>
                                                <div class="fg-line">
                                                    <input type="text" class="form-control" placeholder="eg. 00971 12345678 9">
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt class="p-t-10">Email Address</dt>
                                            <dd>
                                                <div class="fg-line">
                                                    <input type="email" class="form-control" placeholder="eg. malinda.h@gmail.com">
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt class="p-t-10">Twitter</dt>
                                            <dd>
                                                <div class="fg-line">
                                                    <input type="text" class="form-control" placeholder="eg. @malinda">
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt class="p-t-10">Skype</dt>
                                            <dd>
                                                <div class="fg-line">
                                                    <input type="text" class="form-control" placeholder="eg. malinda.hollaway">
                                                </div>
                                            </dd>
                                        </dl>

                                        <div class="m-t-30">
                                            <button class="btn btn-primary btn-sm waves-effect">Save</button>
                                            <button data-ma-action="profile-edit-cancel" class="btn btn-link btn-sm waves-effect">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


        </div>




    </section>


</section>

<!-- Rent Modal -->

<div class="modal fade" id="rentModal"  tabindex="1" role="dialog" aria-hidden="true">
    <div  class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Période de la location</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-sm-4">
                        <p class="c-black f-500 m-b-20">Début</p>

                        <div class="input-group form-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
                            <div class="dtp-container">
                                <input id="rent_date_from" type="text" class="form-control date-picker" placeholder="Click here...">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <p class="c-black f-500 m-b-20">Fin</p>

                        <div class="input-group form-group">
                            <span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
                            <div class="dtp-container">
                                <input id="rent_date_to" type="text" class="form-control date-picker" placeholder="Click here...">
                            </div>
                        </div>
                    </div>


                </div>


            </div>
            <div class="modal-footer">
                <button type="button" id="rentConfirm" class="btn btn-primary waves-effect ">Louer</button>
                <button type="button" class="btn btn-link" data-dismiss="modal">Annuler
                </button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="buyModal"  tabindex="1" role="dialog" aria-hidden="true">
    <div  class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Période de la location</h4>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class='card-wrapper'></div>
                    <form>
                        <div class="card-body">
                            <div class="fg-line">
                                <input type="text" class="form-control input-sm" name="number" placeholder="Numéro de la carte">
                            </div>
                            <div class="fg-line">
                                <input id="payment_prenom" type="text" class="form-control input-sm"  name="first-name" placeholder="Nom complet">
                            </div>
                            <div class="fg-line">
                                <input type="text" class="form-control input-sm" name="expiry" placeholder="Date d'expiration">
                            </div>
                            <div class="fg-line">
                                <input type="text" class="form-control input-sm"  name="cvc" placeholder="CVC">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="buyConfirm" class="btn btn-primary waves-effect ">Louer</button>
                <button type="button" class="btn btn-link" data-dismiss="modal">Annuler
                </button>
            </div>
        </div>
    </div>
</div>





<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>

<script type="text/javascript" src="js/waves.min.js"></script>
<script type="text/javascript" src="js/sweetalert2.min.js"></script>
<!--Bibliotheque pour le sidebar -->
<script type="text/javascript" src="js/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/jquery.card.js"></script>
<script src="js/card.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<script type="text/javascript" src="js/functions_car_profile.js"></script>



</body>

</html>