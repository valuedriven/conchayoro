<template>
  <v-app>
    <v-card
      width="400"
      class="mx-auto mt-5"
    >
      <v-card-title>
        <h1 class="display-1">
          Login
        </h1>
      </v-card-title>
      <v-card-text>
        <v-form>
          <v-text-field
            v-model="username"
            label="usuario"
            prepend-icon="mdi-account-circle"
          />
          <v-text-field
            v-model="password"
            :type="showPassword ? 'text' : 'password'"
            label="senha"
            prepend-icon="mdi-lock"
            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="showPassword = !showPassword"
          />
        </v-form>
      </v-card-text>
      <v-divider />
      <v-card-actions>
        <!--
      <v-btn color="sucess">Registrar</v-btn>      
      <v-spacer></v-spacer>
        -->
        <v-btn
          color="info"
          @click="login"
        >
          Login
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-app>
</template>

<script>
export default {
  name: "Login",
  data: () => ({
    showPassword: false,
    username: "",
    password: ""
  }),
  methods: {
    login() {
      if (
        this.username !== null &&
        this.username !== "" &&
        this.password !== null &&
        this.password !== ""
      ) {
        this.$store
          .dispatch("login", {
            username: this.username,
            password: this.password
          })
          .then(() => {
            this.$router.push("/");
          });
      }
    }
  }
};
</script>