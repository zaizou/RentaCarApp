<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card section-create" style="display:none">
    <!--L'entete de la page' -->

    <div class="card-header">
        <div class="row">
            <div class="col-sm-9">
                <h2>Fiche Utilisateur
                    <small>Affichage des informations sur l'Utilisateur</small>
                </h2>

                <div class=""></div>
                <button class="btn btn-login compte-create-submit">Ajouter le véhicule
                </button>
                <button class="btn btn-login btn-danger compte-create_cancel">Annuler</button>


            </div>
            <div class="col-sm-3" dir="rtl">
                <a href="#"
                   class="btn btn-login btn-danger btn-float waves-effect waves-circle waves-float section-return-btn"><i
                        class="zmdi zmdi-arrow-left"></i></a>
            </div>


        </div>
    </div>


    <div class="card-contenu ">
        <div class="panel-group p-l-20" role="tablist" aria-multiselectable="true">
            <div class="panel panel-collapse">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="false" aria-controls="collapseOne">
                            Présentation
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="fg-line">
                                <input id="creat_input_brand" placeholder="brand" class="form-control compte">
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="fg-line">
                                <input id="creat_input_model" placeholder="model" class="form-control compte">
                                </div>
                            </div>


                            <div class="col-sm-4">
                                <div class="fg-line">
                                    <input id="creat_input_circulation_year" placeholder="Année de ciculation" class="form-control compte">
                                </div>
                            </div>


                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="fg-line">
                                <input id="creat_input_description" placeholder="description"  type="text" class="form-control compte">
                                    </div>
                            </div>
                        </div>
                        <br/>
                    </div>
                </div>
            </div>


            <div class="panel panel-collapse">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                           aria-expanded="false" aria-controls="collapseThree">
                            Motorisation
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="collapse in" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="fg-line">
                                <input  id="creat_input_cylinders_number" placeholder="Nombre de cylindres" type="text" class="form-control compte">
                                    </div>
                            </div>

                            <div class="col-sm-8">
                                <div class="fg-line">
                                <input id="creat_input_maxspeed" placeholder="Vitesse Max" type="text" class="form-control compte">
                                    </div>
                            </div>
                        </div>
                        <br/>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>