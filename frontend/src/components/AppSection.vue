<template>
  <div>
    <router-view />
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  components: {},
  props: {},
  data() {
    return {};
  },
  computed: {
    ...mapGetters({})
  }  
};
</script>

<style scoped>
.fade-view-enter,
.fade-view-leave-to {
  opacity: 0;
}
.fade-view-enter-active,
.fade-view-leave-active {
  transition: opacity 0.5s ease-in-out;
}
</style>