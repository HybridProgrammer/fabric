<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    

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
                    </tr>
                    </tbody>
                </table>
                <div>

                </div>


                <button type="button" class="btn btn-primary" onclick="addRectangle();">Rectangle</button>
                <button type="button" class="btn btn-primary" onclick="addTriangle();">Triangle</button>
                <button type="button" class="btn btn-primary" onclick="addTrapezoid();">Trapezoid</button>
                <button type="button" class="btn btn-primary" onclick="addCircle();">Circle</button>
                <button type="button" class="btn btn-primary" onclick="addEllipse();">Ellipse</button>
                <button type="button" class="btn btn-primary" onclick="addStar();">Star</button>
                <div id="colorPicker">
                    <a class="color"><div class="colorInner"></div></a>
                    <div class="track"></div>
                    <ul class="dropdown"><li></li></ul>
                    <input type="hidden" class="colorInput"/>
                </div>
                <button type="button" class="btn btn-primary" onclick="remove();">Remove</button>
                <button type="button" class="btn btn-primary" onclick="download();">Download</button>
            </div>
        </div>
        </section>
    </div>

</body>
</html>
