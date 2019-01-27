<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="WebForm.UserControls.SideBar" %>
<!--sidebar right start-->
<aside id="sidebar-right">
    <h4 class="sidebar-title">我的联系人</h4>
    <div id="contact-list-wrapper">
        <div class="heading">
            <ul>
                <li class="new-contact">
                    <a href="javascript:void(0)"><i class="fa fa-plus"></i></a>
                </li>
                <li>
                    <input type="text" class="search" placeholder="查找">
                    <button type="submit" class="btn btn-sm btn-search">
                        <i class="fa fa-search"></i>
                    </button>
                </li>
            </ul>
        </div>
        <div id="contact-list">
            <ul>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar3.png" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">吴浩婧 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar1.png" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">帅哥治胜 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 月亮之上</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar2.png" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">大神明浩 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar4.jpg" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">年少如花 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar5.png" class="img-circle" alt="">
                                <i class="away animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">田飞大师 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar6.png" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">阎建华</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar7.png" class="img-circle" alt="">
                                <i class="on animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">晓斌校长 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar8.png" class="img-circle off" alt="">
                                <i class="off animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">永振 </div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="avatar">
                                <img src="/images/avatar9.png" class="img-circle off" alt="">
                                <i class="off animated bounceIn"></i>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">志文</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> 北京 腾达大厦</small>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div id="contact-user">
            <div class="chat-user active">
                <span><i class="icon-bubble"></i></span>
            </div>
            <div class="email-user">
                <span><i class="icon-envelope-open"></i></span>
            </div>
            <div class="call-user">
                <span><i class="icon-call-out"></i></span>
            </div>
        </div>
    </div>
</aside>
<!--/sidebar right end-->