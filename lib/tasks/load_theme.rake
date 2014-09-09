desc "Load default theme into database"
task load_theme: :environment do
  
  #--- make sure we're targeting the correct site/account
  Account.current_by_prefix('local')
  I18n.locale = :en
  
  #--- Create CMS Content
  index     = CmsPage.create(slug: 'index', pagetype: 'content', template: 'index', title: 'My Website', menutitle: 'Home', published: true)
  body      = index.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: index_body)
  slideshow = index.cms_contentitems.create(itemtype: 'HTML', container: 'slideshow', content: index_slideshow)
  
  begin
    about     = index.children.create(slug: 'about', pagetype: 'content', template: 'content_full_width', title: 'About', menutitle: 'About', published: true)
    body      = about.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: about_body)

    services  = index.children.create(slug: 'services', pagetype: 'content', template: 'content_full_width', title: 'Services', menutitle: 'Services', published: true)
    body      = services.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: services_body)

    contact   = index.children.create(slug: 'contact', pagetype: 'content', template: 'content_full_width', title: 'Contact', menutitle: 'Contact', published: true)
    body      = contact.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: contact_body)

    portfolio = index.children.create(slug: 'portfolio', pagetype: 'pagelink', link: 'portfolio-1-col', template: 'content_full_width', title: 'Portfolio', menutitle: 'Portfolio', published: true)
    begin
      portfolio_1 = portfolio.children.create(slug: 'portfolio-1-col', pagetype: 'content', title: 'One Column Portfolio', menutitle: '1 Column Portfolio', published: true)
      body        = portfolio_1.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: portfolio_1_body)

      portfolio_2 = portfolio.children.create(slug: 'portfolio-2-col', pagetype: 'content', title: 'Two Column Portfolio', menutitle: '3 Column Portfolio', published: true)
      body        = portfolio_2.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: portfolio_2_body)

      portfolio_3 = portfolio.children.create(slug: 'portfolio-3-col', pagetype: 'content', title: 'Three Column Portfolio', menutitle: '3 Column Portfolio', published: true)
      body        = portfolio_3.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: portfolio_3_body)

      portfolio_4 = portfolio.children.create(slug: 'portfolio-4-col', pagetype: 'content', title: 'Four Column Portfolio', menutitle: '4 Column Portfolio', published: true)
      body        = portfolio_4.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: portfolio_4_body)

      portfolio_item = portfolio.children.create(slug: 'portfolio-item', pagetype: 'content', title: 'Portfolio Item', menutitle: 'Single Portfolio Item', published: true)
      body           = portfolio_item.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: portfolio_item_body)
    end
    
    blogs = index.children.create(slug: 'blog', pagetype: 'pagelink', link: 'blog', title: 'Blog', menutitle: 'Blog', published: true)
    
    other_pages = index.children.create(slug: 'other-pages', pagetype: 'pagelink', link: 'full-width', template: 'content_full_width', title: 'Other Pages', menutitle: 'Other Pages', published: true)
    begin
      full_width    = other_pages.children.create(slug: 'full-width', pagetype: 'content', title: 'Full Width Page', menutitle: 'Full Width Page', published: true)
      body          = full_width.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: full_width_body)

      sidebar_page  = other_pages.children.create(slug: 'sidebar', pagetype: 'content', template: 'content_with_left_nav', title: 'Sidebar Page', menutitle: 'Sidebar Page', published: true)
      body          = sidebar_page.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: sidebar_body)
      sidebar       = sidebar_page.cms_contentitems.create(itemtype: 'Markdown', container: 'sidebar', content: sidebar_sidebar)

      faq           = other_pages.children.create(slug: 'faq', pagetype: 'content', title: 'FAQ', menutitle: 'FAQ', published: true)
      body          = faq.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: faq_width_body)

      missing       = other_pages.children.create(slug: 'missing', pagetype: 'content', title: '404 - Page Not Found', menutitle: '404 Page', published: true)
      body          = missing.cms_contentitems.create(itemtype: 'Markdown', container: 'body', content: missing_body)

      pricing       = other_pages.children.create(slug: 'pricing', pagetype: 'content', title: 'Pricing Table', menutitle: 'Pricing Table', published: true)
      body          = pricing.cms_contentitems.create(itemtype: 'HTML', container: 'body', content: pricing_body)
    end
  end
  
  #--- Create Blog Content
  blog    = CmsBlog.create(slug: 'company-blog', title: 'Company Blog', published: true, is_public: true, comments_allowed: true, preferred_show_social_buttons: true)
  post_1  = blog.posts.create(slug: 'welcome-to-our-new-site', title: 'Welcome to Our New Site', image: 'http://placehold.it/900x300', published_on: '2014-09-01 00:00:00', comments_allowed: true, summary: post_1_summary, content: post_1_content)
  post_2  = blog.posts.create(slug: 'new-update', title: 'New Update', image: 'http://placehold.it/900x300', published_on: '2014-09-02 00:00:00', comments_allowed: true, summary: post_2_summary, content: post_2_content)
