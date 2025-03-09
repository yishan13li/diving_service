<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <header class="header-area header-sticky" style="background-color:rgb(245,245,245)">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="${root}/page/index" class="logo">
                                <img src="${root}/assets/images/logo.png" alt="DiVenture">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <c:if test="${loggedInMember!=null}">
                                <li><a href="${root}/page/index" class="active">Home</a></li>
                                <li><a href="${root}/LogsPage">Page Logs</a></li>
                                <li><a href="${root}/page/vlogs">My Dive Logs</a></li>
                                <li><a href="${root}/page/profile">Profile</a></li>
                                </c:if>
                            </ul>
                            
                            <c:if test="${loggedInMember==null}">
	                            <div class="border-button">
	                                <a id="modal_trigger" href="#modal" class="sign-in-up"><i class="fa fa-user"></i> Sign
	                                    In/Up</a>
	                            </div>
                            </c:if>
                            
<c:if test="${loggedInMember!=null}">
    <a href="${root}/page/profile" class="nav-profile-img" style="display: flex; align-items: center; justify-content: flex-end;">
        <c:if test="${loggedInMember.base64Photo==null}">
        	<img src="${root}/assets/images/noImg.png" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%; margin-right: 10px;">
        </c:if>
        <c:if test="${loggedInMember.base64Photo!=null}">
        	<img src="${loggedInMember.base64Photo}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%; margin-right: 10px;">
    	</c:if>
    </a>
    <div class="border-button">
        <a id="modal_trigger" href="${root}/Logout" class="sign-in-up"><i class="fa fa-user"></i> Sign Out</a>
    </div>
</c:if>

                            
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->