<#import "../parts/template.ftl" as t>
<@t.template>
    <div class="container-fluid hello-list" style="margin-top: 5rem; padding-left: 8rem; padding-right: 8rem">
        <div class="row discount">
            <div class="col mb-3">
            </div>
        </div>
        <div class="row mb-3" style="margin-top: 1rem;">
            <div class="col">
                <h1 style="margin-left: 1rem;">Каталог товаров</h1>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card" style="width: 95rem; margin-left: 1rem; padding: -1.5rem !important;" >
                    <div class="card-body" >
                        <ul class="nav md-pills pills-secondary">
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("теле-видео-аудио")>active</#if>" data-toggle="tab" href="#panel1" role="tab">Теле-видео-аудио</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("кухонная_техника")>active</#if>" data-toggle="tab" href="#panel2" role="tab">Кухонная техника</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("техника_для_дома")>active</#if>" data-toggle="tab" href="#panel3" role="tab">Техника для дома</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("встраеваемая_техника")>active</#if>" data-toggle="tab" href="#panel4" role="tab">Встраиваемая техника</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("климатическая_техника")>active</#if>" data-toggle="tab" href="#panel5" role="tab">Климатическая техника</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("приборы_персонального_ухода")>active</#if>" data-toggle="tab" href="#panel6" role="tab">Приборы персонального ухода</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("цифровые_устройства")>active</#if>" data-toggle="tab" href="#panel7" role="tab">Цифровые устройства</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("компьютеры_и_орг_техника")>active</#if>" data-toggle="tab" href="#panel8" role="tab">Компьютеры и оргтехника</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("инструменты_для_дома")>active</#if>" data-toggle="tab" href="#panel9" role="tab">Инструменты для дома</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("автотовары")>active</#if>" data-toggle="tab" href="#panel10" role="tab">Автотовары</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <#if url?contains("гаджеты")>active</#if>" data-toggle="tab" href="#panel11" role="tab">Гаджеты</a>
                            </li>

                            <#--/////////////-->
                            <li class="nav-item" onclick="displaySomeGroups(this)" onchange="displaySomeGroups(this)" name="инструмент">
                                <a class="nav-link <#if url?contains("инструмент")>active</#if>" data-toggle="tab" href="#panel18" role="tab">Строительные инструменты</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" onselect="displaySomeGroups(this)" name="техника_для_подсобного_хозяйства">
                                <a class="nav-link <#if url?contains("подсобное_хозяйство") || url?contains("техника_для_подсобного_хозяйства")>active</#if>" data-toggle="tab" href="#panel12" role="tab">Подсобное хозяйство</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" name="садово-огородный_инвентарь">
                                <a class="nav-link <#if url?contains("садово-огородный_инвентарь")>active</#if>" data-toggle="tab" href="#panel13" role="tab">Садово-огородный инвентарь</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" name="консервирование">
                                <a class="nav-link <#if url?contains("консервирование")>active</#if>" data-toggle="tab" href="#panel14" role="tab">Консервирование</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" name="отопительное_оборудование">
                                <a class="nav-link <#if url?contains("отопительное_оборудование")>active</#if>" data-toggle="tab" href="#panel15" role="tab">Отопительное оборудование</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" name="спорт_и_отдых">
                                <a class="nav-link <#if url?contains("спорт_и_отдых")>active</#if>" data-toggle="tab" href="#panel16" role="tab">Спорт и отдых</a>
                            </li>
                            <li class="nav-item" onclick="displaySomeGroups(this)" name="товары_для_отдыха_на_природе">
                                <a class="nav-link <#if url?contains("товары_для_отдыха_на_природе")>active</#if>" data-toggle="tab" href="#panel17" role="tab">Товары для отдыха на природе</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content pt-0" style="margin-top: 2rem">
                    <div class="tab-pane fade <#if url?contains("теле-видео-аудио")>in show active</#if>" id="panel1" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvs1.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/телевизоры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Телевизоры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvrecievers.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/ресиверы_для_тв">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Ресиверы для ТВ</h4>
                                </div>
                            </div>

                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvcabels.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/кабели_тв">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">ТВ кабели и переходники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvkroch.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/кронштейны_тв">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кронштейны для ТВ</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvmebel.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/телемебель">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Телемебель</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/muzcentr.jpeg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/музыкальные_центры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Музыкальные центры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tvanten.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/антенны_тв">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">ТВ антенны</h4>
                                </div>
                            </div>

                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/muzinstr.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/музыкальные_инструменты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Музыкальные инструменты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/magnitofon.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/магнитолы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Магнитолы</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Акксессуары электронной техники</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/udliniteli.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/удлинители">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Удлинители</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/batareiki.jpeg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/батарейки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Батарейки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/akkumpalch.jpg" alt="Card image cap">
                                    <a href="/products/теле-видео-аудио/аккумуляторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аккумуляторы</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("кухонная_техника")>in show active</#if>" id="panel2" role="tabpanel">
                        <h2>Крупная кухонная техника</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/fridge.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/холодильники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Холодильники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/freezer.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/морозильники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Морозильники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/morozlari.jpeg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/морозильные_лари">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Морозильные лари</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/elplita.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/электрические_плиты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электрические плиты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/gazplita.jpeg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/газовые_плиты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Газовые плиты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/combplita.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/комбинированные_плиты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Комбинированные плиты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/dishwasher.png" alt="Card image cap">
                                    <a href="/products/кухонная_техника/посудомоечные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Посудомоечные машины</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vityazhki.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/вытяжки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Вытяжки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/kulers.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/кулеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кулеры</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Мелкая кухонная техника</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/svch.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/микроволновые_печи">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Микроволновые печи</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/chaynik.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/электрические_чайники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Чайники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/toster.png" alt="Card image cap">
                                    <a href="/products/кухонная_техника/тостеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Тостеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/coffemaker.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/кофеварки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кофеварки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/blender.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/блендеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Блендеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/mixers.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/миксеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Миксеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/meatgrinder.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/мясорубки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Мясорубки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/breadmaker.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/хлебопечи">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Хлебопечи</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/multicooker.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/мультиварки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Мультиварки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/parovarki.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/пароварки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Пароварки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/aerogrili.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аэрогрили">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аэрогрили</h4>
                                </div>
                            </div>


                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/electropechi.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/электропечи">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электропечи</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/oreshnichi.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/орешницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Орешницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/multipekari.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/мультипекари">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Мультипекари</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vafelnici.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/вафельницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Вафельницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/shashichnici.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/шашлычницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Шашлычницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/electrogrili.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/электрогрили">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электрогрили</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/yogurtnici.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/йогуртницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Йогуртницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/friturnichi.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/Фритюрницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фритюрницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/Блинницы.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/Блинницы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Блинницы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/Соковыжималки.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/Соковыжималки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Соковыжималки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/плитки_газовые.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/газовые_плитки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Газовые плитки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/плитки_электрические.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/электрические_плитки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электрические плитки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/kastruli.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/кастрюли">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кастрюли</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Акксессуары для кухонной техники</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/holodakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_к_холодильникам">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары к холодильникам</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/plitaskks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_плит">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для плит</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/dishwashersakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_посудомоечных_машин">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для посудомоечных машин</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/multiakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_мультиварок">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для мультиварок</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/meatgrindakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_мясорубок">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для мясорубок</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/svcakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_СВЧ">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для СВЧ</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vityazhkaakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_вытяжки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для вытяжки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/svchkronakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/кронштейны_для_СВЧ">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кронштейны для СВЧ</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vityazhkafilters.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/фильтры_для_вытяжки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фильтры для вытяжки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/kitchenakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/кухонные_принадлежности">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кухонные принадлежности</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("техника_для_дома")>in show active</#if>" id="panel3" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/stiralnmash.jpg" alt="Card image cap">
                                    <a href="/products/техника_для_дома/стиральные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Стиральные машины</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/sushmash.jpg" alt="Card image cap">
                                    <a href="/products/техника_для_дома/сушильные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сушильные машины</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/pilesos.jpg" alt="Card image cap">
                                    <a href="/products/техника_для_дома/пылесосы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Пылесосы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/utug.jpg" alt="Card image cap">
                                    <a href="/products/техника_для_дома/утюги">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Утюги</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/sewing.png" alt="Card image cap">
                                    <a href="/products/техника_для_дома/швейные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Швейные машины</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/Оверлоки.jpg" alt="Card image cap">
                                    <a href="/products/техника_для_дома/Оверлоки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Оверлоки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/oparivatel.png" alt="Card image cap">
                                    <a href="/products/техника_для_дома/отпариватели">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Отпариватели</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Акксессуары для бытовой техники</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/washersakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/Аксессуары к стиральным машинам">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары к стиральным машинам</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/pilesborniks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/пылесборники_для_пылесосов">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Пылесборники для пылесосов</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/pilesosfilters.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/фильтры_для_пылесосов">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фильтры для пылесосов</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/pilesosakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_пылесосов">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для пылесосов</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/utugsakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_утюгов">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для утюгов</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/seewingakks.jpg" alt="Card image cap">
                                    <a href="/products/кухонная_техника/аксессуары_для_швейных_машин">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для швейных машин</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("встраеваемая_техника")>in show active</#if>" id="panel4" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrDuh.png" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_духовые_шкафы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Встраиваемые духовые шкафы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrVar.png" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_варочные_панели">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Встраиваемые варочные панели</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrHol.jpg" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_холодильники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Встраиваемые холодильники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrVit.jpg" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_вытяжки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Встраиваемые вытяжки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrSVCH.jpg" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_СВЧ">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Встраиваемые СВЧ</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vstrPosuda.jpg" alt="Card image cap">
                                    <a href="/products/встраеваемая_техника/встраиваемые_посудомоечные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Посудомоечные машины</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("климатическая_техника")>in show active</#if>" id="panel5" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/conder.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/кондиционеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Кондиционеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vodonagrev.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/водонагреватели">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Водонагреватели</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/uvvlazn.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/увлажнители_воздуха">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Увлажнители воздуха</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/obogrev.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/обогреватели">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Обогревательные приборы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vents.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/вентиляторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Вентиляторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/aircleaner.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/очистители_воздуха">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Очистители воздуха</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/klimatakks.jpg" alt="Card image cap">
                                    <a href="/products/климатическая_техника/аксессуары_для_климатической_техники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для климатической техники</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("приборы_персонального_ухода")>in show active</#if>" id="panel6" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/ploiki.png" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/плойки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Плойки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/shipchs.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/щипцы_для_волос">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Щипцы для волос</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/stylers.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/стайлеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Cтайлеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/fens.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/фены">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фены</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/cutmashiknka.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/машинки_для_стрижки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Машинки для стрижки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/trimmers.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/триммеры_для_бритья">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Триммеры для бритья</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/razors.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/бритвы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Бритвы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/epliators.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/эпиляторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Эпиляторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/massagers.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/массажеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Массажеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vesi.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/напольные_весы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Напольные весы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/razorstanki.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/бритвенные_станки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Бритвенные станки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/nogotochki.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/маникюрные_наборы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Маникюрные наборы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/teethcleaner.jpg" alt="Card image cap">
                                    <a href="/products/приборы_персонального_ухода/зубные_щетки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электрические зубные щетки</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("цифровые_устройства")>in show active</#if>" id="panel7" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/smartphones.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/смартфоны">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Смартфоны</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/mobiles.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/сотовые_телефоны">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сотовые телефоны</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/tablets.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/планшеты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Планшеты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/photo.png" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/фотоаппараты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фотоаппараты</h4>
                                </div>
                            </div><div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/video.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/видеокамеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Видеокамеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/naushniki.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/наушники_и_гарнитуры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Наушники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/powerbanks.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/внешние_аккумуляторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Внешние аккумуляторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/ebook.jpeg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/электронные_книги">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электронные книги</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/microSD.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/карты_памяти_microSD">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Карты памяти microSD</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/mp3.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/MP3_плееры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">MP3 плееры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/dictophones.png" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/диктофоны">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Диктофоны</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/radiopriyomniki.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/радиоприемники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Радиоприемники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/ratsii.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/рации">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Радиосвязь</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Акксессуары для цифровой техники</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/sumkidlyatehniki.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/сумки_для_техники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сумки для техники</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/chehli.jpg" alt="Card image cap">
                                    <a href="/products/цифровые_устройства/чехлы_для_телефонов">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Чехлы для телефонов</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("компьютеры_и_орг_техника")>in show active</#if>" id="panel8" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/notebooks.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/ноутбуки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Ноутбуки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/pc.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/готовые_ПК">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Готовые ПК</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/monitors.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/мониторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Мониторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/printers.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/принтеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Принтеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/keyboards.png" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/клавиатуры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Клавиатуры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/mouses.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/мыши">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Мыши</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/hardEXT.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/внешние_жесткие_диски">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Внешние жесткие диски</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/routers.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/роутеры_и_сетевое_оборудование">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сетевое оборудование</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/setfilters.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/сетевые_фильтры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сетевые фильтры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/webcameras.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/веб_камеры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Веб-камеры</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/usbflash.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/flash_карты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">USB карты</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Акксессуары для компьютерной техники</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/notebookssumki.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/сумки_для_ноутбуков">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сумки для ноутбуков</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/notebooksakks.png" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/аксессуары_для_ноутбуков">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аксессуары для ноутбуков</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/notebooksakkum.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/аккумуляторы_для_ноутбуков">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Аккумуляторы для ноутбуков</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/katgidjistui.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/картриджи_струйные">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Картриджи струйные</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/katjidji.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/картриджи_лазерные">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Картриджи лазерные</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/photopaper.jpg" alt="Card image cap">
                                    <a href="/products/компьютеры_и_орг_техника/фотобумага">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фотобумага</h4>
                                </div>
                            </div>

                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("инструменты_для_дома")>in show active</#if>" id="panel9" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/drelshurup.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/дрели-шуруповерты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Дрели-Шуруповерты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/perforator.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/перфораторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Перфораторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/svarka.jpeg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/сварочное_оборудование">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сварочное оборудование</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/electropila.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/электропилы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Электропилы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/benzopili.jpeg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Бензопилы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Бензопилы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/lobziki.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/лобзики">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Лобзики</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/shlifovka.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/шлифовальные_машины">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Шлифовальные машины</h4>
                                </div>
                            </div>

                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/stroitelbilesos.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Строительные пылесосы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Строительные пылесосы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/stroitelfen.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Промышленные фены">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Промышленные фены</h4>
                                </div>
                            </div>

                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/generators.png" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Генераторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Генераторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/payalniki.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Паяльники">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Паяльники</h4>
                                </div>
                            </div>
                        </div>
                        <h2>Аксессуары для инструментов</h2>
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/sverla.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Сверла">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Сверла</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/buri.jpg" alt="Card image cap">
                                    <a href="/products/инструменты_для_дома/Буры">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Буры</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("автотовары")>in show active</#if>" id="panel10" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/avtomagnitola.jpg" alt="Card image cap">
                                    <a href="/products/автотовары/автомагнитолы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Автомагнитолы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vidioreg.jpg" alt="Card image cap">
                                    <a href="/products/автотовары/видеорегистраторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Видеорегистраторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/radar.jpg" alt="Card image cap">
                                    <a href="/products/автотовары/радар_детекторы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Радар детекторы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/avtoacustica.jpg" alt="Card image cap">
                                    <a href="/products/автотовары/автоакустика">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Автоакустика</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("гаджеты")>in show active</#if>" id="panel11" role="tabpanel">
                        <div class="card-deck">
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/bluetoothaudio.jpg" alt="Card image cap">
                                    <a href="/products/гаджеты/bluetooth_колонки">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Bluetooth колонки</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/smartwatch.jpg" alt="Card image cap">
                                    <a href="/products/гаджеты/умные_часы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Умные часы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/fitness.jpg" alt="Card image cap">
                                    <a href="/products/гаджеты/фитнес_браслеты">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Фитнес браслеты</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/kidswatch.jpg" alt="Card image cap">
                                    <a href="/products/гаджеты/детские_часы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Детские часы</h4>
                                </div>
                            </div>
                            <div class="card catalog-card">
                                <div class="view overlay catalog-pic">
                                    <img class="img-fluid scale-pic" src="/../img/vr.jpg" alt="Card image cap">
                                    <a href="/products/гаджеты/VR_системы">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">VR системы</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("инструмент")>in show active</#if>" id="panel18" role="tabpanel">
                        <div class="card-deck" id="deckинструмент">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <#---->
                    <div class="tab-pane fade <#if url?contains("подсобное_хозяйство") || url?contains("техника_для_подсобного_хозяйства")>in show active</#if>" id="panel12" role="tabpanel">
                        <div class="card-deck" id="deckтехника_для_подсобного_хозяйства">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="tab-pane fade <#if url?contains("садово-огородный_инвентарь")>in show active</#if>" id="panel13" role="tabpanel">
                        <div class="card-deck" id="deckсадово-огородный_инвентарь">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="tab-pane fade <#if url?contains("консервирование")>in show active</#if>" id="panel14" role="tabpanel">
                        <div class="card-deck" id="deckконсервирование">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="tab-pane fade <#if url?lower_case?contains("отопительное_оборудование")>in show active</#if>" id="panel15" role="tabpanel">
                        <div class="card-deck" id="deckотопительное_оборудование">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="tab-pane fade <#if url?contains("спорт_и_отдых")>in show active</#if>" id="panel16" role="tabpanel">
                        <div class="card-deck" id="deckспорт_и_отдых">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="tab-pane fade <#if url?contains("товары_для_отдыха_на_природе")>in show active</#if>" id="panel17" role="tabpanel">
                        <div class="card-deck" id="deckтовары_для_отдыха_на_природе">
                            <#if groups??>
                                <#list groups as group>
                                    <div class="card catalog-card">
                                        <div class="view overlay catalog-pic">
                                            <#if group?contains(";")>
                                                <img class="img-fluid scale-pic" src="${group?substring(group?last_index_of(";")+1)}" alt="Card image cap">
                                                <a href="/products/инструмент/${group?substring(0, group?last_index_of(";"))}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            <#else>
                                                <img class="img-fluid scale-pic" src="/../img/nophoto.jpg" alt="Card image cap">
                                                <a href="/products/инструмент/${group}">
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </#if>
                                        </div>
                                        <div class="card-body">
                                            <#if group?contains(";")>
                                                <h4 class="card-title">${group?substring(0, group?last_index_of(";"))}</h4>
                                            <#else>
                                                <h4 class="card-title">${group}</h4>
                                            </#if>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>
<style>
    a:hover {
        color: #e52d00 !important;
    }
    ul {
        list-style: none;
    }
</style>



