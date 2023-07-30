<template>
    <div>
      <div v-for="category in categories" :key="category.id">
        <router-link :to="`/${category.slug}`" class="navbar-item">{{ category.name }}</router-link>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        categories: []
      };
    },
    mounted() {
      this.getCategories();
    },
    methods: {
      getCategories() {
        axios.get('/api/v1/categorys/')
          .then(response => {
            this.categories = response.data;
            console.log(this.categories)
          })
          .catch(error => {
            console.error(error);
          });
      }
    }
  };
  </script>