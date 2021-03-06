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
    $.getJSON('nomenclatures_rubriques_list.json', {
        ajax: 'true'
    }, function (result) {
        var htln = "";
        for (var i = 0; i < result.rubriqueList.length; i++) {
            //alert("taille de la liste : "+result.sectionList.length+"taille du result :"+result.length+"  la section "+i+" "+result.sectionList[i].codeSection+" "+result.sectionList[i].designation);
            console.log("Section " + i);
            console.log("Code Section " + result.rubriqueList[i].codeRubrique);
            console.log("Designation" + result.rubriqueList[i].designation);
            htln += '<option value=';
            htln += "" + result.rubriqueList[i].codeRubrique;
            htln += '>';
            htln += "" + result.rubriqueList[i].designation;
            htln += '</option>';
        }
        //alert(htln);
        $("#rubrique-select-section")
            .html(htln)
         .selectpicker('refresh');
    }).done(function () {
        console.log("apres success");
    })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete toujours succes ou erreur");
        });




    //compteComptable
    //Initialisation select Classes
    $.getJSON('nomenclatures_comptables_list.json', {
        ajax: 'true'
    }, function (result) {
        var htln = "";
        for (var i = 0; i < result.compteComptableList.length; i++) {
            //alert("taille de la liste : "+result.sectionList.length+"taille du result :"+result.length+"  la section "+i+" "+result.sectionList[i].codeSection+" "+result.sectionList[i].designation);
            console.log("Section " + i);
            console.log("Code Section " + result.compteComptableList[i].numCompte);
            console.log("Designation" + result.compteComptableList[i].libelleCompte);
            htln += '<option value=';


            htln += "" + result.compteComptableList[i].numCompte;
            htln += '>';
            htln += "" + result.compteComptableList[i].libelleCompte;
            htln += '</option>';
        }
        //alert(htln);
        $("#class-select")
            .html(htln)
            .selectpicker('refresh');
    }).done(function () {
        console.log("apres success");
    })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete toujours succes ou erreur");
        });






    $("#data-table-command").bootgrid({
        css: {
            icon: 'zmdi icon',
            iconColumns: 'zmdi-view-module',
            iconDown: 'zmdi-expand-more',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-expand-less'
        },
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"showingInfos btn btn-icon command-edit waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-assignment\"></span></button> " +
                    "<button type=\"button\" class=\"compte-suppr extern btn btn-icon command-delete waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-delete\"></span></button> ";
                ;
            }
        }

    });
}).on("loaded.rs.jquery.bootgrid", function () {

    $("#data-table-command").find('button.command-delete').on("click", function (e) {
        var rows = Array();
        rows[0] = $(this).data("row-id");
        var idUtilisateur = $($(this).closest('tr')).find('td').eq(3).text();
        afficherSupprChapitre(idUtilisateur, rows);

    })
        .end().find("button.command-edit").on("click", function (e) {
        var rows = Array();
        rows[0] = $(this).data("row-id");
        var idUtilisateur = $($(this).closest('tr')).find('td').eq(3).text();
        //alert(idUtilisateur);
        window.location.replace("nommenclatures_get_compte_budgetaire.html?numero_compte="+idUtilisateur);
    });




    //Click le bouton creer une section
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
        afficherCreateChapitreMessage();
    });


    $('button.compte-mod-save').on('click', function () {
        afficherModifAccountMessage();
    });


//Click sur le bouton  supprimer un chapitre
    $('button.chpitre-suppr').on('click', function () {

    });

    //Click sur le bouton  créer un chapitre
    $('button.rubrique-create-submit').on('click', function () {
        afficherCreateChapitreMessage();

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


}).on('selected.rs.jquery.bootgrid',function (e,row) {
        //alert(e);
});
;


//Configuration du tableau contenant les rubrique
$(document).ready(function () {
    $("#chapitre-data-table-command").bootgrid({
        css: {
            icon: 'zmdi icon',
            iconColumns: 'zmdi-view-module',
            iconDown: 'zmdi-expand-more',
            iconRefresh: 'zmdi-refresh',
            iconUp: 'zmdi-expand-less'
        },
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"rubrique-suppr extern btn btn-icon command-delete waves-effect waves-circle\" data-row-id=\"" + row.id + "\"><span class=\"zmdi zmdi-delete\"></span></button> ";
            }
        }

    });
}).on("loaded.rs.jquery.bootgrid", function () {


    //Click sur le bouton  supprimer un chapitre
    $('button.rubrique-create').on('click', function () {
        afficherCreateChapitre();
    });





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


//Click sur le bouton  supprimer
$('button.compte-suppr.intern').on('click', function () {
    //afficherSupprMessage(this.closest('tr'));
});

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



function afficherCreateChapitreMessage() {

    var num_cpt = $('#creat_input_codechap ').val();
    var designation_cpt = $('#creat_input_designation').val();
    var classe_cpt=$('#class-select').val();
    var type_cpt=$('#compte-type').val();
    var rub_cpt=$('#rubrique-select-section').val();

    swal({
        title: "Etes Vous Sure ?",
        text: "Voulez vous vraiment Ajouter ce Compte ?",
        type: "info",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Confirmer",
        confirmButtonClass: "btn  btn-success waves-effect",
    }, function () {
        $.ajax(
            {
                type: "POST",
                url: "nomenclatures_budgetaires_create.html",
                data: {numero_compte: num_cpt, designation_compte: designation_cpt,type_compte:type_cpt,code_rubrique:rub_cpt,numero_classe:classe_cpt},

            }
        )
            .done(function (data) {
                if (JSON.parse(data) == "100"){
                    swal("Succès!", "La Rubrique est ajoutée avec Succès", "success");
                    window.location.replace("nomenclatures_budgetaires.html");
                }
                else
                    swal("Erreur", "l'Elment n'est pas créé", "error");
            })
            .error(function (data) {
                swal("Erreur", "l'Elment n'est pas créé", "error");
            });
    });
}
//url: "nomenclatures_comptes_budgetaires_remove.html",
function afficherSupprChapitre(code_sect, selectedRow) {

    //alert("code sect == num cpt +"+code_sect+"selected row    "+selectedRow);
    swal({
            title: 'Ete Vous Sure ?',
            text: "Voulez vous vraiment supprimer Cette Section!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Oui, Confirmer!',
            cancelButtonText: 'Annuler',
            confirmButtonClass: 'btn btn-danger',
            cancelButtonClass: 'btn',
            buttonsStyling: false,
            closeOnConfirm: true,

        },
        function (isConfirm) {
            if (isConfirm)
                $.ajax(
                    {
                        type: "POST",
                        dataType: 'json',
                        url: "nomenclatures_comptes_budgetaires_remove.html",
                        data: {num_compte: code_sect},
                    }
                ).done(function (data) {
                    if (JSON.parse(data) == "100"){
                        $('#data-table-command').bootgrid("remove", selectedRow);
                        swal("Succès!", "La est supprimée avec Succès", "success");
                    }
                    else
                        swal("Erreur", "La Section n'est pas  Supprimée", "error");
                })
                    .error(function (data) {
                        swal("Erreur", "La Section n'est pas  Supprimée", "error");
                    });

        });


}
