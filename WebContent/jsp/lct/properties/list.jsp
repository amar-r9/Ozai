<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Tikaana admin dashboard for finacne module"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Admin Dashboard | Ozai</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- This page plugin CSS -->
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.css" rel="stylesheet" type="text/css" />
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.lead {
	margin-bottom: 20px;
	font-size: 16.099999999999998px;
	font-weight: 200;
	line-height: 1.4
}
.img-circle {
	width: 100% !important;
}
#colorstar {
	color: #ee8b2d;
}
.badForm {
	color: #FF0000;
}
.goodForm {
	color: #00FF00;
}
.evaluation {
	margin-left:30px;
} 
</style>
</head>

  <body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <jsp:include page="/common/preloader.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
      <!-- ============================================================== -->
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctheader.jsp"></jsp:include>
	  <a href="<%=request.getContextPath()%>/lct"
			class="card pt-2 ps-2" id="back1"
			style="z-index: 10; margin-bottom: 50px; top: 70px; position: fixed; width: 100%; border-radius: unset; box-shadow: none; background: #233242;">
			<i class="bi bi-arrow-left fa-2x text-white"
			style="vertical-align: bottom;"></i>
		</a>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctsidebar.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper" style="background: #fff;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="text-center">
              <h5 style="font-weight: 800; color: #000;">PROPERTIES</h5>
            </div>
            <div class="col-7 align-self-center d-none d-lg-block">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Properties
                    </li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          
          <!-- Row selection (multiple rows) -->
          <div class="row">
            <div class="col-md-12 col-12">
              <!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
              <div class="">
			  	<div class="row">
					<div class="col-4">
						<a href="<%=request.getContextPath()%>/lct/properties/add-property">
							<div class="card card-body bg-info text-white" style="border-radius: 10px;">
								<i class="fas fa-building fa-2x"></i><br>
								<small>Add Property </small>
							</div>
						</a>
					</div>
					<div class="col-4">
						<a href="<%=request.getContextPath()%>/lct/properties/worksites">
							<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
								<i class="fas fa-industry fa-2x"></i><br>
								<small>Worksites</small>
							</div>
						</a>
					</div>
					<div class="col-4">
						<a href="<%=request.getContextPath()%>/lct/properties/add-worksite">
							<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
								<i class="fas fa-plus fa-2x"></i><br>
								<small>Add Worksite </small>
							</div>
						</a>
					</div>
				</div>
                <div class="card-body">
                  <c:if test="${not empty properties }">
                    <c:forEach items="${properties}" var="pg" varStatus="sno">
						<div class="row user-row card-body" style="
							border-radius: 10px; background: #ecf3ef;">
							<div class="col-sm-3 col-3 col-md-3 col-lg-3">
								<div style="background: #39c5ae; border-radius: 50%; padding-top: 4px;
									font-size: large; color:#FFF; text-align: center; height: 35px; width: 35px;">
									${sno.index+1 }
								</div>
							</div>
							<div class="col-sm-7 col-7 col-md-7 col-lg-7">
								<strong>${pg.name }</strong><br> 
								<small><span class="text-warning"><i class="fas fa-map-marker-alt"></i> ${pg.location }</span></small>
							</div>
							<div
								class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user" style="margin: 0;"
								data-for=".${pg.id }">
								<i class="ri-more-fill fa-2x"></i>
							</div>							
						</div>
						
						<div class="row user-infos ${pg.id }">
							<div
								class="col-sm-12 col-md-10">
								<div class="panel">
									
									<div class="panel-body" style="padding: 0px;">
										<div class="row">
											<div class="col-6">
												<small class="mb-0">Location</small>
												<p class="text-dark">${pg.location }</p>
												<small class="mb-0">City</small>
												<p class="text-dark">${pg.city }</p>
												<small class="mb-0">State</small>
												<p class="text-dark">${pg.state }</p>
											</div>
											<div class="col-6">
												<small class="mb-0">Rooms</small>
												<p class="text-dark">${pg.rooms }</p>
												<small class="mb-0">Tickets</small>
												<p class="text-dark" id="${pg.id }tickets"></p>
												<small class="mb-0">Occupancy</small>
												<p class="text-dark" id="${pg.id}occupancy"></p>
												<script>
										        	$('document').ready(function() {
										        		$.ajax({
										    				type : "GET",
										    				url : "${pageContext.request.contextPath}/getPropertyOccupancy/${pg.id}",
										    				timeout : 100000,
										    				beforeSend:function(){
										    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
										    				},
										    				success : function(data) {
										    					console.log("SUCCESS: ", data);
										    					if(data!=0) {
										    						$('#${pg.id}occupancy').html(data);
										    					} else {
										    						$('#${pg.id}occupancy').html(data);
										    					}
										    				},
										    				error : function(e) {
										    					console.log("ERROR: ", e);
										    				},
										    				done : function(e) {
										    					console.log("DONE");
										    				}
										    			});
										        		$.ajax({
										    				type : "GET",
										    				url : "${pageContext.request.contextPath}/getPropertyTickets/${pg.id}",
										    				timeout : 100000,
										    				beforeSend:function(){
										    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
										    				},
										    				success : function(data) {
										    					console.log("SUCCESS: ", data);
										    					if(data!=0) {
										    						$('#${pg.id}tickets').html(data);
										    					} else {
										    						$('#${pg.id}tickets').html(data);
										    					}
										    				},
										    				error : function(e) {
										    					console.log("ERROR: ", e);
										    				},
										    				done : function(e) {
										    					console.log("DONE");
										    				}
										    			});
										        	});
												</script>
											</div>
										</div>
									</div>
									<div class="panel-footer" style="padding: 10px 10px;">
										<a class="btn btn-default text-dark" style="background: #b9b8be;"
											href="${pg.map }"
											data-toggle="tooltip"
											data-original-title="See Profile">
											<i class="fas fa-map-marker-alt"></i>
										</a>
										<span style="float: right;">											
											<a class="btn btn-yellow" style="background: #ffe450;"
												href="<%=request.getContextPath() %>/lct/properties/add-inventory/${pg.id }"
												data-toggle="tooltip"
												data-original-title="Inventory">
												Inventory
											</a>
											<a class="btn btn-danger text-dark"
												href="<%=request.getContextPath() %>/lct/properties/details/${pg.id }"
												data-toggle="tooltip"
												data-original-title="View details">
												Details
											</a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>            
                 </c:if>
                 <c:if test="${empty properties }">
                 	<h5>No properties added yet.</h5>
                 </c:if>
               	<!-- <a href="<%=request.getContextPath() %>/lct/properties/worksites"
               		class="btn btn-square btn-info d-block">GET THE LIST OF WORK SITES</a> -->
                </div>
              </div>
              <!-- ---------------------
                            end Row selection (multiple rows)
                        ---------------- -->
            </div>
            
          </div>
          <!-- Form inputs -->
          
          <!-- row selection & deletion -->
          
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- -------------------------------------------------------------- -->
          <!-- Right sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- .right-sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- End Right sidebar -->
          <!-- -------------------------------------------------------------- -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">All right reserved by Ozai.</footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- customizer Panel -->
    <!-- ============================================================== -->
    
    <div class="chat-windows"></div>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- apps -->
    <script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath() %>/new/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
    <!--This page plugins -->
    <script>
		$('document').ready(function() {
		    var panels = $('.user-infos');
		    var panelsButton = $('.dropdown-user');
		    panels.hide();

		    //Click dropdown
		    panelsButton.click(function() {
		        //get data-for attribute
		        var dataFor = $(this).attr('data-for');
		        var idFor = $(dataFor);

		        //current button
		        var currentButton = $(this);
		        idFor.slideToggle(400, function() {
		            //Completed slidetoggle
		            if(idFor.is(':visible'))
		            {
		                currentButton.html('<i class="fas fa-window-close fa-2x text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="fas fa-plus-circle fa-2x text-dark"></i>');
		            }
		        })
		    });


		    $('[data-toggle="tooltip"]').tooltip();

		    $('button').click(function(e) {
		        e.preventDefault();
		        alert("This is a demo.\n :-)");
		    });
		});
	</script>
    <script>
	    $(function () {
	        "use strict";
	        $("#main-wrapper").AdminSettings({
	          Theme: true, // this can be true or false ( true means dark and false means light ),
	          Layout: "horizontal",
	          LogoBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          NavbarBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarType: "overlay", // You can change it full / mini-sidebar / iconbar / overlay
	          SidebarColor: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
	        });
	    });
		$('document').ready(function(){
    		$('#hideBack').hide();    		
    		$('.sidebartoggler').toggle();
    	});
    </script>
    <script>
		 // Starrr plugin (https://github.com/dobtco/starrr)
		    var __slice = [].slice;
		
		    (function($, window) {
		      var Starrr;
		
		      Starrr = (function() {
		        Starrr.prototype.defaults = {
		          rating: void 0,
		          numStars: 5,
		          change: function(e, value) {}
		        };
		
		        function Starrr($el, options) {
		          var i, _, _ref,
		            _this = this;
		
		          this.options = $.extend({}, this.defaults, options);
		          this.$el = $el;
		          _ref = this.defaults;
		          for (i in _ref) {
		            _ = _ref[i];
		            if (this.$el.data(i) != null) {
		              this.options[i] = this.$el.data(i);
		            }
		          }
		          this.createStars();
		          this.syncRating();
		          this.$el.on('mouseover.starrr', 'span', function(e) {
		            return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
		          });
		          this.$el.on('mouseout.starrr', function() {
		            return _this.syncRating();
		          });
		          this.$el.on('click.starrr', 'span', function(e) {
		            return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
		          });
		          this.$el.on('starrr:change', this.options.change);
		        }
		
		        Starrr.prototype.createStars = function() {
		          var _i, _ref, _results;
		
		          _results = [];
		          for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
		            _results.push(this.$el.append("<span class='far fa-star'></span>"));
		          }
		          return _results;
		        };
		
		        Starrr.prototype.setRating = function(rating) {
		          if (this.options.rating === rating) {
		            rating = void 0;
		          }
		          this.options.rating = rating;
		          this.syncRating();
		          return this.$el.trigger('starrr:change', rating);
		        };
		
		        Starrr.prototype.syncRating = function(rating) {
		          var i, _i, _j, _ref;
		
		          rating || (rating = this.options.rating);
		          if (rating) {
		            for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
		              this.$el.find('span').eq(i).removeClass('far fa-star').addClass('fas fa-star');
		            }
		          }
		          if (rating && rating < 5) {
		            for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
		              this.$el.find('span').eq(i).removeClass('fas fa-star').addClass('far fa-star');
		            }
		          }
		          if (!rating) {
		            return this.$el.find('span').removeClass('fas fa-star').addClass('far fa-star');
		          }
		        };
		
		        return Starrr;
		
		      })();
		      return $.fn.extend({
		        starrr: function() {
		          var args, option;
		
		          option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
		          return this.each(function() {
		            var data;
		
		            data = $(this).data('star-rating');
		            if (!data) {
		              $(this).data('star-rating', (data = new Starrr($(this), option)));
		            }
		            if (typeof option === 'string') {
		              return data[option].apply(data, args);
		            }
		          });
		        }
		      });
		    })(window.jQuery, window);
		
		    $(function() {
		      return $(".starrr").starrr();
		    });
		
		    $( document ).ready(function() {
		        
		        var correspondence=["","Really Bad","Bad","Fair","Good","Excelent"];
		          
		      $('.ratable').on('starrr:change', function(e, value){
		       
		         $(this).closest('.evaluation').children('#count').html(value);
		         $(this).closest('.evaluation').children('#meaning').html(correspondence[value]);
		         
		         var currentval=  $(this).closest('.evaluation').children('#count').html();
		         
		        var target=  $(this).closest('.evaluation').children('.indicators');
		        target.css("color","black");
		        target.children('.rateval').val(currentval);
		        target.children('#textwr').html(' ');
		       
		        
		        if(value<3){
		         target.css("color","red").show(); 
		         target.children('#textwr').text('What can be improved?');
		        }else{
		            if(value>3){    
		                target.css("color","green").show(); 
		                target.children('#textwr').html('What was done correctly?');
		            }else{
		           target.hide();  
		            }
		        }
		        
		      });
		      
		      
		      
		     
		      
		      $('#hearts-existing').on('starrr:change', function(e, value){
		        $('#count-existing').html(value);
		      });
		    });
		
		
		
		
		
		    $(function () {
		        $('.button-checkbox').each(function () {
		
		            // Settings
		            var $widget = $(this),
		                $button = $widget.find('button'),
		                $checkbox = $widget.find('input:checkbox'),
		                color = $button.data('color'),
		                settings = {
		                    on: {
		                        icon: 'glyphicon glyphicon-check'
		                    },
		                    off: {
		                        icon: 'fa fa-square-o'
		                    }
		                };
		
		            // Event Handlers
		            $button.on('click', function () {
		                $checkbox.prop('checked', !$checkbox.is(':checked'));
		                $checkbox.triggerHandler('change');
		                updateDisplay();
		            });
		            $checkbox.on('change', function () {
		                updateDisplay();
		            });
		
		            // Actions
		            function updateDisplay() {
		                var isChecked = $checkbox.is(':checked');
		
		                // Set the button's state
		                $button.data('state', (isChecked) ? "on" : "off");
		
		                // Set the button's icon
		                $button.find('.state-icon')
		                    .removeClass()
		                    .addClass('state-icon ' + settings[$button.data('state')].icon);
		
		                // Update the button's color
		                if (isChecked) {
		                    $button
		                        .removeClass('btn-default')
		                        .addClass('btn-' + color + ' active');
		                }
		                else {
		                    $button
		                        .removeClass('btn-' + color + ' active')
		                        .addClass('btn-default');
		                }
		            }
		
		            // Initialization
		            function init() {
		
		                updateDisplay();
		
		                // Inject the icon if applicable
		                if ($button.find('.state-icon').length == 0) {
		                    $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
		                }
		            }
		            init();
		        });
		    });
	</script>
  </body>
</html>