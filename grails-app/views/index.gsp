<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Fabric Designer</title>
    
    <style>
        .color-box {
            float: left;
            border: 1px solid gray;
            width: 40px;
            height: 40px;
            margin-left: 1px;
            cursor: pointer;
            padding-top: 5px;
            padding-left: 3px;
        }
        .color-box-horizontal {
            float: left;
            border: 1px solid gray;
            width: 100px;
            height: 40px;
            margin-left: 1px;
            cursor: pointer;
            padding-top: 5px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
            </ul>
        </li>
    </content>

    <div id="content" role="main">

        <section class="row colset-2-its">
            <h1>Welcome to Fabric Designer</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>Canvas</h2>
                <canvas id="canvas" width="500" height="500" style="border: 5px solid gray;"></canvas>
            </div>
            <div class="col-md-4">
                <h2>Pallet</h2>
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <td onclick="addSquare();">
                            <canvas id="canvasSquare" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Square</strong>
                        </td>
                        <td onclick="addRectangle();">
                            <canvas id="canvasRectangle" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Rectangle</strong>
                        </td>
                        <td onclick="addTriangle();">
                            <canvas id="canvasTriangle" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Triangle</strong>
                        </td>
                    </tr>
                    <tr>
                        <td onclick="addTrapezoid();">
                            <canvas id="canvasTrapezoid" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Trapezoid</strong>
                        </td>
                        <td onclick="addCircle();">
                            <canvas id="canvasCircle" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Circle</strong>
                        </td>
                        <td onclick="addEllipse();">
                            <canvas id="canvasEllipse" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Ellipse</strong>
                        </td>
                    </tr>
                    <tr>
                        <td onclick="addStar();">
                            <canvas id="canvasStar" width="100" height="100" style="border: 1px solid gray; display: block;"></canvas>
                            <strong style="margin-left: 15px">Star</strong>
                        </td>
                        <td>

                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="color-box" style="background: red;">Red</div>
                <div class="color-box" style="background: blue;">Blue</div>

                
                <div id="colorPicker">
                    <a class="color"><div class="colorInner"></div></a>
                    <div class="track"></div>
                    <ul class="dropdown"><li></li></ul>
                    <input type="hidden" class="colorInput"/>
                </div>
                <button type="button" class="btn btn-primary" onclick="remove();">Remove</button>
                <button type="button" class="btn btn-primary" onclick="download();">Download</button>
            </div>
            <div class="col-md-2">
                <h2>Colors</h2>
                <div class="color-box-horizontal" style="background: red;" onclick="changeColor(this);">Red</div>
                <div class="color-box-horizontal" style="background: blue;" onclick="changeColor(this);">Blue</div>
            </div>
        </div>
        </section>
    </div>

</body>
</html>
