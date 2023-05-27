<template>
    <div v-if="currentUser.id" class="min-h-full bg-gray-100 flex">
        <!-- sidebar -->
        <Sidebar :class="{'-ml-[200px]': !sidebarOpened}"/>
        <!-- Sidebar -->

      <div class="flex-1">
        <Navbar @toggle-sidebar="toggleSidebar"></Navbar>
        <!-- Content -->

        <main class="p-6">
                <router-view></router-view>
        </main>
         <!-- Content -->
      </div>
    </div>
    <div v-else class="min-h-full bg-gray-200 flex items-center justify-center">
        <Spinner/>
    </div>
  </template>


<script setup>
import {ref, onMounted, onUnmounted, computed} from "vue";
import Sidebar from "./Sidebar.vue";
import Navbar from "./Navbar.vue";
import store from "../store";
import Spinner from "./core/Spinner.vue"


    const {title} = defineProps ({
        title: String
    })

    const sidebarOpened = ref(true);
    const currentUser = computed(() => store.state.user.data);

    function toggleSidebar(){
        sidebarOpened.value = !sidebarOpened.value
    }

    function updatedSidebarState(){
        sidebarOpened.value = window.outerWidth > 768;
    }

    onMounted(() => {
        store.dispatch('getUser')
        updatedSidebarState();
        window.addEventListener('resize', updatedSidebarState)
    })

    onUnmounted(()=>{
        window.removeEventListener('resize', updatedSidebarState)
    })



</script>

<style scoped>

</style>
