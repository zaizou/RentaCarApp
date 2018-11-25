<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="UTF-8">
    <title>3B Internationnale</title>

    <link href='./3B-Internationle_files/fonts/fonts.googleapis.com-1.css' rel='stylesheet' type='text/css'>
    <link href='./3B-Internationle_files/fonts/fonts.googleapis.com-2.css' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="./3B-Internationle_files/css/materialize.css">
    <link href="./3B-Internationle_files/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="./3B-Internationle_files/css/app_nat.css">
    <link rel="stylesheet" href="./3B-Internationle_files/css/font-awesome.css">


    <link rel="stylesheet" href="./3B-Internationle_files/css/normalize.css">


    <link rel="stylesheet" href="./3B-Internationle_files/css/reset.css">
    <link rel="stylesheet" href="./3B-Internationle_files/css/style.css">
    <link rel="stylesheet" href="./3B-Internationle_files/css/shop_app_index.css">
    <link rel="stylesheet" href="./3B-Internationle_files/css/special_styles.css">


    <link rel="apple-touch-icon" sizes="57x57" href="./3B-Internationle_files/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="./3B-Internationle_files/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="./3B-Internationle_files/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="./3B-Internationle_files/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="./3B-Internationle_files/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="./3B-Internationle_files/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="./3B-Internationle_files/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="./3B-Internationle_files/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="./3B-Internationle_files/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="./3B-Internationle_files/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./3B-Internationle_files/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="./3B-Internationle_files/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./3B-Internationle_files/favicon/favicon-16x16.png">
    <link rel="manifest" href="./3B-Internationle_files/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="./3B-Internationle_files/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">


    <script src="./3B-Internationle_files/modernizr.js"></script>


</head>

<body style="background-color: white">


<!--


