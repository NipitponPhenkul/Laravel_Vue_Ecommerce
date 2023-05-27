<!--
  This example requires some changes to your config:

  ```
  // tailwind.config.js
  module.exports = {
    // ...
    plugins: [
      // ...
      require('@tailwindcss/forms'),
    ],
  }
  ```
-->



<template>
    <div class="w-[200px] transition-all bg-indigo-700 text-white py-4 px-2">
        <router-link :to="{name: 'app.dashboard'}"
        class="flex items-center py-2 rounded transition-colors hover:bg-black/20 font-light">
            <span class="mr-2 text-grey-300">
                <HomeIcon class="w-5"/>
            </span>
            <span class="text-sm ">
                Dashboard
            </span>
        </router-link>

        <router-link :to="{name: 'app.products'}"
        class="flex items-center py-2 rounded transition-colors hover:bg-black/20 font-light">
            <span class="mr-2 text-grey-300">
                <ViewColumnsIcon class="w-5"/>
            </span>
            <span class="text-sm ">
                Products
            </span>
        </router-link>

        <router-link :to="{name: 'app.dashboard'}"
        class="flex items-center py-2 rounded transition-colors hover:bg-black/20 font-light">
            <span class="mr-2 text-grey-300">
                <UsersIcon class="w-5"/>
            </span>
            <span class="text-sm ">
                Users
            </span>
        </router-link>

        <router-link :to="{name: 'app.dashboard'}"
        class="flex items-center py-2 rounded transition-colors hover:bg-black/20 font-light">
            <span class="mr-2 text-grey-300">
                <ChartBarIcon class="w-5"/>
            </span>
            <span class="text-sm ">
                Reports
            </span>
        </router-link>

      </div>
</template>

<script setup>

import {HomeIcon, UsersIcon, ChartBarIcon, ViewColumnsIcon} from '@heroicons/vue/24/solid'

</script>

<style scoped>

</style>
