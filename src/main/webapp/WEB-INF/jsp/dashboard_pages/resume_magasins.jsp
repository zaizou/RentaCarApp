<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card list-sections">
    <!--L'entete de la page' -->
    <div class="card-header">
        <h2>Magasins
            <small>Résumé de la comptabilité des magasins.</small>
        </h2>
    </div>
    <div class="card-contenu">
        <!--Le tableau qui affiche la liste des comptes -->
        <table id="data-table-command"      class="table table-condensed table-hover table-striped bootgrid-table" aria-busy="false">
            <!--l'entete du tableau' -->
            <thead>
            <tr>
                <th data-column-id="id" data-identifier="true" data-type="numeric"></th>
                <th data-column-id="magasin" class="text-left" >Magasin</th>
                <th data-column-id="recettesMag" class="text-left" >Recettes</th>
                <th data-column-id="depensesMag" class="text-left" >Dépenses</th>
                <th data-column-id="transfertsMag" class="text-left" >Transferts</th>

            </tr>
            </thead>
            <!--Les lignes du tableau -->
            <tbody>

            </tbody>



        </table>

    </div>


</div>
