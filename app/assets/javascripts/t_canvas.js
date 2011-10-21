chart=null;


function copyObject()
{
    var t = $('.graphic_data > tbody > tr.element:last').clone();
    t.appendTo('table.graphic_data');
}

function checkValue(elem)
{
    var elem_node = jQuery(elem);
    var count_val = elem_node.attr('value');
    var int_count_val = parseFloat(count_val);

    if ((int_count_val < 0) || (("" + int_count_val) != count_val) || (count_val.length==0)) {
        elem_node.css('background-color', '#FF0000');
        return false;
    }
    else if (int_count_val == 0) {
        elem_node.css('background-color', '#FFFF00');
    }
    else {
        elem_node.removeAttr('style');
    }

    return true;
}

function getData()
{
    var ret = [];
    $('.graphic_data > tbody > tr.element').each(function(){
        var childs = $(this).children().children();
        ret.push({'name' : $(childs[0]).val(), 'value' : parseFloat($(childs[1]).val())});
    })

    return ret;
}

function clea(obj)
{
    if (obj != null)
    {
        obj.clear();
    }
}

function drawGraphics(type)
{
    var data = getData();
    var update = (chart != null);
    clea(chart);

    //if (!update)
    {
        switch(type)
        {
            case "bar" :
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = data;
                chart.categoryField = "name";
                chart.marginTop = 32;
                chart.marginLeft = 15;
                chart.marginRight = 15;
                chart.startDuration = 2;
                chart.backgroundColor = ["#FFFFFF", "#DADADA"];
                chart.backgroundAlpha = 0.5;

                chart.balloon.textShadowColor = "#000000";

                var catAxis2 = chart.categoryAxis;
                catAxis2.gridAlpha = 0;
                catAxis2.axisAlpha = 0;
                catAxis2.labelsEnabled = false;

                var valAxis2 = new AmCharts.ValueAxis();
                valAxis2.gridAlpha = 0;
                valAxis2.axisAlpha = 0;
                valAxis2.labelsEnabled = false;
                valAxis2.minimum = 0;
                chart.addValueAxis(valAxis2);

                var graph2 = new AmCharts.AmGraph();
                graph2.balloonText = "[[name]]: [[value]]";
                graph2.valueField = "value";
                graph2.descriptionField = "name";
                graph2.type="column";
                graph2.lineAlpha = 0;
                graph2.fillAlphas = 1;
                graph2.fillColors = ["#DADADA","#000000"];
                graph2.labelPosition="bottom";
                graph2.labelText="[[description]]";
                chart.addGraph(graph2);
            break;
            case "pie" :
                chart = new AmCharts.AmPieChart();
                chart.depth3D = 5;
                chart.angle = 5;
                chart.innerRadius = "50%";
                chart.startDuration = 5;
                chart.labelRadius = 30;
                chart.labelText = "[[percents]]%";
                //chart.labelText = "[[title]]: [[value]]";
                chart.color = "FFFFFF";
                chart.dataProvider = data;
                chart.titleField = "name";
                chart.valueField = "value";

                legend = new AmCharts.AmLegend();
                legend.color = "FFFFFF";
                legend.align = "center";
                legend.markerType = "circle";
                chart.addLegend(legend);
            break;
            case "radar" :

                chart = new AmCharts.AmRadarChart();
                chart.startDuration = 2;

                chart.dataProvider = data;
                chart.categoryField = "name";

                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0.15;
                valueAxis.minimum = 0;
                valueAxis.dashLength = 3;
                valueAxis.axisTitleOffset = 20;
                valueAxis.gridCount = 5;
                valueAxis.color = "FFFFFF";
                valueAxis.gridColor = "FFFFFF";
                valueAxis.thickness = 10;
                chart.addValueAxis(valueAxis);

                var graph = new AmCharts.AmGraph();
                graph.valueField = "value";
                graph.bullet = "round";
                graph.balloonText = "[[value]]"
                graph.color = "FFFFFF";
                chart.addGraph(graph);
            break;
            case "line" :
                chart = new AmCharts.AmSerialChart();
                //chart.addListener("dataUpdated", zoom);
                chart.marginTop = 15;
                chart.marginLeft = 110;
                chart.marginRight = 50;

                chart.dataProvider = data;
                chart.categoryField = "name";

                //chart.categoryAxis.parseDates = true;

                var valAxis1 = new AmCharts.ValueAxis();
                valAxis1.axisColor = "#FF6600";
                valAxis1.axisThickness = 2;
                valAxis1.color = "FFFFFF";
                valAxis1.gridColor = "FFFFFF";
                chart.addValueAxis(valAxis1);

                var graph1 = new AmCharts.AmGraph();
                graph1.valueAxis = valAxis1;
                graph1.valueField = "value";
                graph1.type = "smoothedLine";
                graph1.bullet = "round";
                graph1.hideBulletsCount = 30;
                graph1.color = "FFFFFF";
                chart.addGraph(graph1);

//            var valAxis2 = new AmCharts.ValueAxis();
//            valAxis2.position = "right";
//            valAxis2.axisColor = "#FCD202";
//            valAxis2.gridAlpha = 0;
//            valAxis2.axisThickness = 2;
//            chart4.addValueAxis(valAxis2);
//
//            var graph2 = new AmCharts.AmGraph();
//            graph2.valueAxis = valAxis2;
//            graph2.valueField = "hits";
//            graph2.type = "smoothedLine";
//            graph2.bullet = "square";
//            graph2.hideBulletsCount = 30;
//            chart4.addGraph(graph2);

//            valAxis3 = new AmCharts.ValueAxis();
//            valAxis3.offset = 50;
//            valAxis3.gridAlpha = 0;
//            valAxis3.axisColor = "#B0DE09";
//            valAxis3.axisThickness = 2;
//            chart4.addValueAxis(valAxis3);
//
//            var graph3 = new AmCharts.AmGraph();
//            graph3.valueField = "views";
//            graph3.bullet = "triangleUp";
//            graph3.hideBulletsCount = 30;
//            graph3.type = "smoothedLine";
//            graph3.valueAxis = valAxis3;
//            chart4.addGraph(graph3);

//            var chartCursor = new AmCharts.ChartCursor();
//            chart4.addChartCursor(chartCursor);
//
//            var chartScrollbar = new AmCharts.ChartScrollbar();
//            chartScrollbar.graph = graph1;
//            chart4.addChartScrollbar(chartScrollbar);
            break;
        }
    }

    chart.write("graphics");
    chart.validateData();
    chart.validateNow();
}