<div id="fb-root"></div>
<script>(function (d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s);
js.id = id;
js.src = "//connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v2.7&appId=1241675209216338";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

-->

<header>


    <div id="topHead" class="modal-fixed-footer row" style="margin-bottom: 0px">

        <div class="offset-l1 offset-s1 col l5 s11 ">
            <div class="col "><i class="topHIc zmdi zmdi-phone"></i>+213.560.06.72</div>
            <div class="col"><i class="topHIc zmdi zmdi-email"></i><a href="mailto:sarl3btrading@yahoo.fr"
                                                                      style="color : #FFFFFF">
                sarl3bTrading@yahoo.fr</a></div>
        </div>
        <div class="offset-s2 offset-l1 col l5 s10 ">
            <ul class=" ">
                    <span><a href="https://www.facebook.com/pages/3B-International-Trading/875526565846772?pnref=lhc"
                             class="topHIc fa fa-facebook"></a></span>
                <span><a href="https://twitter.com/3binternational" class="topHIc fa fa-twitter"></a></span>
                <span><a href="http://www.3b-international.com/web/#" class="topHIc fa fa-google-plus"></a></span>
                <span><a href="http://www.3b-international.com/web/#" class="topHIc fa fa-linkedin"></a></span>
            </ul>
        </div>

    </div>

    <div class="">

        <nav id="headerToobar">
            <div class="nav-wrapper">

                <a href="#" class="brand-logo hide-on-small-and-down " style="margin-left: 100px"><img
                        src="3B-Internationle_files/99.png" width="180" height="60"></a>
                <div class="row"></div>
                <ul id="topMenu" class="right">
                    <li class="main-menu-elem"><a href="" style="color: #0a0a0a">Accueil</a></li>
                    <li class="main-menu-elem"><a href="#section-nos-chaussures" style="color: #0a0a0a">Chaussures</a>
                    </li>
                    <li class="main-menu-elem"><a href="#section-nos-habim" style="color: #0a0a0a">Habillements</a></li>
                    <li class="main-menu-elem"><a href="#nos-marques" style="color: #0a0a0a">Marques</a></li>
                    <li class="main-menu-elem"><a href="#contact" style="color: #0a0a0a">Contact</a></li>
                    <li class="main-menu-elem"><a href="/shop.html" style="color: #0a0a0a">Shop</a></li>
                    <li class=" main-menu-elem"><a href="/management_gestion_dashboard.html" style="color: #0a0a0a">Management</a>
                    </li>
                </ul>


            </div>
        </nav>
    </div>

</header>





<!-- Magasins Haut-->

<c:set var="magasins_count" scope="page" value="${0}"/>
<c:set var="opened_rows" scope="page" value="${0}"/>
<c:set var="opened_rows" value="${opened_rows + 1}" scope="page"/>

<c:forEach begin="1" end="${magasinsHauts.size()  }" varStatus="loop">
    <c:set var="magasins_count" scope="page" value="${magasins_count+1}"/>
    <div class="cd-member-bio member-haut-${magasins_count}">

        <!-- cd-member-bio-pict -->

        <div class="cd-bio-content">
            <br>
            <br>
            <div class="title-section text-center" id="mag-${magasinsHauts.get(loop.index-1).idMagasin}"
                 style="margin-bottom: 30px;">
                <h2>${magasinsHauts.get(loop.index-1).nomMagazin}</h2>
                <span></span>
            </div>


            <div class="col m4 col s6">
                <h4 class="widget-title">Comfort Footwear</h4>
                <br>
                <div class="contactMagasin-info">
                    <span><i
                            class="fa fa-home topHIc"></i>${magasinsHauts.get(loop.index-1).adresseMagasin}</span><br><br>
                    <span><i class="fa fa-phone topHIc"></i>${magasinsHauts.get(loop.index-1).telephone}</span>
                </div>

                <br>


                <c:if test="${magasinsHauts.get(loop.index-1).placeId !=null || magasinsHauts.get(loop.index-1).placeId.length()>0}">


                    <div class="title-section text-center" style="margin-bottom: 30px;">
                        <h2>Carte</h2>
                        <span></span>
                    </div>

                    <div class="container" id="map-zone-${magasinsHauts.get(loop.index-1).idMagasin}"
                         style="height: 300px">
                        <iframe width="500" height="300" frameborder="0" style="border:0"
                                src="https://www.google.com/maps/embed/v1/place?q=place_id:${magasinsHauts.get(loop.index-1).placeId}&key=AIzaSyAPxdVHyy-XjsleaF_oeWrmAOJBkhdkWrI"
                                allowfullscreen></iframe>
                    </div>


                    <br>


                </c:if>


                <c:if test="${magasinsHauts.get(loop.index-1).videoId !=null || magasinsHauts.get(loop.index-1).videoId.length()>0 }">
                    <div class="title-section text-center" style="margin-bottom: 30px;">
                        <h2>Vidéo du Magasin</h2>
                        <span></span>
                    </div>

                    <div class="container" id="vid-${magasinsHauts.get(loop.index-1).idMagasin}" style="height: 300px">
                        <iframe width="500" height="300"
                                src="https://www.youtube.com/embed/${magasinsHauts.get(loop.index-1).videoId}"
                                frameborder="0"
                                allowfullscreen></iframe>
                    </div>

                </c:if>

                <br>


            </div>


            <c:if test="${magasinsHauts.get(loop.index-1).imagesMagasin.size()>0}">


            <div class="mag-photos">

                <div class="title-section text-center" style="margin-bottom: 30px;font-size: large">
                    <h2>Photos du Magasin</h2>
                    <span></span>
                </div>
                <div class="container-mag">


                    <c:forEach begin="0" end="${magasinsHauts.get(loop.index-1).imagesMagasin.size()-1}"
                               varStatus="loopb">


                    <c:if test="${loopb.index % 2 == 0}">
                    <div class="row">
                        </c:if>
                        <img src="${magasinsHauts.get(loop.index-1).imagesMagasin.get(loopb.index).path}">

                        </c:forEach>


                        <c:forEach begin="0" end="${((magasinsHauts.get(loop.index-1).imagesMagasin.size()+1)/2)-1}"
                                   varStatus="loopc">
                    </div>

                    </c:forEach>

                </div>

                </c:if>


            </div>


        </div>
        <!-- cd-bio-content -->
    </div>


</c:forEach>


<!-- Magasins Bas-->

<c:set var="magasins_count" scope="page" value="${0}"/>
<c:set var="opened_rows" scope="page" value="${0}"/>
<c:set var="opened_rows" value="${opened_rows + 1}" scope="page"/>


<c:if test="${magasinsBas.size()>0}">


<c:forEach begin="1" end="${magasinsBas.size()}" varStatus="loop">
<c:set var="magasins_count" scope="page" value="${magasins_count+1}"/>
<div class="cd-member-bio member-bas-${magasins_count}">

    <!-- cd-member-bio-pict -->

    <div class="cd-bio-content">
        <br>
        <br>
        <div class="title-section text-center" id="mag-${magasinsBas.get(loop.index-1).idMagasin}"
             style="margin-bottom: 30px;">
            <h2>${magasinsBas.get(loop.index-1).nomMagazin}</h2>
            <span></span>
        </div>


        <div class="col m4 col s6">
            <h4 class="widget-title">Comfort Footwear</h4>
            <br>
            <div class="contactMagasin-info">
                    <span><i class="fa fa-home topHIc"></i>${magasinsBas.get(loop.index-1).adresseMagasin}</span><br><br>
                <span><i class="fa fa-phone topHIc"></i>${magasinsBas.get(loop.index-1).telephone}</span>
            </div>

            <br>


            <c:if test="${magasinsBas.get(loop.index-1).placeId !=null || magasinsBas.get(loop.index-1).placeId.length()>0}">

                <div class="title-section text-center" style="margin-bottom: 30px;">
                    <h2>Carte</h2>
                    <span></span>
                </div>


                <div class="container" id="map-zone-${magasinsBas.get(loop.index-1).idMagasin}"
                     style="height: 300px">
                    <iframe width="500" height="300" frameborder="0" style="border:0"
                            src="https://www.google.com/maps/embed/v1/place?q=place_id:${magasinsBas.get(loop.index-1).placeId}&key=AIzaSyAPxdVHyy-XjsleaF_oeWrmAOJBkhdkWrI"
                            allowfullscreen></iframe>
                </div>

                <br>
            </c:if>


            <c:if test="${magasinsBas.get(loop.index-1).videoId !=null || magasinsBas.get(loop.index-1).videoId != \"\"}">


                <div class="title-section text-center" style="margin-bottom: 30px;">
                    <h2>Vidéo du Magasin</h2>
                    <span></span>
                </div>

                <div class="container" id="vid-${magasinsBas.get(loop.index-1).idMagasin}"
                     style="height: 300px">
                    <iframe width="500" height="300"
                            src="https://www.youtube.com/embed/${magasinsBas.get(loop.index-1).videoId}"
                            frameborder="0"
                            allowfullscreen></iframe>
                </div>

            </c:if>

            <br>


        </div>


        <c:if test="${magasinsBas.get(loop.index-1).imagesMagasin.size()>0}">


        <div class="mag-photos">

            <div class="title-section text-center" style="margin-bottom: 30px;font-size: large">
                <h2>Photos du Magasin</h2>
                <span></span>
            </div>
            <div class="container-mag">


                <c:forEach begin="0" end="${magasinsBas.get(loop.index-1).imagesMagasin.size()-1}" varStatus="loopb">


                <c:if test="${loopb.index % 2 == 0}">
                <div class="row">
                    </c:if>
                    <img src="${magasinsBas.get(loop.index-1).imagesMagasin.get(loopb.index).path}">

                    </c:forEach>


                    <c:forEach begin="0" end="${((magasinsBas.get(loop.index-1).imagesMagasin.size()+1)/2)-1}"
                               varStatus="loopc">
                </div>

                </c:forEach>

            </div>

            </c:if>


        </div>
        <!-- cd-bio-content -->
    </div>


    </c:forEach>

    </c:if>


    <!-- cd-bio-content -->
</div>

<a href="#0" class="cd-member-bio-close">Close</a>





</body>


<script src="./3B-Internationle_files/jquery-1.10.2.min.js"></script>
<script src="./3B-Internationle_files/materialize.js"></script>
<script src="./3B-Internationle_files/js/snap.svg-min.js"></script>
<script src="./3B-Internationle_files/js/main_index.js"></script>

</html>