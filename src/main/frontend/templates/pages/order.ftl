<#import "../parts/template.ftl" as t>
<#include "../parts/security.ftl">

<@t.template>
    <div class="container">
        <div class="row">
            <h3 style="margin-top: 4vh">Ваш заказ</h3>
        </div>
        <div class="row" id="ordered-products">
            <div class="col">
                <div class="card-group" id="bucket-products">
                    <#if orderedProducts?has_content>
                        <#list orderedProducts as product>
                            <div class="card ordered-card mb-4">
                                <div class="view overlay">
                                    <img class="card-img-top" src="${product.pic}" alt="Card image cap">
                                    <a href="#!">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        ${product.brand}
                                        ${product.model}
                                        <div class="mt-3">${product.type}, <strong><i id="total-price${product.id?c}">${product.totalPrice}₽</i></strong></div>
                                    </h4>
                                    <p class="card-text" id="cart-text-buttons" name="cart-text-buttons">
                                        <button type="button" class="btn btn-outline-danger waves-effect" id="product-less" name="${product.id?c}" value="${product.productID?c}">-</button>
                                        <span  class="badge badge-primary badge-pill" id="amount${product.id?c}" name="${product.id}">${product.amount}</span>
                                        <button type="button" class="btn btn-outline-success waves-effect" id="product-more" name="${product.id?c}" value="${product.productID?c}">+</button>
                                    </p>
                                </div>
                                <button type="submit" class="btn btn-danger btn-md" name="remove-product" id="remove-product" value="${product.id?c}">Удалить</button>
                            </div>
                        </#list>
                    <#else>
                        <h3 style="margin-top: 4vh">Товаров пока нет </h3>
                        <a type="button" href="/" class="btn blue-gradient btn-lg btn-block">Вернуться за покупками</a>
                    </#if>
                </div>
                <#--<ul class="list-group">
                    <#if orderedProducts??>
                        <#list orderedProducts as product>

                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <img class="ordered-product-img-line" src="${product.pic}" height="50" width="80"  alt="Card image cap">
                                <strong>${product.type}</strong> ${product.brand} ${product.model}
                                <button type="button" class="btn btn-outline-danger waves-effect" id="product-less" name="${product.id?c}" value="${product.productID?c}">-</button>
                                <div id="amount${product.id}" name="${product.id}"><span class="badge badge-primary badge-pill">${product.amount}</span></div>
                                <button type="button" class="btn btn-outline-success waves-effect" id="product-more" name="${product.id?c}" value="${product.productID?c}">+</button>
                                <strong><i id="total-price${product.id}">${product.totalPrice} ₽</i></strong>
                                <button type="submit" class="btn btn-primary btn-md" name="remove-product" id="remove-product" value="${product.id?c}">Удалить</button>
                            </li>
                            &lt;#&ndash;<div class="list-group-item d-flex justify-content-between align-items-center &lt;#&ndash;container&ndash;&gt;">
                                <div class="row">
                                    <div class="col-6">
                                        <img class="ordered-product-img-line" src="${product.pic}" height="50" width="80"  alt="Card image cap">
                                        <strong>${product.type}</strong> ${product.brand} ${product.model}
                                    </div>
                                    <div class="col">
                                        <button type="button" class="btn btn-outline-danger waves-effect" id="product-less" fullName="${product.id?c}" value="${product.productID?c}">-</button>
                                        <div id="amount${product.id}" fullName="${product.id}"><span class="badge badge-primary badge-pill">${product.amount}</span></div>
                                        <button type="button" class="btn btn-outline-success waves-effect" id="product-more" fullName="${product.id?c}" value="${product.productID?c}">+</button>
                                    </div>
                                    <div class="col">
                                        <strong><i id="total-price${product.id}">${product.totalPrice} ₽</i></strong>
                                        <button type="submit" class="btn btn-primary btn-md" fullName="remove-product" id="remove-product" value="${product.id?c}">Удалить</button>
                                    </div>
                                </div>
                            </div>&ndash;&gt;
                        </#list>
                    <#else>
                        <h3 style="margin-top: 4vh">Пока ничего нет...</h3>
                    </#if>
                </ul>-->

            </div>
        </div>
        <#if order??>
            <div class="row">
                <div class="col">
                    <h3 class="mt-2" style="margin-bottom: 3vh">
                        Заказ на сумму <strong id="order-price">${order.totalPrice}₽</strong>
                        Товаров <b id="order-products">${order.productsAmount}</b>
                        Всего единиц <b id="order-amount">${order.totalAmount}</b>
                    </h3>
                    <button onclick="displayOrderDeal()" id="order-button" type="button" class="btn btn-success btn-lg btn-block" style="margin-bottom: 5vh">Заказ подтверждаю!</button>
                    <button onclick="editOrder()" id="edit-order" value="${order.orderID}" class="btn btn-indigo btn-lg btn-block mt-2" style="display: none">Изменить заказ!</button>
                </div>
            </div>
        </#if>

        <div class="row">
            <div class="col">
                <div id="orderSuccess"></div>
                <div></div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <a href="/" id="new-order-button" type="button" class="btn btn-deep-purple btn-lg btn-block" style="margin-bottom: 5vh; display: none;">Новый заказ</a>
            </div>
            <#if isUser>
                <div class="col">
                    <a href="/user/cabinet" id="my-order-button" type="button" class="btn btn-elegant btn-lg btn-block" style="margin-bottom: 5vh; display: none;">Мои заказы</a>
                </div>
            </#if>
        </div>

        <div class="row order-deal" id="order-deal">
            <div class="col mb-3" id="order-details">
                <section class="mb-4">
                    <h3 class="h1-responsive font-weight-bold text-center my-4" id="contact-info">Ваши контактные данные</h3>
                    <div class="row">
                        <div class="col">
                            <div id="results"></div>
                            <#if !isUser>
                                <form id="contact-session" name="contact-form" method="POST">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="name" name="name" class="form-control" required>
                                                <label for="name" class="">Ваше имя</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="surname" name="surname" class="form-control" required>
                                                <label for="family" class="">Ваша фамилия</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="mobile" name="mobile" class="form-control" required>
                                                <label for="mobile" class="">Ваш телефон</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="email" id="email" name="email" class="form-control" required>
                                                <label for="email" class="">Ваш e-mail</label>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            <#else>
                                <form id="contact-user" name="contact-form" action="mail.php" method="POST" required>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="name" name="name" class="form-control" value="${firstName}" required>
                                                <label for="name" class="">Ваше имя</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="surname" name="surname" class="form-control" value="${lastName}" required>
                                                <label for="family" class="">Ваша фамилия</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="mobile" name="mobile" class="form-control" value="${mobile}" required>
                                                <label for="mobile" class="">Ваш телефон</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="email" id="email" name="email" class="form-control" value="${email}" required>
                                                <label for="email" class="">Ваш e-mail</label>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </#if>

                           <#-- <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary form-check-label active">
                                    <input class="form-check-input" type="radio" name="options" id="delivery-button" autocomplete="off" checked>
                                    Доставка курьером
                                </label>
                                <label class="btn btn-primary form-check-label">
                                    <input class="form-check-input" type="radio" name="options" id="self-delivery-button" autocomplete="off">
                                    Самовывоз со склада
                                </label>
                            </div>-->

                            <h3 class="h1-responsive font-weight-bold text-center my-4">Способ получения товара</h3>
                            <div class="row">
                                <div class="col-md-12">


                                    <ul class="nav nav-tabs nav-justified md-tabs indigo" style="background-color: #3f51b5 !important;" id="myTabJust" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab-just" data-toggle="tab" href="#home-just" role="tab" aria-controls="home-just"
                                               aria-selected="true">Самовывоз со склада</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab-just" data-toggle="tab" href="#profile-just" role="tab" aria-controls="profile-just"
                                               aria-selected="false">Доставка курьером</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content <#--card--> <#--pt-5-->" id="myTabContentJust">
                                        <div class="tab-pane fade show active" id="home-just" role="tabpanel" aria-labelledby="home-tab-just">
                                            <h3>Заберите ваш заказ со склада по адресу: город Чебаркуль, Ленина 32</h3>
                                        </div>
                                        <div class="tab-pane fade" id="profile-just" role="tabpanel" aria-labelledby="profile-tab-just">
                                            <h3>Ваш адрес для доставки:</h3>
                                            <form id="self-delivery-block" name="contact-form" action="mail.php" method="POST">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="md-form">
                                                            <input type="text" id="city" name="city" class="form-control">
                                                            <label for="city" class="">город</label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="md-form">
                                                            <input type="text" id="street" name="street" class="form-control">
                                                            <label for="street" class="">Улица</label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="md-form">
                                                            <input type="email" id="house" name="house" class="form-control">
                                                            <label for="house" class="">Дом</label>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="md-form">
                                                            <input type="email" id="apartment" name="apartment" class="form-control">
                                                            <label for="apartment" class="">Квартира</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                    <#--<ul class="nav nav-tabs nav-justified md-tabs indigo" style="background-color: #e52d00 !important;" id="myTabJust" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab-just" data-toggle="tab" href="#home-just" role="tab" aria-controls="home-just"
                                               aria-selected="true">
                                                Заберите ваш заказ по адресу!
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab-just" data-toggle="tab" href="#profile-just" role="tab" aria-controls="profile-just"
                                               aria-selected="false">
                                                Мой профиль
                                            </a>
                                        </li>
                                    </ul>-->

                                    <#--<div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-secondary active">
                                            <input type="radio" id="delivery-button" name="options" autocomplete="off" checked>Самовывоз со склада
                                        </label>
                                        <label class="btn btn-secondary">
                                            <input type="radio" id="self-delivery-button" name="options" autocomplete="off"> Доставка курьером
                                        </label>
                                    </div>-->

                                    <#--<div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-primary form-check-label active">
                                            <input class="form-check-input" type="radio" name="options" id="delivery-button" autocomplete="off" checked>
                                            Доставка курьером
                                        </label>
                                        <label class="btn btn-primary form-check-label">
                                            <input class="form-check-input" type="radio" name="options" id="self-delivery-button" autocomplete="off">
                                            Самовывоз со склада
                                        </label>
                                    </div>-->
                                    <#--<h5 class="mt-2">
                                        Оплата товара осуществляется в пункте выдачи товара после подверждения заказа
                                    </h5>-->
                                    <#--<form id="self-delivery-block" name="contact-form" action="mail.php" method="POST">
                                        <div class="row">
                                            <div class="col">
                                                <div class="md-form mb-0">
                                                    <input type="text" id="city" name="city" class="form-control">
                                                    <label for="city" class="">город</label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="md-form mb-0">
                                                    <input type="text" id="street" name="street" class="form-control">
                                                    <label for="street" class="">Улица</label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="md-form mb-0">
                                                    <input type="email" id="house" name="house" class="form-control">
                                                    <label for="house" class="">Дом</label>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="md-form mb-0">
                                                    <input type="email" id="apartment" name="apartment" class="form-control">
                                                    <label for="apartment" class="">Квартира</label>
                                                </div>
                                            </div>
                                        </div>
                                    </form>-->
                                </div>
                            </div>



                            <#if order?has_content>
                                <div class="text-center text-md-left">
                                    <button id="confirm-order" value="${order.orderID}" class="btn btn-primary btn-lg btn-block mt-2" style="background-color: #e52d00 !important;">Оформить заказ!</button>
                                </div>
                            </#if>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</@t.template>
<style>
    .ordered-card {
        min-width: 20vw;
        max-width: 20vw;

        min-height: 50vh;
        max-height: 80vw;
    }
    .order-deal {
        display: none;
    }

    form label {
        display: inline-block;
    //width: 100px;
    }

    form div {
    //margin-bottom: 10px;
    }

    .error {
        color: red;
    //margin-left: 5px;
    }

    label.error {
        display: inline;
    }
</style>