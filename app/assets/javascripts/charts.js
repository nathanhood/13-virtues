(function(){

  $(document).ready(init);

  function init(){
    retrieveChartsData();
  }

  function retrieveChartsData(){
    $.ajax({
      url: "/api/charts/show",
      type: "GET",
      dataType: "json",
      success: (function(data){
        if ( $.isEmptyObject(data.reports) ) {
          defaultFormat();
        } else {
          var ratings = buildMainGraphObject(data.reports);
          buildPieChart(data.percentages);
          buildMainGraph(ratings);
          buildBarGraph(data.monthly_avg);
        }
      })
    });
  }

  function defaultFormat(){
    // console.log("default format called");
  }

  function buildMainGraphObject(reports){
    var array = [];
    $.each(reports, function(index, report) {
      report.data.forEach(function(d){
        d[0] = Date.UTC(d[0][0], (d[0][1] * 1 - 1), d[0][2]);
      });
      array.push(report);
    });
    return array;
  }

  function buildMainGraph(data){
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
        series: data
    });
  }


  function buildPieChart(data){
    $('#pie-chart').highcharts({
      chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false
      },
      title: {
          text: 'Virtue Rankings - All Time'
      },
      tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      plotOptions: {
          pie: {
              allowPointSelect: true,
              cursor: 'pointer',
              dataLabels: {
                  enabled: false
              },
              showInLegend: true
          }
      },
      series: [{
          type: 'pie',
          name: 'Rating Avg',
          data: data
      }]
    });
  }


  function buildBarGraph(data){
    $('#bar-graph').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Last 30 Days'
        },
        xAxis: {
          categories: ['Average Rating']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rating'
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: data
    });
  }

})();
