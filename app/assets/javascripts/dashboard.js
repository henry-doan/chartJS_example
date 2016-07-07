$(document).ready( function() {
  if (window.location.pathname === '/') {
    var data = {};
    $.ajax({
      url: '/inventors_hired',
      type: 'GET'
    }).done( function(result) {
      var records = result.records;
      var labels = [];
      var counts = [];
      for (var key in records) {
        labels.push(key);
        counts.push(records[key]);
      }
      data = {
        labels: labels,
        datasets: [{
          label: 'Hire Date',
          data: counts,
           backgroundColor: "rgba(179,181,198,0.2)",
            borderColor: "rgba(179,181,198,1)",
            pointBackgroundColor: "rgba(179,181,198,1)",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(179,181,198,1)"
        }]
      }
      var inventorsHired = $('#inventors_hired');
      var invHiredChart = new Chart(inventorsHired, {
        type: 'radar',
        data: data,
        options: {
          responsive: true
        }
      });
    })

    function randomColor() {
    	 var r = Math.floor(Math.random() * 255);
    	 var g = Math.floor(Math.random() * 255);
    	 var b = Math.floor(Math.random() * 255);
    	 return 'rgb(' + r + ',' + g + ',' + b + ')';
    }

    var robotData = {}
    $.ajax({
    	url: '/by_industry',
    	type: 'GET'
    }).done(function(result) {
    	var robots = result.robots;
    	var counts = [];
    	var labels = [];
    	var colors = [];
    	for (var key in robots) {
    		labels.push(key);
    		counts.push(robots[key]);
    		colors.push(randomColor());
    	}
    	robotData = {
    		datasets: [{
    			data: counts,
    			backgroundColor: colors
    		}],
    		labels: labels
    	}
    	var robotsByIndustry = $('#robots_by_industry')
    	var robotChart = new Chart(robotsByIndustry, {
    		data: robotData,
    		type: 'polarArea'
    	})
    });
  }
});