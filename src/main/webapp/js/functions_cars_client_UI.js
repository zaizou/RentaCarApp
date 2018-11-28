/*Projet Comptable et Budgétaire functions*/
var compteEditMode = false;
var compteSelected = false;
var selectedCompte = -1;
var compteCreationMode = false;
var compteShowingMode = false;


var data_section = {
    code_section: 1,
    designation: "exploitation"
};


//Initialisation du tableau contenant les sections
$(document).ready(function () {

    //Initialisation



    //databinding

    var grid = $("#data-table-command").bootgrid({
        css: {
            icon: 'zmdi icon',
            iconColumns: 'zmdi-view-module',
            iconDown: 'zmdi-expand-more',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-expand-less'
        },
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"showingInfos btn btn-icon command-edit waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-assignment\"></span></button> ";
            }
        },


    }).on("loaded.rs.jquery.bootgrid", function () {


        grid.find('button.compte-suppr.extern').on("click", function (e) {
            var rows = Array();
            rows[0] = $(this).data("row-id");
            var idCar= $($(this).closest('tr')).find('td').eq(1).text();
            showRemoveCar(idCar, rows);

        }).end().find("button.showingInfos").on("click", function (e) {
            var rows = Array();
            rows[0] = $(this).data("row-id");
            var idCar = $($(this).closest('tr')).find('td').eq(1).text();
            window.location.href="management_get_car.html?id_car="+idCar;

        });
    });


    //
    $('button.section-create').on('click', function () {
        compteCreationMode = true;
        compteEditMode = false;
        compteShowingMode = false;
        afficherSection();
    });


//Click le bouton affichage d'une section
    $('button.showingInfos').on('click', function () {
        selectedCompte = $(this.closest('tr')).attr('data-row-id');
        compteShowingMode = true;
        compteCreationMode = false;
        compteEditMode = false;
        afficherSection();
    });


    //Click sur le bouton modifier (interne)
    $('button.compte-mod').on('click', function () {
        compteEditMode = true;
        compteShowingMode = false;
        compteCreationMode = false;
        afficherSection();
    });


    $('button.compte-create-submit').on('click', function () {
        showCreateCar();
    });


    $('button.compte-mod-save').on('click', function () {
        showEditCar();
    });


//Click sur le bouton  supprimer un chapitre
    $('button.chpitre-suppr').on('click', function () {

    });

    //Click sur le bouton  créer un chapitre
    $('button.rubrique-create-submit').on('click', function () {
        showCreateCar();

    });


    $('button.rubrique-create_cancel').on('click', function () {
        $("input.rubrique").val("");
        $('.card.section-detail').css('display', '');
        $('.card.rubrique-create').css('display', 'none');
    });

    $('a.rubrique-return').on('click', function () {
        //$( "input.chapitre" ).prop( "readonly", true );
        $('.card.section-detail').css('display', '');
        //$('.card.chapitre-create').addClass('animated fadeOuLeft');
        $('.card.rubrique-create').css('display', 'none');
        compteShowingMode = true;
    });


    function afficherCreateChapitre() {

        //$( "input.compte" ).prop( "readonly", false );
        $('.card.section-detail').css('display', 'none');
        $('.card.rubrique-create').css('display', '');
        $('.card.rubrique-create').addClass('animated fadeInLeft');
        compteShowingMode = false;

    }


    function afficherSection() {
        //affichage uniquement
        if (compteShowingMode) {
            $("input.compte").prop("readonly", true);
            $('button.compte-mod-save').css('display', 'none');
            $('button.compte-mod').css('display', '');
            $('button.compte-suppr').css('display', '');
            $('.card.section-detail').css('display', '');
        }
        if (compteEditMode) {
            $("input.compte").prop("readonly", false);
            $('button.compte-mod-save').css('display', '');
            $('button.compte-mod').css('display', 'none');
            $('button.compte-suppr.intern').css('display', 'none');
            $('.card.section-detail').css('display', '');
        }
        if (compteCreationMode)
            $('.card.section-create').css('display', '');


        $('.card.list-sections').css('display', 'none');

    }

//Click sur le bouton de retour
    $('a.btn-login.section-return-btn').on('click', function () {
        if (compteEditMode || compteShowingMode)
            $('.card.section-detail').css('display', 'none');
        if (compteCreationMode)
            $('.card.section-create').css('display', 'none');

        $('.card.list-sections').css('display', '');
    });


///Click sur le Bouton annuler de l'interface ceer une nouvelle section
    $('button.compte-create_cancel').on('click', function () {
        //alert("code section : "+data_section.code_section+"\ndesignation :"+data_section.designation);
        $("input.compte").val("");
        compteCreationMode = false;
        $('.card.section-create').css('display', 'none');
        $('.card.list-sections').css('display', '');


    });

    function showEditCar() {
        var codeChap = $('#edit_input_classes ').val();
        var designationChap = $('#edit_input_nom').val();
        swal({
            title: "Etes Vous Sure ?",
            text: "Voulez vous valider la modification du compte ?",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "Valider",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax(
                {
                    type: "POST",
                    url: "nomenclatures_chapitre_edit.html",
                    data: {code_chapitre: codeChap, designation: designationChap},
                    success: function (data) {
                        if (data == 100)
                            swal("Succès!", "Les Modifications sont effectuées avec succès", "success");
                        else
                            swal("Erreur", "Le Compte n'est pas modifié", "error");

                    }
                }
            )
                .done(function (data) {
                    swal("Succès!", "Les Modifications sont effectuées avec succès", "success");
                })
                .error(function (data) {
                    swal("Erreur", "Le Compte n'est pas modifié", "error");
                });
        });
    }





});