// функция рисует под углом линию из указанной точки длиной ln
function drawLine(x, y, ln, angle) {
  context.moveTo(x, y);
  context.lineTo(Math.round(x + ln * Math.cos(angle)), Math.round(y - ln * Math.sin(angle)));
}
// Функция рисует дерево
function drawTree(x, y, ln, minLn, angle) {
  if (ln > minLn) {
      ln = ln * 0.75;
      drawLine(x, y, ln, angle);
      x = Math.round(x + ln * Math.cos(angle));
      y = Math.round(y - ln * Math.sin(angle));
      drawTree(x, y, ln, minLn, angle + Math.PI/4);
      drawTree(x, y, ln, minLn, angle - Math.PI/5.5);
      // если поставить угол Math.PI/4 , то выйдет классическое дерево
  }
}
// Инициализация переменных
function init() {
  var canvas = document.getElementById("tree");
  context = canvas.getContext("2d");
  canvas.width = 740; // Ширина холста
  canvas.height = 640; // высота холста
  var x = canvas.width / 2;
  var y = canvas.height;
  var ln = 200; // начальная длина линии
  var minLn = 5; // минимальная длина до которой рисуются линии
  context.fillStyle = "#ddf"; // цвет фона
  context.strokeStyle = "#020"; //цвет линий
  context.fillRect(0, 0, canvas.width, canvas.height);
  context.lineWidth = 2; // ширина линий
  context.beginPath();
  drawTree(x, y, ln, minLn, Math.PI / 2);
  context.stroke();
}

  $(document).ready(function() {
      if (document.getElementById("tree"))
         init();
  });