end


#------------------------------------------------------------------------------
# Content methods
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
def index_body
<<-HTML
<!-- Marketing Icons Section -->
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">
      Welcome to Modern Business
    </h1>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
      </div>
      <div class="panel-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
        <a href="#" class="btn btn-default">Learn More</a>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4><i class="fa fa-fw fa-gift"></i> Free &amp; Open Source</h4>
      </div>
      <div class="panel-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
        <a href="#" class="btn btn-default">Learn More</a>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4><i class="fa fa-fw fa-compass"></i> Easy to Use</h4>
      </div>
      <div class="panel-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
        <a href="#" class="btn btn-default">Learn More</a>
      </div>
    </div>
  </div>
</div>
<!-- /.row -->

<!-- Portfolio Section -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Portfolio Heading</h2>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
  <div class="col-md-4 col-sm-6">
    <a href="portfolio-item.html">
      {% image src: "http://placehold.it/700x450", class: "img-responsive img-portfolio img-hover" %}
    </a>
  </div>
</div>
<!-- /.row -->

<!-- Features Section -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Modern Business Features</h2>
  </div>
  <div class="col-md-6">
{% markdown %}
The Modern Business template by Start Bootstrap includes:

* **Bootstrap v3.2.0**
* jQuery v1.11.0
* Font Awesome v4.1.0
* Working PHP contact form with validation
* Unstyled page elements for easy customization
* 17 HTML pages

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.
{% endmarkdown %}
  </div>
  <div class="col-md-6">
    {% image src: "http://placehold.it/700x450", class: "img-responsive" %}
  </div>
</div>
<!-- /.row -->

<hr>

<!-- Call to Action Section -->
<div class="well">
  <div class="row">
    <div class="col-md-8">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
    </div>
    <div class="col-md-4">
      <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
    </div>
  </div>
</div>
HTML
end

#------------------------------------------------------------------------------
def index_slideshow
<<-HTML
<!-- Header Carousel -->
<header id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
      <div class="carousel-caption">
        <h2>Caption 1</h2>
      </div>
    </div>
    <div class="item">
      <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
      <div class="carousel-caption">
        <h2>Caption 2</h2>
      </div>
    </div>
    <div class="item">
      <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
      <div class="carousel-caption">
        <h2>Caption 3</h2>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a>
</header>
HTML
end

#------------------------------------------------------------------------------
def about_body
<<-HTML
<!-- Intro Content -->
<div class="row">
  <div class="col-md-6">
    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
  </div>
  <div class="col-md-6">
{% markdown %}
## About Modern Business

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus reprehenderit dolorum!

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti eum ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti necessitatibus perspiciatis quis?
{% endmarkdown %}
  </div>
</div>
<!-- /.row -->

<!-- Team Members -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Our Team</h2>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
  <div class="col-md-4 text-center">
    <div class="thumbnail">
      <img class="img-responsive" src="http://placehold.it/750x450" alt="">
      <div class="caption">
{% markdown %}
### John Smith<br><small>Job Title</small>

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.

