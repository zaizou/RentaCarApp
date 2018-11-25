/**
 * Created by Assou on 29/08/2016.
 */
var  datesDisabledTab = [];
var resultsTable = [];
var currentOrdre = 0;
var currentDays = 0;


$(document).ready(function () {

    ///Get rents/reservations
    //=> disable dates

    //rent/reserve
    //=> send car_id user_id and dates from and to

    //Initialisation : disabling reserved dates
    //

    function get_all_car_rents() {
        $.getJSON('management_get_all_car_rents.json?car_id=1', {
            ajax: 'true'
        }, function (result) {
            var htln = "";
            var date_from_days;
            var date_to_days;
            var diff;
            var currentDisabledDate;
            console.log(result);
            currentOrdre = result.length + 1;
            resultsTable  = result;
            for(var i=0; i<result.length;i++){
                diff = moment(result[i].date_to,"YYYY-MM-DD").diff( moment(result[i].date_from,"YYYY-MM-DD")) ;
                diff = moment.duration(diff).asDays();
                console.log("Diffrence between  from:"+ result[i].date_from +"and to : "+result[i].date_to+" Days :");
                console.log(diff);
                currentDays = diff;

                //datesDisabledTab.push( result[i].date_from );
                for(var j=0;j<=diff ; j++){
                    currentDisabledDate = moment( result[i].date_from ).add(j,"d").format("DD/MM/YYYY");
                    datesDisabledTab.push( currentDisabledDate );
                }

            }
            console.log(datesDisabledTab);
            if( resultsTable.length == 0)
                $("button#modal-rend-btn").css('display','none');


            /*
            for (var i = 0; i < result.structureList.length; i++) {
                console.log("Section " + i);
                console.log("Code Strcuture " + result.structureList[i].codeStructure);
                console.log("Designation" + result.structureList[i].nom);
                htln += '<option value=';
                htln += "" + result.structureList[i].codeStructure;
                htln += '>';
                htln += "" + result.structureList[i].nom;
                htln += '</option>';
            }
            $("#structure-select-section")
                .html(htln)
                .selectpicker('refresh');
            */

        }).done(function () {
            console.log("apres success");
        }).fail(function () {
                console.log("error");

            }).always(function () {
                console.log("complete toujours succes ou erreur");
            initCalendars();
            });
    }

    get_all_car_rents();



    $("#modal-rent-btn").click(function() {
        $('#rentModal').modal('show')
    });
    $("#modal-rend-btn").click(function() {

        if( resultsTable.length > 0 )
            swal({
                title: "Etes Vous Sure ?",
                text: "Voulez vous vraiment Cloturer la période de location/réservation ? : "+ resultsTable[0].date_from +" -" + resultsTable[0].date_to,
                type: "info",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "Confirmer",
                confirmButtonClass: "btn  btn-success waves-effect",
            }, function () {
                $.ajax(
                    {
                        type: "POST",
                        url: "management_cloture_rent.html",
                        data: {
                            id_rent: resultsTable[0].id ,
                        }
                    }
                )
                    .done(function (data) {
                        if (JSON.parse(data) == "100") {
                            swal("Succès!", "Période de Location/Réservation cloturée", "success");
                            location.reload();
                        }
                    })
                    .error(function (data) {
                        swal("Erreur", "Une erreur survenue, veuillez contacter votre administrateur", "error");
                    });
            });

    });



    function initCalendars() {
        if ($('.date-picker')[0]) {
            $('.date-picker').datepicker({
                format: 'dd/mm/yyyy',
                datesDisabled: datesDisabledTab
            });
        }



    }




    //Date


    $("#rentConfirm").click(function() {
        console.log("Adding Rent");
        createRent();
    });


    function check_valid_interval(date_from, date_to){
            var diffe_inf_from = 0;
            var diffe_inf_to = 0;
            var diffe_sup_from = 0;
            var diffe_sup_to = 0;
            for(var i=0;i<resultsTable.length;i++){
                diffe_inf_from = moment(date_from,"DD/MM/YYYY").diff( moment( resultsTable[i].date_from ,"YYYY-MM-DD"));
                diffe_inf_from = moment.duration(diffe_inf_from ).asDays();
                diffe_inf_to = moment(date_to,"DD/MM/YYYY").diff( moment( resultsTable[i].date_from ,"YYYY-MM-DD"));
                diffe_inf_to  = moment.duration(diffe_inf_to ).asDays();
                diffe_sup_from = moment(date_from,"DD/MM/YYYY").diff( moment( resultsTable[i].date_to,"YYYY-MM-DD"));
                diffe_sup_from = moment.duration(diffe_inf_from ).asDays();
                diffe_sup_to = moment(date_to,"DD/MM/YYYY").diff( moment( resultsTable[i].date_to,"YYYY-MM-DD"));
                diffe_sup_to  = moment.duration(diffe_inf_to).asDays();
                console.log("date from :   "+date_from+"  date to : "+date_to);
                console.log("table date from :   "+resultsTable[i].date_from +"  table date to : "+resultsTable[i].date_to);
                console.log("dif inf from  "+diffe_inf_from+"  dif inf to "+diffe_inf_to+"   dif sup from  "+diffe_sup_from+"   dif sup to  "+diffe_sup_to);

                if( !(   diffe_inf_from < 0 &&   diffe_inf_to < 0 || diffe_sup_from > 0 && diffe_sup_to>0) )
                    return false;

            }
            return true;
    }

    function createRent(){
        var ordre = 1;
        var from_date = $("#rent_date_from").val();
        console.log("in create rent_date_from");
        console.log(from_date);
        var to_date = $("#rent_date_to").val();
        console.log("in create rent_date_to");
        console.log(to_date);


        console.log("Valida intervals :")
        console.log(check_valid_interval(from_date,to_date));


        var nb_days =  moment(to_date,"DD/MM/YYYY").diff( moment(from_date,"DD/MM/YYYY")) ;
        nb_days = moment.duration(nb_days).asDays();
        nb_days++;

        var from_today =  moment(to_date,"DD/MM/YYYY").diff( moment()) ;
        from_today= moment.duration(from_today).asDays();
        from_today++;



        var rent_price = nb_days * car_rent_price;
        console.log("currentOrdre  :");
        console.log(currentOrdre);

        if(check_valid_interval(from_date,to_date) && from_today>0 && nb_days>0){
            $.ajax(
                {
                    type: "POST",
                    url: "management_create_rent.html",
                    data: {
                        date_from: moment(from_date,"DD/MM/YYYY").format("x"),
                        date_to:   moment(to_date,"DD/MM/YYYY").format("x"),
                        days : parseInt(nb_days)    ,
                        ordre:currentOrdre,
                        price: currentDays * car_rent_price,
                        user_id:current_user_id,
                        car_id:current_car_id
                    }
                }
            )
                .done(function (data) {
                    if (JSON.parse(data) == "100"){
                        swal("Succès!", "Véhicule loué", "success");
                        location.reload();
                    }
                    else if(JSON.parse(data) == "101") swal("Erreur", "Location non valable", "error");
                    else swal("Erreur", ""+ data, "error");
                })
                .error(function (data) {
                    swal("Erreur", "Location non valable", "error");
                });
        }else{
            swal("Erreur", "Intervall non autorisé", "error");
        }
    }



    function afficherCreateChapitreMessage() {

        /* var code_rubr = $('#creat_input_codechap ').val();
         var designation_rubr = $('#creat_input_designation').val();
         var code_rubr=$('#chapitre-select-section').val();*/
        var in_nom = $("#creat_input_nom").val();
        var in_prenom = $("#creat_input_prenom").val();
        var in_passw = $("#creat_input_passw").val();
        var in_reppss = $("#creat_input_reppasswd").val();
        var in_mail = $("#creat_input_email").val();
        var in_tel = $("#creat_input_telephone").val();
        var in_adr = $("#creat_input_addresse").val();
        var in_id_user = $("#creat_input_id_user").val();
        var in_struct = $("#structure-select-section").val();
        var in_actif = $("#state-select").val();


        var items = new Array();
        $('#fonctionnlaite-select :selected').each(function (i, selected) {
            console.log("parsing the element " + i);
            console.log("selected val : " + $(selected).val());
            items[i] = $(selected).val();
            console.log("Items " + items[i]);
        });


        swal({
            title: "Etes Vous Sure ?",
            text: "Voulez vous vraiment Ajouter cette Rubrique ?",
            type: "info",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "Confirmer",
            confirmButtonClass: "btn  btn-success waves-effect",
        }, function () {
            $.ajax(
                {
                    type: "POST",
                    url: "gestion_utilisateurs_utilisateur_create.html",
                    data: {
                        nom: in_nom,
                        prenom: in_prenom,
                        passwd: in_passw,
                        reppassw: in_reppss,
                        mail: in_mail,
                        addresse: in_adr,
                        id_utilisateur: in_id_user,
                        code_structure: in_struct,
                        fonctionnalites: items,
                        actif: in_actif
                    }
                }
            )
                .done(function (data) {
                    if (JSON.parse(data) == "100") {
                        swal("Succès!", "L'utilisateur est ajouté avec Succès", "success");
                        window.location.replace("gestion_utilisateurs_utilisateurs.html");
                    }
                    else if (JSON.parse(data) == "602")
                        swal("Erreur", "l'utilisateur Existe deja verifier votre Id Utilisateur", "error");
                    else if (JSON.parse(data) == "603")
                        swal("Erreur", "Le Champ Repeter Mot de passe ne Correspond pas au Mot de passe ", "error");
                })
                .error(function (data) {
                    swal("Erreur", "L'Utilisateur n'est pas ajouté", "error");
                });
        });
    }







});