//<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
//<html>
//    <head>
//        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
//        <title>amCharts examples</title>
//        <link rel="stylesheet" href="style.css" type="text/css">
//        <script src="../../amcharts/javascript/amcharts.js" type="text/javascript"></script>
//        <script src="../../amcharts/javascript/raphael.js" type="text/javascript"></script>
//
//        <script type="text/javascript">
//
//            var chart;
//            var graph;
//
//            var chartData = [{year:new Date(1950,0), value:-0.307},
//                {year:new Date(1951,0), value:-0.168},
//                {year:new Date(1952,0), value:-0.073},
//                {year:new Date(1953,0), value:-0.027},
//                {year:new Date(1954,0), value:-0.251},
//                {year:new Date(1955,0), value:-0.281},
//                {year:new Date(1956,0), value:-0.348},
//                {year:new Date(1957,0), value:-0.074},
//                {year:new Date(1958,0), value:-0.011},
//                {year:new Date(1959,0), value:-0.074},
//                {year:new Date(1960,0), value:-0.124},
//                {year:new Date(1961,0), value:-0.024},
//                {year:new Date(1962,0), value:-0.022},
//                {year:new Date(1963,0), value:0.000},
//                {year:new Date(1964,0), value:-0.296},
//                {year:new Date(1965,0), value:-0.217},
//                {year:new Date(1966,0), value:-0.147},
//                {year:new Date(1967,0), value:-0.150},
//                {year:new Date(1968,0), value:-0.160},
//                {year:new Date(1969,0), value:-0.011},
//                {year:new Date(1970,0), value:-0.068},
//                {year:new Date(1971,0), value:-0.190},
//                {year:new Date(1972,0), value:-0.056},
//                {year:new Date(1973,0), value:0.077},
//                {year:new Date(1974,0), value:-0.213},
//                {year:new Date(1975,0), value:-0.170},
//                {year:new Date(1976,0), value:-0.254},
//                {year:new Date(1977,0), value:0.019},
//                {year:new Date(1978,0), value:-0.063},
//                {year:new Date(1979,0), value:0.050},
//                {year:new Date(1980,0), value:0.077},
//                {year:new Date(1981,0), value:0.120},
//                {year:new Date(1982,0), value:0.011},
//                {year:new Date(1983,0), value:0.177},
//                {year:new Date(1984,0), value:-0.021},
//                {year:new Date(1985,0), value:-0.037},
//                {year:new Date(1986,0), value:0.030},
//                {year:new Date(1987,0), value:0.179},
//                {year:new Date(1988,0), value:0.180},
//                {year:new Date(1989,0), value:0.104},
//                {year:new Date(1990,0), value:0.255},
//                {year:new Date(1991,0), value:0.210},
//                {year:new Date(1992,0), value:0.065},
//                {year:new Date(1993,0), value:0.110},
//                {year:new Date(1994,0), value:0.172},
//                {year:new Date(1995,0), value:0.269},
//                {year:new Date(1996,0), value:0.141},
//                {year:new Date(1997,0), value:0.353},
//                {year:new Date(1998,0), value:0.548},
//                {year:new Date(1999,0), value:0.298},
//                {year:new Date(2000,0), value:0.267},
//                {year:new Date(2001,0), value:0.411},
//                {year:new Date(2002,0), value:0.462},
//                {year:new Date(2003,0), value:0.470},
//                {year:new Date(2004,0), value:0.445},
//                {year:new Date(2005,0), value:0.470}];
//
//
//            window.onload = function()
//            {
//                chart = new AmCharts.AmSerialChart();
//                chart.pathToImages = "../../amcharts/javascript/images/";
//                chart.marginTop = 15;
//                chart.marginLeft = 60;
//                chart.marginRight = 50;
//                chart.dataProvider = chartData;
//                chart.categoryField = "year";
//
//                graph = new AmCharts.AmGraph();
//                graph.lineColor = "#CC0000";
//                graph.fillColors = "#CC0000";
//                graph.negativeLineColor = "#009900";
//                graph.negativeFillColors = "#009900";
//                graph.fillAlphas = 0.3;
//                graph.valueField = "value";
//                graph.type = "smoothedLine";
//                chart.addGraph(graph);
//
//                var catAxis = chart.categoryAxis;
//                catAxis.parseDates = true;
//                catAxis.minPeriod = "YYYY";
//                catAxis.axisColor = "#FFFFFF";
//                catAxis.gridColor = "#FFFFFF";
//                catAxis.gridAlpha = 0.5;
//                catAxis.dashLength = 5;
//                catAxis.autoGridCount = true;
//
//                var valAxis = new AmCharts.ValueAxis();
//                valAxis.axisColor = "#FFFFFF";
//                valAxis.gridColor = "#FFFFFF";
//                valAxis.gridAlpha = "0.5";
//                valAxis.dashLength = 5;
//                chart.addValueAxis(valAxis);
//
//                var chartCursor = new AmCharts.ChartCursor();
//                chartCursor.cursorAlpha = 0;
//                chartCursor.cursorPosition = "mouse";
//                chartCursor.categoryBalloonDateFormat = "YYYY";
//                chart.addChartCursor(chartCursor);
//
//                var chartScrollbar = new AmCharts.ChartScrollbar();
//                chartScrollbar.graph = graph;
//                chartScrollbar.backgroundAlpha = 0.1;
//                chartScrollbar.backgroundColor = "#000000";
//                chartScrollbar.scrollbarHeight = 40;
//
//                chartScrollbar.selectedBackgroundColor = "#FFCC32";
//                chart.addChartScrollbar(chartScrollbar);
//
//                chart.write("chartdiv");
//            }
//
//            function setType()
//            {
//                var newType;
//                if(document.getElementById("rb1").checked)
//                {
//                    newType = "line";
//                }
//                if(document.getElementById("rb2").checked)
//                {
//                    newType = "smoothedLine";
//                }
//                if(document.getElementById("rb3").checked)
//                {
//                    newType = "step";
//                }
//                if(graph.type != newType)
//                {
//                    graph.type = newType;
//                    chart.validateNow();
//                }
//            }
//
//
//        </script>
//
//    </head>
//
//    <body>
//        <div id="chartdiv" style="width:600px; height:400px; background-color:#FFCC32;"></div>
//        <input type="radio" name="group" id="rb1" onclick="setType()"> line
//        <input type="radio" checked="true"  name="group" id="rb2" onclick="setType()"> smoothed line
//        <input type="radio" name="group" id="rb3" onclick="setType()"> step
//    </body>
//</html>