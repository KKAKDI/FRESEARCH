<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<style type='text/css'>
a.no-uline {
	text-decoration: none
}
</style>
<style>
.test_btn1 {
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}
</style>

<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<button type="button" id='addReplyBtn'
								class="btn btn-inverse-primary btn-fw">
								<!--  <a href='/charts/pages/charts/Area'>나이</a>-->
								나이
								
								
							</button>
						</h4>
						<canvas id="barChartAge"></canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">

						<h4 class="card-title">
							<button type='button' id='area' class="btn btn-inverse-primary btn-fw">
								지역
							</button>
						</h4>
						<canvas id="barChartArea"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<button type='button' class="btn btn-inverse-primary btn-fw">
								전체
							</button>
						</h4>
						<canvas id="pieChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<button type='button' class="btn btn-inverse-primary btn-fw">
								성별
							</button>
						</h4>
						<canvas id="doughnutChartSex"></canvas>
					</div>
				</div>
			</div>


			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<button type='button' class="btn btn-inverse-primary btn-fw">
								결혼유무
							</button>
						</h4>
						<canvas id="doughnutChartMarriage"></canvas>
					</div>
				</div>
			</div>
		</div>


		<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">
										<button type="button" id='addReplyBtn'
											class="btn btn-inverse-primary btn-fw">
											<!--  <a href='/charts/pages/charts/Area'>나이</a>-->
											나이
										</button>
									</h4>
									<canvas id="barChartAge"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		


