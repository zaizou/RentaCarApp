<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card list-sections">
    <!--L'entete de la page' -->
    <div class="card-header">
        <h2>Véhicule
            <small>Affichage des Véhicules.</small>
        </h2>
    </div>
    <div class="card-contenu">

        <table id="data-table-command"      class="table table-condensed table-hover table-striped bootgrid-table" aria-busy="false">
            <!--l'entete du tableau' -->
            <thead>
            <tr>
                <th data-column-id="id" data-identifier="true" data-type="numeric">Id</th>
                <th data-column-id="nom" class="text-left" >Marque</th>
                <th data-column-id="idUtilisateur" class="text-left" >Modèle</th>
                <th data-column-id="idUtilisateur" class="text-left" >Année de circulation</th>
                <th data-column-id="idUtilisateur" class="text-left" >Prix</th>
                <th data-column-id="idUtilisateur" class="text-left" >Evaluation</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commandes</th>
            </tr>
            </thead>
            <!--Les lignes du tableau -->
            <tbody>
            <c:if test="${listCars.size() >0}">
                <c:forEach begin="0" end="${listCars.size() - 1}" varStatus="loop">
                    <tr data-row-id="${loop.index}" class="147">
                        <td class="text-left" style="">${loop.index+1}</td>
                        <td class="text-left" style="">${listCars.get(loop.index).getBrand()}</td>
                        <td class="text-left" style="">${listCars.get(loop.index).getModel()}</td>
                        <td class="text-left" style="">${listCars.get(loop.index).getCirculation_year()}</td>
                        <td class="text-left" style="">${listCars.get(loop.index).getSell_price()}</td>
                        <td>
                            <div class="rl-star">
                                <c:if test="${listCars.get(loop.index).getEvaluation() >0}">
                                <c:forEach begin="0" end="${listCars.get(loop.index).getEvaluation() - 1}" varStatus="loop">
                                    <i class="zmdi zmdi-star active"></i>
                                </c:forEach>
                                </c:if>
                                <c:if test="${listCars.get(loop.index).getEvaluation() <= 0}">
                                    <i class="zmdi zmdi-star"></i>
                                    <i class="zmdi zmdi-star"></i>
                                    <i class="zmdi zmdi-star"></i>
                                    <i class="zmdi zmdi-star"></i>
                                    <i class="zmdi zmdi-star"></i>
                                </c:if>

                            </div>
                        </td>

                    </tr>

                </c:forEach>
            </c:if>

            </tbody>



        </table>

    </div>


</div>
