/**
 * Created by Assou on 29/08/2016.
 */


var selectedRent=0;
var selected_car_name;
var selected_date_from;
var selected_date_to;
var selected_car_id;


$(document).ready(function () {


        $(".rent_end").click(function(){
            //showFinishRent();
            selected_car_name = $(this).closest("tr").find(".tb-model").text();
            selected_date_from = $(this).closest("tr").find(".tb-date-from").text();
            selected_date_to = $(this).closest("tr").find(".tb-date-to").text();
            selected_car_id = $(this).closest("tr").find(".tb-car-id").text();
            selectedRent = $(this).attr("id")
            console.log("ID is :");
            console.log(selectedRent);
            showFinishRent();

        });

        function showFinishRent(){
                    swal({
                        title: "Etes Vous Sure ?",
                        text: "Voulez vous vraiment Cloturer la période de location/réservation  : "+ selected_date_from +" -" + selected_date_to +" du véhicule " + selected_car_name + " ?",
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
                                    id_rent: selectedRent,
                                    id_car :selected_car_id
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
        }








});