<script type="text/javascript">
	$(document).ready(function() {

			$("#addReplyBtn").on("click", function(e){
			      $(".modal").modal("show");
			 });
			$("#area").on("click", function(e){
			      location.href='/stats/stats_area';
			 });
			 //여기까지 모달이랑 클릭 이벤트 등등
			 
			 
			 
			 
			 //차트 js 파일
			$(function() {
				  /* ChartJS
				   * -------
				   * Data and config for chartjs
				   */
				  'use strict';
				  
				  var data = {
				    labels: ["2013", "2014", "2014", "2015", "2016", "2017"],
				    datasets: [{
				      label: '# of Votes',
				      data: [17, 19, 3, 5, 2, 3],
				      backgroundColor: [
				        'rgba(255, 99, 132, 0.2)',
				        'rgba(54, 162, 235, 0.2)',
				        'rgba(255, 206, 86, 0.2)',
				        'rgba(75, 192, 192, 0.2)',
				        'rgba(153, 102, 255, 0.2)',
				        'rgba(255, 159, 64, 0.2)'
				      ],
				      borderColor: [
				        'rgba(255,99,132,1)',
				        'rgba(54, 162, 235, 1)',
				        'rgba(255, 206, 86, 1)',
				        'rgba(75, 192, 192, 1)',
				        'rgba(153, 102, 255, 1)',
				        'rgba(255, 159, 64, 1)'
				      ],
				      borderWidth: 1,
				      fill: false
				    }]
				  };
				  
				  
				  
				  var ten = ${ten};
					var twenty = ${twenty};
					var thiry = ${thiry};
					var forty =${forty};
					var fifty = ${fifty};
					var sixty = ${sixty};
				  var dataAge = {
						    labels: ["10", "20", "30", "40", "50", "60"],
						    datasets: [{
						      label: '# of Votes',
						      data: [${ten}, ${twenty}, ${thiry}, ${forty},${fifty}, ${sixty}],
						      backgroundColor: [
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				  
				  var gyeongGi = ${gyeongGi};
				  var incheon = ${incheon};
				  var busan = ${busan};
				  var seoul = ${seoul};
				  var dataArea = {
						    labels: ["서울", "경기", "부산", "인천"],
						    datasets: [{
						      label: '# labels',
						      data: [${seoul}, ${busan}, ${incheon}, ${gyeongGi}, 2, 3],
						      backgroundColor: [
						        'rgba(255, 99, 132, 0.2)',
						        'rgba(54, 162, 235, 0.2)',
						        'rgba(255, 206, 86, 0.2)',
						        'rgba(75, 192, 192, 0.2)',
						        'rgba(153, 102, 255, 0.2)',
						        'rgba(255, 159, 64, 0.2)'
						      ],
						      borderColor: [
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',
						        'rgba(153, 102, 255, 1)',
						        'rgba(255, 159, 64, 1)'
						      ],
						      borderWidth: 1,
						      fill: false
						    }]
						  };
				  var multiLineData = {
				    labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
				    datasets: [{
				        label: 'Dataset 1',
				        data: [12, 19, 3, 5, 2, 3],
				        borderColor: [
				          '#587ce4'
				        ],
				        borderWidth: 2,
				        fill: false
				      },
				      {
				        label: 'Dataset 2',
				        data: [5, 23, 7, 12, 42, 23],
				        borderColor: [
				          '#ede190'
				        ],
				        borderWidth: 2,
				        fill: false
				      },
				      {
				        label: 'Dataset 3',
				        data: [15, 10, 21, 32, 12, 33],
				        borderColor: [
				          '#f44252'
				        ],
				        borderWidth: 2,
				        fill: false
				      }
				    ]
				  };
				  var options = {
				    scales: {
				      yAxes: [{
				        ticks: {
				          beginAtZero: true
				        }
				      }]
				    },
				    legend: {
				      display: false
				    },
				    elements: {
				      point: {
				        radius: 0
				      }
				    }
				    

				  };
				  //변수들
				  var education = ${education};
				  var computer = ${computer};
				  var game = ${game};
				  var entertainment = ${entertainment};
				  var life = ${life};
				  var heath = ${heath};
				  var society = ${society};
				  var economy = ${economy};
				  var travel = ${travel};
				  var sports = ${sports};
				  var shopping = ${shopping};
				  var region = ${region};
				  var marriage = ${marriage};
				  //.변수들
				  var doughnutPieData = {
				    datasets: [{
				      data: [${education}, ${computer}, ${game},${entertainment},${life},${heath},${society},${economy},${travel},${sports},${shopping},${region},${marriage}],
				      backgroundColor: [
				        'rgba(255, 99, 132, 0.5)',
				        'rgba(54, 162, 235, 0.5)',
				        'rgba(255, 206, 86, 0.5)',
				        'rgba(75, 192, 192, 0.5)',
				        'rgba(153, 102, 255, 0.5)',
				        'rgba(051, 051, 051, 0.5)',
				        'rgba(255, 159, 64, 0.5)',
				        'rgba(255, 255, 102, 0.5)',
				        'rgba(102, 102, 153, 0.5)',
				        'rgba(255, 000, 255, 0.5)',
				        'rgba(102, 204, 102, 0.5)',
				        'rgba(051, 153, 051, 0.5)',
				        'rgba(000, 051, 000, 0.5)'
				      ],
				      borderColor: [
				        'rgba(255,99,132,0)',
				        'rgba(54, 162, 235, 0)',
				        'rgba(255, 206, 86, 0)',
				        'rgba(75, 192, 192, 0)',
				        'rgba(153, 102, 255, 0)',
				        'rgba(051, 051, 051, 0)',
				        'rgba(255, 159, 64, 0)',
				        'rgba(255, 255, 102, 0)',
				        'rgba(102, 102, 153, 0)',
				        'rgba(255, 000, 255, 0)',
				        'rgba(102, 204, 102, 0)',
				        'rgba(051, 153, 051, 0)',
				        'rgba(000, 051, 000, 0)'
				      ],
				    }],

				    // These labels appear in the legend and in the tooltips when hovering different arcs
				    labels: [
				      '교육, 학문',
				      '컴퓨터 통신',
				      '게임',
				      '엔터테인먼트, 예술',
				      '생활',
				      '건강',
				      '사회, 정치',
				      '경제',
				      '여행',
				      '스포츠, 레저',
				      '쇼핑',
				      '지역',
				      '결혼'
				    ]
				  };
				  var boy = ${boy};
				  var girl = ${girl};
				  var doughnutPieDataSex = {
						    datasets: [{
						      data: [${boy}, ${girl}],
						      backgroundColor: [
						        'rgba(54, 162, 235, 0.5)',
						        'rgba(255, 99, 132, 0.5)',//보더 색
						        'rgba(255, 206, 86, 0.5)',
						        'rgba(75, 192, 192, 0.5)',
						      ],
						      borderColor: [
						        'rgba(54, 162, 235, 1)',
						        'rgba(255,99,132,1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',

						      ],
						    }],

						    // These labels appear in the legend and in the tooltips when hovering different arcs
						    labels: [
						      '남자',
						      '여자',

						    ]
						  };
				  
				  var single = ${single};
				  var unsingle = ${unsingle};
				  var doughnutPieDataMarriage = {
						    datasets: [{
						      data: [${unsingle}, ${single}],
						      backgroundColor: [
						        'rgba(255, 99, 132, 0.5)',	//안쪽색
						        'rgba(54, 162, 235, 0.5)',	//보더 색
						        'rgba(255, 206, 86, 0.5)',
						        'rgba(75, 192, 192, 0.5)',
						      ],
						      borderColor: [
						        'rgba(255,99,132,1)',
						        'rgba(54, 162, 235, 1)',
						        'rgba(255, 206, 86, 1)',
						        'rgba(75, 192, 192, 1)',

						      ],
						    }],

						    // These labels appear in the legend and in the tooltips when hovering different arcs
						    labels: [
						      '기혼',
						      '미혼',

						    ]
						  };
				  var doughnutPieOptions = {
				    responsive: true,
				    animation: {
				      animateScale: true,
				      animateRotate: true
				    }
				  };
				  var areaData = {
				    labels: ["2013", "2014", "2015", "2016", "2017"],
				    datasets: [{
				      label: '# of Votes',
				      data: [12, 19, 3, 5, 2, 3],
				      backgroundColor: [
				        'rgba(255, 99, 132, 0.2)',
				        'rgba(54, 162, 235, 0.2)',
				        'rgba(255, 206, 86, 0.2)',
				        'rgba(75, 192, 192, 0.2)',
				        'rgba(153, 102, 255, 0.2)',
				        'rgba(255, 159, 64, 0.2)'
				      ],
				      borderColor: [
				        'rgba(255,99,132,1)',
				        'rgba(54, 162, 235, 1)',
				        'rgba(255, 206, 86, 1)',
				        'rgba(75, 192, 192, 1)',
				        'rgba(153, 102, 255, 1)',
				        'rgba(255, 159, 64, 1)'
				      ],
				      borderWidth: 1,
				      fill: true, // 3: no fill
				    }]
				  };

				  var areaOptions = {
				    plugins: {
				      filler: {
				        propagate: true
				      }
				    }
				  }

				  var multiAreaData = {
				    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				    datasets: [{
				        label: 'Facebook',
				        data: [8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14],
				        borderColor: ['rgba(255, 99, 132, 0.5)'],
				        backgroundColor: ['rgba(255, 99, 132, 0.5)'],
				        borderWidth: 1,
				        fill: true
				      },
				      {
				        label: 'Twitter',
				        data: [7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9],
				        borderColor: ['rgba(54, 162, 235, 0.5)'],
				        backgroundColor: ['rgba(54, 162, 235, 0.5)'],
				        borderWidth: 1,
				        fill: true
				      },
				      {
				        label: 'Linkedin',
				        data: [6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11],
				        borderColor: ['rgba(255, 206, 86, 0.5)'],
				        backgroundColor: ['rgba(255, 206, 86, 0.5)'],
				        borderWidth: 1,
				        fill: true
				      }
				    ]
				  };

				  var multiAreaOptions = {
				    plugins: {
				      filler: {
				        propagate: true
				      }
				    },
				    elements: {
				      point: {
				        radius: 0
				      }
				    },
				    scales: {
				      xAxes: [{
				        gridLines: {
				          display: false
				        }
				      }],
				      yAxes: [{
				        gridLines: {
				          display: false
				        }
				      }]
				    }
				  }

				  var scatterChartData = {
				    datasets: [{
				        label: 'First Dataset',
				        data: [{
				            x: -10,
				            y: 0
				          },
				          {
				            x: 0,
				            y: 3
				          },
				          {
				            x: -25,
				            y: 5
				          },
				          {
				            x: 40,
				            y: 5
				          }
				        ],
				        backgroundColor: [
				          'rgba(255, 99, 132, 0.2)'
				        ],
				        borderColor: [
				          'rgba(255,99,132,1)'
				        ],
				        borderWidth: 1
				      },
				      {
				        label: 'Second Dataset',
				        data: [{
				            x: 10,
				            y: 5
				          },
				          {
				            x: 20,
				            y: -30
				          },
				          {
				            x: -25,
				            y: 15
				          },
				          {
				            x: -10,
				            y: 5
				          }
				        ],
				        backgroundColor: [
				          'rgba(54, 162, 235, 0.2)',
				        ],
				        borderColor: [
				          'rgba(54, 162, 235, 1)',
				        ],
				        borderWidth: 1
				      }
				    ]
				  }

				  var scatterChartOptions = {
				    scales: {
				      xAxes: [{
				        type: 'linear',
				        position: 'bottom'
				      }]
				    }
				  }
				  // Get context with jQuery - using jQuery's .get() method.
				  if ($("#barChartAge").length) {
				    var barChartCanvas = $("#barChartAge").get(0).getContext("2d");
				    // This will get the first returned node in the jQuery collection.
				    var barChart = new Chart(barChartCanvas, {
				      type: 'bar',
				      data: dataAge,
				      options: options
				    });
				  }
				  if ($("#barChartArea").length) {
					    var barChartCanvas = $("#barChartArea").get(0).getContext("2d");
					    // This will get the first returned node in the jQuery collection.
					    var barChart = new Chart(barChartCanvas, {
					      type: 'bar',
					      data: dataArea,
					      options: options
					    });
					  }

				  if ($("#lineChart").length) {
				    var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
				    var lineChart = new Chart(lineChartCanvas, {
				      type: 'line',
				      data: data,
				      options: options
				    });
				  }

				  if ($("#linechart-multi").length) {
				    var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
				    var lineChart = new Chart(multiLineCanvas, {
				      type: 'line',
				      data: multiLineData,
				      options: options
				    });
				  }

				  if ($("#areachart-multi").length) {
				    var multiAreaCanvas = $("#areachart-multi").get(0).getContext("2d");
				    var multiAreaChart = new Chart(multiAreaCanvas, {
				      type: 'line',
				      data: multiAreaData,
				      options: multiAreaOptions
				    });
				  }

				  if ($("#doughnutChartSex").length) {
				    var doughnutChartCanvas = $("#doughnutChartSex").get(0).getContext("2d");
				    var doughnutChart = new Chart(doughnutChartCanvas, {
				      type: 'doughnut',
				      data: doughnutPieDataSex,
				      options: doughnutPieOptions
				    });
				  }
				  if ($("#doughnutChartMarriage").length) {
					    var doughnutChartCanvas = $("#doughnutChartMarriage").get(0).getContext("2d");
					    var doughnutChart = new Chart(doughnutChartCanvas, {
					      type: 'doughnut',
					      data: doughnutPieDataMarriage,
					      options: doughnutPieOptions
					    });
					  }

				  if ($("#pieChart").length) {
				    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
				    var pieChart = new Chart(pieChartCanvas, {
				      type: 'pie',
				      data: doughnutPieData,
				      options: doughnutPieOptions
				    });
				  }

				  if ($("#areaChart").length) {
				    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
				    var areaChart = new Chart(areaChartCanvas, {
				      type: 'line',
				      data: areaData,
				      options: areaOptions
				    });
				  }

				  if ($("#scatterChart").length) {
				    var scatterChartCanvas = $("#scatterChart").get(0).getContext("2d");
				    var scatterChart = new Chart(scatterChartCanvas, {
				      type: 'scatter',
				      data: scatterChartData,
				      options: scatterChartOptions
				    });
				  }

				  if ($("#browserTrafficChart").length) {
				    var doughnutChartCanvas = $("#browserTrafficChart").get(0).getContext("2d");
				    var doughnutChart = new Chart(doughnutChartCanvas, {
				      type: 'doughnut',
				      data: browserTrafficData,
				      options: doughnutPieOptions
				    });
				  }
				});
			
			
			
	});
	
</script>












		<!-- content-wrapper ends -->
		<!-- partial:../../partials/_footer.html -->
		<%@include file="../includes/footer.jsp"%>