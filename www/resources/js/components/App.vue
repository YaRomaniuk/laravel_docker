<script setup>
import { ref } from 'vue'

const title = ref('Laravel')
</script>

<template>
  <h1 @mouseenter="title = 'Vue2'" @mouseleave="title = 'Laravel'" v-text="title"/>
</template>