{: class='list-inline' }
* [<i class="fa fa-2x fa-facebook-square"></i>](#)
* [<i class="fa fa-2x fa-linkedin-square"></i>](#)
* [<i class="fa fa-2x fa-twitter-square"></i>](#)
{% endmarkdown %}
      </div>
    </div>
  </div>
</div>

<!-- Our Customers -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Our Customers</h2>
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
  <div class="col-md-2 col-sm-4 col-xs-6">
    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
  </div>
</div>
HTML
end

#------------------------------------------------------------------------------
def services_body
<<-HTML
<!-- Image Header -->
<div class="row">
  <div class="col-lg-12">
    <img class="img-responsive" src="http://placehold.it/1200x300" alt="">
  </div>
</div>
<!-- /.row -->

<!-- Service Panels -->
<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Services Panels</h2>
  </div>
  <div class="col-md-3 col-sm-6">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <span class="fa-stack fa-5x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
        </span>
      </div>
      <div class="panel-body">
        <h4>Service One</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        <a href="#" class="btn btn-primary">Learn More</a>
      </div>
    </div>
  </div>
  <div class="col-md-3 col-sm-6">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <span class="fa-stack fa-5x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-car fa-stack-1x fa-inverse"></i>
        </span>
      </div>
      <div class="panel-body">
        <h4>Service Two</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        <a href="#" class="btn btn-primary">Learn More</a>
      </div>
    </div>
  </div>
  <div class="col-md-3 col-sm-6">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <span class="fa-stack fa-5x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-support fa-stack-1x fa-inverse"></i>
        </span>
      </div>
      <div class="panel-body">
        <h4>Service Three</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        <a href="#" class="btn btn-primary">Learn More</a>
      </div>
    </div>
  </div>
  <div class="col-md-3 col-sm-6">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <span class="fa-stack fa-5x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-database fa-stack-1x fa-inverse"></i>
        </span>
      </div>
      <div class="panel-body">
        <h4>Service Four</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        <a href="#" class="btn btn-primary">Learn More</a>
      </div>
    </div>
  </div>
</div>

<!-- Service Tabs -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Service Tabs</h2>
  </div>
  <div class="col-lg-12">

    <ul id="myTab" class="nav nav-tabs nav-justified">
      <li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-tree"></i> Service One</a>
      </li>
      <li class=""><a href="#service-two" data-toggle="tab"><i class="fa fa-car"></i> Service Two</a>
      </li>
      <li class=""><a href="#service-three" data-toggle="tab"><i class="fa fa-support"></i> Service Three</a>
      </li>
      <li class=""><a href="#service-four" data-toggle="tab"><i class="fa fa-database"></i> Service Four</a>
      </li>
    </ul>

    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade active in" id="service-one">
{% markdown %}
#### Service One

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.
{% endmarkdown %}
      </div>
      <div class="tab-pane fade" id="service-two">
{% markdown %}
#### Service Two

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.
{% endmarkdown %}
      </div>
      <div class="tab-pane fade" id="service-three">
{% markdown %}
#### Service Three

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.
{% endmarkdown %}
      </div>
      <div class="tab-pane fade" id="service-four">
{% markdown %}
#### Service Four

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.
{% endmarkdown %}
      </div>
    </div>

  </div>
</div>

<!-- Service List -->
<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
<div class="row">
  <div class="col-lg-12">
    <h2 class="page-header">Service List</h2>
  </div>
  <div class="col-md-4">
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service One</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-car fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Two</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-support fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Three</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-database fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Four</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-bomb fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Five</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-bank fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Six</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-paper-plane fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Seven</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-space-shuttle fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Eight</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
    <div class="media">
      <div class="pull-left">
        <span class="fa-stack fa-2x">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-recycle fa-stack-1x fa-inverse"></i>
        </span> 
      </div>
      <div class="media-body">
        <h4 class="media-heading">Service Nine</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
      </div>
    </div>
  </div>
</div>
HTML
end

#------------------------------------------------------------------------------
def contact_body
<<-HTML
<div class="row">
  <!-- Map Column -->
  <div class="col-md-8">
    <!-- Embedded Google Map -->
    <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>
  </div>
  <!-- Contact Details Column -->
  <div class="col-md-4">
    <h3>Contact Details</h3>
    <p>
      3481 Melrose Place<br>Beverly Hills, CA 90210<br>
    </p>
    <p><i class="fa fa-phone"></i> 
      <abbr title="Phone">P</abbr>: (123) 456-7890</p>
    <p><i class="fa fa-envelope-o"></i> 
      <abbr title="Email">E</abbr>: <a href="mailto:name@example.com">name@example.com</a>
    </p>
    <p><i class="fa fa-clock-o"></i> 
      <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM</p>
    <ul class="list-unstyled list-inline list-social-icons">
      <li>
        <a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
      </li>
      <li>
        <a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a>
      </li>
      <li>
        <a href="#"><i class="fa fa-twitter-square fa-2x"></i></a>
      </li>
      <li>
        <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a>
      </li>
    </ul>
  </div>
</div>
<!-- /.row -->

<!-- Contact Form -->
<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
<div class="row">
  <div class="col-md-8">
    <h3>Send us a Message</h3>
    <form name="sentMessage" id="contactForm" novalidate>
      <div class="control-group form-group">
        <div class="controls">
          <label>Full Name:</label>
          <input type="text" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
          <p class="help-block"></p>
        </div>
      </div>
      <div class="control-group form-group">
        <div class="controls">
          <label>Phone Number:</label>
          <input type="tel" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
        </div>
      </div>
      <div class="control-group form-group">
        <div class="controls">
          <label>Email Address:</label>
          <input type="email" class="form-control" id="email" required data-validation-required-message="Please enter your email address.">
        </div>
      </div>
      <div class="control-group form-group">
        <div class="controls">
          <label>Message:</label>
          <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
        </div>
      </div>
      <div id="success"></div>
      <!-- For success/fail messages -->
      <button type="submit" class="btn btn-primary">Send Message</button>
    </form>
  </div>

</div>
HTML
end

#------------------------------------------------------------------------------
def portfolio_1_body
<<-HTML
<!-- Project One -->
<div class="row">
<div class="col-md-7">
[<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">](portfolio-item)
</div>
<div class="col-md-5">
### Project One

#### Subheading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.

[View Project](portfolio-item){: class="btn btn-primary" }
</div>
</div>
<!-- /.row -->

---

<!-- Project Two -->
<div class="row">
<div class="col-md-7">
[<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">](portfolio-item)
</div>
<div class="col-md-5">
### Project Two

#### Subheading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.

[View Project](portfolio-item){: class="btn btn-primary" }
</div>
</div>
<!-- /.row -->

---

<!-- Project Three -->
<div class="row">
<div class="col-md-7">
[<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">](portfolio-item)
</div>
<div class="col-md-5">
### Project Three

#### Subheading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.

[View Project](portfolio-item){: class="btn btn-primary" }
</div>
</div>
<!-- /.row -->

---

<!-- Project Four -->
<div class="row">
<div class="col-md-7">
[<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">](portfolio-item)
</div>
<div class="col-md-5">
### Project Four

#### Subheading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.

[View Project](portfolio-item){: class="btn btn-primary" }
</div>
</div>
<!-- /.row -->

---

<!-- Project Five -->
<div class="row">
<div class="col-md-7">
[<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">](portfolio-item)
</div>
<div class="col-md-5">
### Project Five

#### Subheading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.

[View Project](portfolio-item){: class="btn btn-primary" }
</div>
</div>
<!-- /.row -->

---

<!-- Pagination -->
<div class="row text-center">
<div class="col-lg-12">

{: class="pagination" }
* [&laquo;](#)
* {: class="active" }[1](#)
* [2](#)
* [3](#)
* [4](#)
* [5](#)
* [&raquo;](#)

</div>
</div>
HTML
end

#------------------------------------------------------------------------------
def portfolio_2_body
<<-HTML
<!-- Projects Row -->
<div class="row">
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project One](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Two](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Three](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Four](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Five](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-6 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Six](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<hr>

<!-- Pagination -->
<div class="row text-center">
<div class="col-lg-12">

{: class="pagination" }
* [&laquo;](#)
* {: class="active" }[1](#)
* [2](#)
* [3](#)
* [4](#)
* [5](#)
* [&raquo;](#)

</div>
</div>
HTML
end

#------------------------------------------------------------------------------
def portfolio_3_body
<<-HTML
<!-- Projects Row -->
<div class="row">
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project One](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Two](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Three](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Four](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Five](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Six](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Seven](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Eight](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-4 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Nine](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

---

<!-- Pagination -->
<div class="row text-center">
<div class="col-lg-12">

{: class="pagination" }
* [&laquo;](#)
* {: class="active" }[1](#)
* [2](#)
* [3](#)
* [4](#)
* [5](#)
* [&raquo;](#)

</div>
</div>
HTML
end

#------------------------------------------------------------------------------
def portfolio_4_body
<<-HTML
<!-- Projects Row -->
<div class="row">
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project One](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Two](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Three](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Four](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Five](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Six](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Seven](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Eight](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row">
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Nine](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Ten](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Eleven](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
<div class="col-md-3 img-portfolio">

[{% image src: "http://placehold.it/700x400", class: "img-responsive img-hover" %}](portfolio-item)

### [Project Twelve](portfolio-item)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.

</div>
</div>
<!-- /.row -->

---

<!-- Pagination -->
<div class="row text-center">
<div class="col-lg-12">

{: class="pagination" }
* [&laquo;](#)
* {: class="active" }[1](#)
* [2](#)
* [3](#)
* [4](#)
* [5](#)
* [&raquo;](#)

</div>
</div>
HTML
end

#------------------------------------------------------------------------------
def portfolio_item_body
<<-HTML
<!-- Portfolio Item Row -->
<div class="row">

  <div class="col-md-8">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          {% image src: "http://placehold.it/750x500", class: "img-responsive" %}
        </div>
        <div class="item">
          {% image src: "http://placehold.it/750x500", class: "img-responsive" %}
        </div>
        <div class="item">
          {% image src: "http://placehold.it/750x500", class: "img-responsive" %}
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="icon-prev"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="icon-next"></span>
      </a>
    </div>
  </div>

  <div class="col-md-4">
{% markdown %}
### Project Description

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.

### Project Details

* Lorem Ipsum
* Dolor Sit Amet
* Consectetur
* Adipiscing Elit
{% endmarkdown %}
  </div>

</div>
<!-- /.row -->

<!-- Related Projects Row -->
<div class="row">

  <div class="col-lg-12">
    <h3 class="page-header">Related Projects</h3>
  </div>

  <div class="col-sm-3 col-xs-6">
    <a href="#">{% image src: "http://placehold.it/500x300", class: "img-responsive img-hover img-related" %}</a>
  </div>

  <div class="col-sm-3 col-xs-6">
    <a href="#">{% image src: "http://placehold.it/500x300", class: "img-responsive img-hover img-related" %}</a>
  </div>

  <div class="col-sm-3 col-xs-6">
    <a href="#">{% image src: "http://placehold.it/500x300", class: "img-responsive img-hover img-related" %}</a>
  </div>

  <div class="col-sm-3 col-xs-6">
    <a href="#">{% image src: "http://placehold.it/500x300", class: "img-responsive img-hover img-related" %}</a>
  </div>

</div>
HTML
end

#------------------------------------------------------------------------------
def full_width_body
<<-HTML
Most of Start Bootstrap's unstyled templates can be directly integrated into the Modern Business template. You can view all of our unstyled templates on our website at [http://startbootstrap.com/template-categories/unstyled](http://startbootstrap.com/template-categories/unstyled).
HTML
end

#------------------------------------------------------------------------------
def sidebar_body
<<-HTML
## Section Heading

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.
HTML
end

#------------------------------------------------------------------------------
def sidebar_sidebar
<<-HTML
{% div class: 'panel panel-default' %}
{% div class: 'panel-heading' %}
{: class="panel-title" }
### Sidebar widget
{% enddiv %}

{% div class: 'panel-body' %}
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis
{% enddiv %}
{% enddiv %}
HTML
end

#------------------------------------------------------------------------------
def faq_width_body
<<-HTML
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Lorem ipsum dolor sit amet, consectetur adipiscing elit?</a>
        </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Curabitur eget leo at velit imperdiet varius. In eu ipsum vitae velit congue iaculis vitae at risus?</a>
        </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Aenean consequat lorem ut felis ullamcorper?</a>
        </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Lorem ipsum dolor sit amet, consectetur adipiscing elit?</a>
        </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Curabitur eget leo at velit imperdiet varius. In eu ipsum vitae velit congue iaculis vitae at risus?</a>
        </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Aenean consequat lorem ut felis ullamcorper?</a>
        </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">Lorem ipsum dolor sit amet, consectetur adipiscing elit?</a>
        </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">Curabitur eget leo at velit imperdiet varius. In eu ipsum vitae velit congue iaculis vitae at risus?</a>
        </h4>
    </div>
    <div id="collapseEight" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
  <div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">Aenean consequat lorem ut felis ullamcorper?</a>
        </h4>
    </div>
    <div id="collapseNine" class="panel-collapse collapse">
        <div class="panel-body">
            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        </div>
    </div>
  </div>
  <!-- /.panel -->
</div>
HTML
end

#------------------------------------------------------------------------------
def missing_body
<<-HTML
<div class="jumbotron">

# <span class="error-404">404</span>

The page you're looking for could not be found. Here are some helpful links to get you back on track:

* [Home](index)
* [About](about)
* [Services](services)
* [Contact](contact)
* Portfolio
  * [1 Column Portfolio](portfolio-1-col)
  * [2 Column Portfolio](portfolio-2-col)
  * [3 Column Portfolio](portfolio-3-col)
  * [4 Column Portfolio](portfolio-4-col)
* Other Pages
  * [Full Width Page](full-width-page)
  * [Sidebar Page](sidebar)
  * [FAQ](faq)
  * [404 Page](missing)
  * [Pricing Table](pricing-table)

</div>
HTML
end

#------------------------------------------------------------------------------
def pricing_body
<<-HTML
<div class="row">
  <div class="col-md-4">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <h3 class="panel-title">Basic</h3>
      </div>
      <div class="panel-body">
        <span class="price"><sup>$</sup>19<sup>99</sup></span>
        <span class="period">per month</span>
      </div>
      <ul class="list-group">
        <li class="list-group-item"><strong>1</strong> User</li>
        <li class="list-group-item"><strong>5</strong> Projects</li>
        <li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
        <li class="list-group-item"><strong>10GB</strong> Disk Space</li>
        <li class="list-group-item"><strong>100GB</strong> Monthly Bandwidth</li>
        <li class="list-group-item"><a href="#" class="btn btn-primary">Sign Up!</a></li>
      </ul>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-primary text-center">
      <div class="panel-heading">
        <h3 class="panel-title">Plus <span class="label label-success">Best Value</span></h3>
      </div>
      <div class="panel-body">
        <span class="price"><sup>$</sup>39<sup>99</sup></span>
        <span class="period">per month</span>
      </div>
      <ul class="list-group">
        <li class="list-group-item"><strong>10</strong> User</li>
        <li class="list-group-item"><strong>500</strong> Projects</li>
        <li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
        <li class="list-group-item"><strong>1000GB</strong> Disk Space</li>
        <li class="list-group-item"><strong>10000GB</strong> Monthly Bandwidth</li>
        <li class="list-group-item"><a href="#" class="btn btn-primary">Sign Up!</a></li>
      </ul>
    </div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default text-center">
      <div class="panel-heading">
        <h3 class="panel-title">Ultra</h3>
      </div>
      <div class="panel-body">
        <span class="price"><sup>$</sup>159<sup>99</sup></span>
        <span class="period">per month</span>
      </div>
      <ul class="list-group">
        <li class="list-group-item"><strong>Unlimted</strong> Users</li>
        <li class="list-group-item"><strong>Unlimited</strong> Projects</li>
        <li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
        <li class="list-group-item"><strong>10000GB</strong> Disk Space</li>
        <li class="list-group-item"><strong>Unlimited</strong> Monthly Bandwidth</li>
        <li class="list-group-item"><a href="#" class="btn btn-primary">Sign Up!</a></li>
      </ul>
    </div>
  </div>
</div>
HTML
end

#------------------------------------------------------------------------------
def post_1_summary
<<-HTML
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
HTML
end

#------------------------------------------------------------------------------
def post_1_content
<<-HTML
**Lorem** ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

_Lorem_ ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
HTML
end

#------------------------------------------------------------------------------
def post_2_summary
<<-HTML
_Lorem ipsum dolor sit amet, consectetur adipisicing elit_, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
HTML
end

#------------------------------------------------------------------------------
def post_2_content
<<-HTML
**Lorem** ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

_Lorem_ ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
HTML
end