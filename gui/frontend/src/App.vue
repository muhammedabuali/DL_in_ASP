<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title class="headline text-uppercase">
        <span>Description Logic</span>
        <span class="font-weight-light">MONITOR</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        text
        href="https://github.com/muhammedabuali/DL_in_ASP"
        target="_blank"
      >
        <span class="mr-2">Contribute</span>
      </v-btn>
    </v-app-bar>

    <v-content>
      <Main/>
    </v-content>
  </v-app>
</template>

<script>
import Main from './components/Main';

export default {
  name: 'App',
  components: {
    Main,
  },
  data: () => ({
    //
  }),
};
</script>
