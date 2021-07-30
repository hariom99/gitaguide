<!doctype html>

        <%
         String na =null;
         int d;
            
            HttpSession s  =  (HttpSession)request.getSession().getServletContext().getAttribute("session");
            if(s==null)
            {
             %>
             <jsp:include page="index.jsp" ></jsp:include>
        <%
         }
else{
            na = (String)s.getAttribute("name");
            d = (Integer)s.getAttribute("id");
            
            System.out.println("name via http "+na);
}
        %>



<%@include file="header.jsp" %>
        <!-- Login Modal  -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">LogIn to GitaGuide</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <div class="modal-body">
                        <form action="login.jsp" method="post" >
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-danger btn-block">Sign In</button>
                            </div>
                            <div class="forgot">
                                <a href="">Forget Password</a>
                            </div>

                        </form>
                        <br>
                        <div class="account">
                            <p> Don't have an account - <a href="" data-toggle="modal" data-target="#signupModal">
                                    Register</a></p>

                        </div>

                    </div>

                </div>
            </div>
        </div>




        <!-- signup -->






        <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="signupModalLabel">Register Here...</h5>

                    </div>
                    <div class="modal-body">
                        <form class="regform"  action="registerDao.jsp" method="post">
                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="inputName">Full Name</label>
                                    <input type="text" class="form-control" name="fullName" id="inputName" placeholder="Enter Full Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputNumber">Mobile No.</label>
                                    <input type="text" class="form-control" name="mobile" id="inputNumber" placeholder="Enter Contact Number">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="email"  name="email" class="form-control" id="inputEmail4" placeholder="Email">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password </label>
                                    <input type="password" class="form-control"  name="password" id="inputPassword4" placeholder="Password">
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Age</label>
                                    <input type="text"  name="age" class="form-control" id="inputEmail4" placeholder="age">
                                </div>


                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Profession </label>

                                    <select required name="profession" id="">
                                        <option value="">Select</option>
                                        <option value="student">Student</option>
                                        <option value="working professional">Working professional</option>
                                        <option value="householder">Householder</option>
                                    </select>


                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Address</label>
                                <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Enter Address">
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">City</label>
                                    <input type="text" name="city" class="form-control" id="inputCity">
                                </div>


                                <div class="form-group col-md-4">
                                    <label for="inputState">State</label>
                                    <select id="inputState" class="form-control" name="state" >
                                        <option selected>Choose...</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                        <option value="Aruranchal Pradesh">Aruranchal Pradesh</option>
                                        <option value="Maharashtra">Maharashtra</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="inputZip">Zip</label>
                                    <input type="text" name="zip" class="form-control" id="inputZip">
                                </div>

                            </div>

                            <button type="submit" class="btn btn-primary">Sign in</button>
                        </form>











                        <!-- 
                        <form>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Full Name </label>
                                <input required type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Mobile No.</label>
                                <input required type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"> City </label>
                                <input required type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
    
    
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input required type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input required type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Confirm password</label>
                                <input required type="password" class="form-control" id="exampleInputPassword1">
                            </div>
    
                            <button type="submit" class="btn btn-primary">Create an account</button>
                        </form> -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <h1 style="color:#212357; font-weight :700;margin-top:2rem;text-align:center;">Welcome,  <%=na%>    </h1>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100"
                         src="http://bbt.org/sites/default/files/styles/homepage_banner/public/slides/Banner-Prabhupada1.png?itok=K7Nu-rvB"
                         width="alt=" First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                         src="http://bbt.org/sites/default/files/styles/homepage_banner/public/slides/Screen%20Shot%202016-02-18%20at%205.13.38%20PM.png?itok=6PbGe-oc"
                         width="" alt="Second slide">
                </div>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <hr>

        <h3 class="books my-4" style="font-weight: 800; text-align:center;"> SPIRITUAL BOOKS <h3>

                <hr>

                <div class="container my-4">

                    <div class="row">
                        <div class="col-sm-3 col-xs-6 ">
                            <div class="card mb-4 box-shadow" style="width: 12rem;height:17em">
                                <img class="card-img-top img-fluid"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     alt="Thumbnail [100%x225]" style="height: 294px; width: 191px; display: block;"
                                     src="BG.jpg" data-holder-rendered="true">
                                <div class="card-body">
                                    <p  class="card-text">Bhagwad Gita</p>
                                    <form action="addtocart.jsp" method="post" onsubmit= "return  check()" >
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">


                                                <button   type="button"  class="btnlang btn-sm btn-outline-secondary">
                                                    <select  id="sel" name="bookDetails">
                                                        
                                                        <option  value="Bhagwad Gita_1-Hindi-160">Hindi (Rs 160)</option>
                                                        <option value="Bhagwad Gita_2-English-250">English (Rs 250)</option>
                                                        <option value="Bhagwad Gita_3-Marathi-160">Marathi (Rs 160)</option>
                                                        <option value="Bhagwad Gita_4-Gujrati-160">Gujrati (Rs 160)</option>
                                                        <option value="Bhagwad Gita_5-Bangla-200">Bangla (Rs 200)</option>
                                                    </select>
                                                </button>


                                            </div>
                                        </div>
                                        <div class="btn-group1">

                                            <button type="submit"    id="cbtn"  
                                                    class="btn btn-warning btn-block">Add To Cart</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-xs-6">
                            <div class="card mb-4 box-shadow" style="width: 12rem;height: 17em;">
                                <img class="card-img-top img-fluid"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     alt="Thumbnail [100%x225]" src="SB.jpg" data-holder-rendered="true"
                                     style="height: 294px; width:191px; display: block;">
                                <div class="card-body">
                                    <p class="card-text">Srimad Bhagwatam.</p>
                                    <form action="addtocart.jsp" onsubmit= "return check1();" method="post" >
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <button type="button" class="btnlang btn-sm btn-outline-secondary">
                                                    <select id="sel1"  name="bookDetails">
                                                        
                                                        <option value="Srimad Bhagwatam_1-Hindi-6000">Hindi (Rs 6000)</option>
                                                        <option value="Srimad Bhagwatam_2-English-7000">English (Rs 7000)</option>
                                                    </select>
                                                </button>


                                            </div>

                                        </div>
                                        <div class="btn-group1">

                                            <button type="submit"  id="cbtn" 
                                                    class="btn btn-warning btn-block">Add To Cart</button>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-xs-6">
                            <div class="card mb-4 box-shadow" style="width:12rem;height:17em">
                                <img class="card-img-top img-fluid"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     alt="Thumbnail [100%x225]" src="CC.jpg" data-holder-rendered="true"
                                     style="height: 294px; width: 191px; display: block;">
                                <div class="card-body">
                                    </p>
                                    <p class="card-text" id="ccpara">Chaitanya Caritra</p>
                                    <form action="addtocart.jsp" method="post"  onsubmit= "return  check2()">
                                        <div class="d-flex justify-content-between align-items-center" id="cc">
                                            <div class="btn-group">

                                                <button type="button" class="btnlang btn-sm btn-outline-secondary">
                                                    <select id="sel2"  name="bookDetails">
                                                        
                                                        <option value="Chaitanya Caritra_1-Hindi-3000">Hindi (Rs 3000)</option>
                                                        <option value="Chaitanya Caritra_2-English-3500">English (Rs 3500)</option>
                                                    </select>
                                                </button>






                                            </div>
                                        </div>
                                        <div class="btn-group1">

                                            <button type="submit"  id="cbtn" 
                                                    class="btn btn-warning btn-block">Add To Cart</button>
                                        </div>
                                    </form>  
                                </div>

                            </div>

                        </div>

                        <div class="col-sm-3 col-xs-6">
                            <div class="card mb-4 box-shadow" style="width: 12rem;height: 17em;">
                                <img class="card-img-top img-fluid"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     alt="Thumbnail [100%x225]" src="K.jpg" data-holder-rendered="true"
                                     style="height: 294px; width: 191px; display: block;">
                                <div class="card-body">
                                    <p class="card-text">Krishna Book</p>
                                    <form action="addtocart.jsp" method="post" onsubmit= "return check3()" type="submit"  >
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <button type="button" class="btnlang btn-sm btn-outline-secondary">
                                                    <select id="sel3"  name="bookDetails">
                                                        
                                                        <option value="Krishna Book_1-Hindi-250">Hindi (Rs 250)</option>
                                                        <option value="Krishna Book_2-English-200">English (Rs 200)</option>
                                                    </select>
                                                </button>

                                            </div>

                                        </div>
                                        <div class="btn-group1">

                                            <button   id="cbtn" 
                                                    class="btn btn-warning btn-block">Add To Cart</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>



                


                <hr>
                <h3 class="books my-4 "style="font-weight: 800; text-align:center;" > COURSES OFFERED BY  GITA GUIDE <h3>
                        <hr>
                        <div class="container my-4">

                            <div class="row">
                                <div class="col-sm-3  d-flex justify-content-center">
                                    <div class="card mb-4 box-shadow" style="width: 13rem;">
                                        <div class="flip-box">
                                            <div class="flip-box-inner">
                                                <div class="flip-box-front">
                                                    <img class="card-img-top"
                                                         data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                                         alt="Thumbnail [100%x225]"
                                                         style="height: 294px; width: 207px; display: block;" src="BG.jpg"
                                                         data-holder-rendered="true">
                                                </div>
                                                <div class="flip-box-back">
                                                    <p class="flipcoursehead">Discover Inner Self
                                                    <p>
                                                        <button type="button" class="btn btn-warning">Course
                                                            details</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <p class="card-text">Discover Innner Self</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group1">

                                                    <button type="button" 
                                                            class="btn btn-primary ">Join
                                                        Here</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3  d-flex justify-content-center">
                                    <div class="card mb-4 box-shadow" style="width: 13rem;">
                                        <div class="flip-box">
                                            <div class="flip-box-inner">
                                                <div class="flip-box-front">
                                                    <img class="card-img-top"
                                                         data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                                         alt="Thumbnail [100%x225]"
                                                         style="height: 294px; width: 207px; display: block;" src="SB.jpg"
                                                         data-holder-rendered="true">
                                                </div>
                                                <div class="flip-box-back">
                                                    <p class="flipcoursehead">Iskcon Disciple Course</p>
                                                    <button type="button" class="btn btn-warning">Course Details</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <p class="card-text">Iskcon Disciple Course</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group1">

                                                    <button type="button"
                                                            class="btn btn-primary" data-toggle="modal"
                                                            data-target="loginModal">Join
                                                        here</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3  d-flex justify-content-center">
                                    <div class="card mb-4 box-shadow" style="width:13rem;height:25rem">
                                        <div class="flip-box">
                                            <div class="flip-box-inner">
                                                <div class="flip-box-front">
                                                    <img class="card-img-top"
                                                         data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                                         alt="Thumbnail [100%x225]"
                                                         style="height: 294px; width: 207px; display: block;" src="CC.jpg"
                                                         data-holder-rendered="true">
                                                </div>
                                                <div class="flip-box-back">
                                                    <p class="flipcoursehead">Gita Study Course</p>
                                                    <button type="button" class="btn btn-warning">Course Details</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            </p>
                                            <p class="card-text" id="ccpara">Gita Study Course</p>
                                            <div class="d-flex justify-content-between align-items-center" id="cc">
                                                <div class="btn-group1">

                                                    <button type="button" 
                                                            id="ccbtn" class="btn btn-primary">Join
                                                        Here</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-3  d-flex justify-content-center">
                                    <div class="card mb-4 box-shadow" style="width: 13rem;">
                                        <div class="flip-box">
                                            <div class="flip-box-inner">
                                                <div class="flip-box-front">
                                                    <img class="card-img-top"
                                                         data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                                         alt="Thumbnail [100%x225]"
                                                         style="height: 294px; width: 207px; display: block;" src="K.jpg"
                                                         data-holder-rendered="true">
                                                </div>
                                                <div class="flip-box-back">
                                                    <p class="flipcoursehead">Discover Your Self</p>
                                                    <button type="button" class="btn btn-warning">Course Details</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text">Discover your self</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group1">

                                                    <button type="button" 
                                                            class="btn btn-primary">Join
                                                        Here</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>  
                        </div>





                        <!-- Footer -->
                        <!-- Optional JavaScript; choose one of the two! -->

                        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->





                        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                                crossorigin="anonymous">

                        </script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
                        crossorigin="anonymous"></script>

                        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
                        -->




                        </body>

                        </html>