(function(){

  $(document).ready(init);

  function init(){
    retrieveMainGraphData();
    buildMainGraph();
  }

  function retrieveMainGraphData(){
    $.ajax({
      url: "/api/users/show",
      type: "GET",
      dataType: "json",
      success: (function(data){
        console.log(data.reports);
        var ratings = buildMainGraphObject(data.reports);
        buildMainGraph(ratings);
      })
    });
  }

  function buildMainGraphObject(reports){
    var array = [];
    $.each(reports, function(index, report) {
      report.data.forEach(function(d){
        d[0] = Date.UTC(d[0][0], d[0][1], d[0][2]);
      });
      array.push(report);
    });
    return array;
  }

  function buildMainGraph(reports){
    $('#main-graph').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: 'Virtuous Summary'
        },
        xAxis: {
            type: 'datetime',
            dateTimeLabelFormats: { // don't display the dummy year
                day: '%e. %b',
                month: '%e. %b',
                year: '%b'
            },
            title: {
                text: 'Date'
            }
        },
        yAxis: {
            title: {
                text: 'Rating'
            },
            min: 0
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br>',
            pointFormat: '{point.x:%e. %b}: <b>{point.y}</b>'
        },
        series: reports
    });
  }
})();
