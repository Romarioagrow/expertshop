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
                    <#if orderedProducts??>
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
                                        <div class="mt-3">${product.type}, <strong><i id="total-price${product.id}">${product.totalPrice}₽</i></strong></div>
                                    </h4>
                                    <p class="card-text">
                                        <button type="button" class="btn btn-outline-danger waves-effect" id="product-less" name="${product.id?c}" value="${product.productID?c}">-</button>
                                        <span  class="badge badge-primary badge-pill" id="amount${product.id?c}" name="${product.id}">${product.amount}</span>
                                        <button type="button" class="btn btn-outline-success waves-effect" id="product-more" name="${product.id?c}" value="${product.productID?c}">+</button>
                                    </p>
                                </div>
                                <button type="submit" class="btn btn-primary btn-md" name="remove-product" id="remove-product" value="${product.id?c}">Удалить</button>
                            </div>
                        </#list>
                    <#else>
                        <h3 style="margin-top: 4vh">Пока ничего нет...</h3>
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
                    <button type="button" onclick="displayOrderDeal()" id="order-button" class="btn btn-success btn-lg btn-block" style="margin-bottom: 5vh">Заказ подтверждаю!</button>
                </div>
            </div>
        </#if>
        <div class="row order-deal" id="order-deal">
            <div class="col mb-3" id="order-details">
                <section class="mb-4">
                    <h3 class="h1-responsive font-weight-bold text-center my-4" id="contact-info">Ваши контактные данные</h3>
                    <div class="row">
                        <div class="col">
                            <form id="contact-form" name="contact-form" action="mail.php" method="POST">

                                <#if !isUser>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="name" name="name" class="form-control">
                                                <label for="name" class="">Ваше имя</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="family" name="family" class="form-control">
                                                <label for="family" class="">Ваша фамилия</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="mobile" name="mobile" class="form-control">
                                                <label for="mobile" class="">Ваш телефон</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="email" id="email" name="email" class="form-control">
                                                <label for="email" class="">Ваш e-mail</label>
                                            </div>
                                        </div>
                                    </div>
                                </#if>

                                <#if isUser>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="name" name="name" class="form-control" value="${firstName}">
                                                <label for="name" class="">Ваше имя</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="family" name="family" class="form-control" value="${lastName}">
                                                <label for="family" class="">Ваша фамилия</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="text" id="mobile" name="mobile" class="form-control" value="${mobile}">
                                                <label for="mobile" class="">Ваш телефон</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="md-form mb-0">
                                                <input type="email" id="email" name="email" class="form-control" value="${email}">
                                                <label for="email" class="">Ваш e-mail</label>
                                            </div>
                                        </div>
                                    </div>
                                </#if>

                                <h3 class="h1-responsive font-weight-bold text-center my-4">Способ получения товара</h3>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <label class="btn btn-secondary active">
                                                <input type="radio" name="options" id="option1" autocomplete="off" checked>Самовывоз
                                            </label>
                                            <label class="btn btn-secondary">
                                                <input type="radio" name="options" id="option2" autocomplete="off">Доставка
                                            </label>
                                        </div>
                                        <#--<h5 class="mt-2">
                                            Оплата товара осуществляется в пункте выдачи товара после подверждения заказа
                                        </h5>-->
                                        <form id="contact-form" name="contact-form" action="mail.php" method="POST">
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
                                        </form>
                                    </div>
                                </div>
                                <#if order??>
                                    <div class="text-center text-md-left">
                                        <button id="confirm-order" onclick="confirmOrder();" value="${order.orderID}" class="btn btn-primary mt-2">Оформить заказ!</button>
                                    </div>
                                    <div class="status"></div>
                                </#if>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="col after-confirm mt-2" id="after-confirm" style="margin-bottom: 50vh">
            <h1>Ваш заказ оформлен! В ближайшее время вы получите уведомление о подтверждении заказа.</h1>
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

    .after-confirm {
        display: none;
    }
</style>