const Home = Vue.component('home', {
    template: `
    <section class="home">
      <div class="container-fluid">
        <div class="row justify-content-center text-center">
            <div class="col col col-xl-6 col-lg-6 col-md-6 col-sm-10 col-11">
                <img src="../img/b5.jpg" alt="" class="d-block mx-auto" style="height:230px;width:280px;">
                <h1>Welcome to SASAI</h1>
                <p class="mb-4 mt-2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto alias molestiae vitae, magni dolore debitis a quae deleniti doloribus adipisci, optio quasi fuga, quam reiciendis enim veniam quos aut cupiditate?</p>
                <div class="d-flex justify-content-center mb-4">
                    <i class="fas fa-circle mr-2"></i>
                    <i class="far fa-circle mr-2"></i>
                    <i class="far fa-circle"></i>
                </div>
                <a href="#" class="home-btn submit font-weight-bold text-white px-4 py-2">GET STARTED</a>
            </div>
        </div>
    </div>
  </section>
   `,
    data: function () {
        return {}
    }
});

const Register = Vue.component('register-form', {
  template: `
  flash-message v-bind:messages="message" v-bind:theme="theme"></flash-message>
  <section>
    <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col col col-xl-4 col-lg-4 col-md-6 col-sm-7 col-11 chat-box">
            <!-- CARD -->
            <div class="card px-0 border-none">
                <!-- CARD HEADER -->
                <div class="header d-flex align-items-center px-2 py-1">
                    <i class="fas fa-chevron-left"></i>
                    <h1 class="card-title mx-auto">Sign in</h1>
                    <i class="fas fa-ellipsis-h header-icon"></i>
                </div>
                <!-- CARD BODY -->
                <div class="body border-top border-bottom px-2 py-0">
                    <img src="../img/b5.jpg" alt="" style="height:200px;width:250;" class="d-block mx-auto"> 
                    <form action="" class="px-3" @submit.prevent="registerUser" id="registerForm" name="registerForm">
                        <!-- EMAIL -->
                        <div class="fieldset">
                            <label for="email">Email</label>
                            <input type="email" class="form-control form-control-md text-gray" placeHolder="eg. jogndoe@gmail.com">
                        </div>
                        <!-- PASSWORD -->
                        <div class="fieldset my-3">
                            <label for="pwd">Password</label>
                            <input type="text" class="form-control form-control-md">
                        </div>
                        <input type="submit" value="Submit" class="mb-3 submit d-block mx-auto border-none px-5 py-2 text-white font-weight-bold">
                    </form>
                </div>
            </div>
            <!-- END OF CARD -->
        </div>
    </div>
</div>
  </section>
  `,
  methods: {
    registerUser: function () {
      const self = this
      const RegisterForm = document.getElementById('registerForm')
      const form_data = new FormData(RegisterForm)
      fetch('/api/users/register', {
        method: 'POST',
        body: form_data,
        headers: {
          'X-CSRFToken': token
        },
        credentials: 'same-origin'
      })
        .then(function (response) {
          return response.json()
        })
        .then(function (jsonResponse) {
          if (jsonResponse.errors) {
            self.message = jsonResponse.errors
            self.theme = 'alert-danger'
          } else {
            self.message = [jsonResponse[0].message]
          }
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  },
  data: function () {
    return {
      error: false,
      message: [],
      theme: ''
    }
  }
})

const Login = Vue.component('login', {
  template: `
    <section>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col col col-xl-4 col-lg-4 col-md-6 col-sm-7 col-11 chat-box">
            <!-- CARD -->
            <div class="card px-0 border-none">
                <!-- CARD HEADER -->
                <div class="header d-flex align-items-center px-2 py-1">
                    <i class="fas fa-chevron-left"></i>
                    <h1 class="card-title mx-auto">Login</h1>
                    <i class="fas fa-ellipsis-h header-icon"></i>
                </div>
                <!-- CARD BODY -->
                <div class="body border-top border-bottom px-2 py-0">
                    <img src="../img/b5.jpg" alt="" style="height:200px;width:250;" class="d-block mx-auto"> 
                    <form action="" class="px-3" @submit.prevent="loginUser" id="loginForm" class="" name="loginForm">
                        <!-- EMAIL -->
                        <div class="fieldset">
                            <label for="email">Email</label>
                            <input type="email" class="form-control form-control-md text-gray" placeHolder="eg. jogndoe@gmail.com">
                        </div>
                        <!-- PASSWORD -->
                        <div class="fieldset my-3">
                            <label for="pwd">Password</label>
                            <input type="text" class="form-control form-control-md">
                        </div>
                        <input type="submit" value="Submit" class="mb-3 submit d-block mx-auto border-none px-5 py-2 text-white font-weight-bold">
                    </form>
                </div>
            </div>
            <!-- END OF CARD -->
        </div>
    </div>
</div>
    </section>
    `,
  methods: {
    loginUser: function () {
      const self = this
      const loginForm = document.getElementById('loginForm')
      const form_data = new FormData(loginForm)
      // eslint-disable-next-line no-undef
      const payload = JSON.stringify(Object.fromEntries(form_data))
      // eslint-disable-next-line no-undef
      fetch('/api/auth/login', {
        method: 'POST',
        body: payload,
        headers: {
          'X-CSRFToken': token,
          'Content-Type': 'application/json'
        },
        credentials: 'same-origin'
      })
        .then(function (response) {
          return response.json()
        })
        .catch(function (error) {
          self.errors = error
          console.log(error)
        })
    }
  },
  data: function () {
    return {
      message: [],
      theme: ''
    }
  }
})

Vue.component('chat-bot', {
    template: `
    <section>
      <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col col-xl-4 col-lg-4 col-md-6 col-sm-7 col-10 chat-box">
            <div class="card px-0 border-none">
                <!-- CARD HEADER -->
                <div class="header d-flex align-items-center px-2">
                    <i class="fas fa-chevron-left"></i>
                    <img src="../img/b3.jpg" alt="">
                    <h1 class="card-title mx-auto">SAS A.I</h1>
                    <i class="fas fa-ellipsis-h header-icon"></i>
                </div>
                <!-- CARD BODY -->
                <div class="body border-top border-bottom px-2 py-4">
                    <!-- BOT -->
                    <div class="bot d-flex justify-content-start align-items-center mb-3">
                        <img src="../img/b3.jpg" alt="" style="height:50px;" class="mr-3">
                        <div class="bg-skyBlueCrayola px-2" id="talkbubble">
                            <p class="text-gray mb-1">Hey, how can I help you?</p>
                            <p class="time text-right text-white font-weight-bod mb-1">2:30 pm</p>
                        </div>
                    </div>
                    <!-- USER -->
                    <div class="user d-flex justify-content-end align-items-center mb-3">
                        <div class="bg-skyBlueCrayola px-2" id="talkbubble2">
                            <p class="text-white mb-1">Who is the hod of sci tech?</p>
                            <p class="time text-right text-white font-weight-bod mb-1">2:30 pm</p>
                        </div>
                        <img src="../img/b4.jpg" alt="" style="height:50px;" class="ml-3">
                    </div>
                    <!-- BOT -->
                    <div class="bot d-flex justify-content-start align-items-center mb-2">
                        <img src="../img/b3.jpg" alt="" style="height:50px;" class="mr-3">
                        <div class="bg-skyBlueCrayola px-2" id="talkbubble">
                            <p class="text-gray mb-1">Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi
                                omnis nostrum possimus voluptates ea! Vel.</p>
                            <p class="time text-right text-white font-weight-bod mb-1">2:30 pm</p>
                        </div>
                    </div>
                </div>
                <!-- CARD FOOTER -->
                <div class="footer p-0">
                    <form action="" class="d-flex align-items-center">
                        <input type="text" placeHolder="Type a Message..." class="px-2 text-gray">
                        <button class="">
                            <i class="fas fa-arrow-circle-right text-gray"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    </section>
    `
});
