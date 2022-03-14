<script>

export default {
  props: {
    videoId: '',
    start: '',
    end: ''
  },
  computed: {
    videoUrl() {
      return `https://www.youtube.com/embed/${this.videoId}?start=${this.start}`
    }
  },
  methods: {
    
  },
  mounted() {
    console.log('mounted')
    console.log(this.videoId, this.start, this.end)
    // var player;
    // window.onYouTubeIframeAPIReady = function () {
    //   player = new YT.Player('player', {
    //     height: '390',
    //     width: '640',
    //     events: {
    //       'onReady': onPlayerReady
    //     }
    //   });
    // }
    // function onPlayerReady(event) {
    //   player.playVideo()
    //   setInterval(() => {
    //     let time = event.target.getCurrentTime();
    //     if (time > stop) {
    //       player.seekTo(start);
    //     }
    //   }, 100);
    // }
  },
  unmounted() {
    console.log('unmounted')
  }
}
</script>

<template>
<!-- <iframe id="player" type="text/html" width="640" height="360" :src="videoUrl" frameborder="0"></iframe> -->
<!-- <div id="player"></div> -->
</template>

<style>
@import url('https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp');

/* #player {
  background: blue;
  width: 700px;
  height: 400px;
} */
</style>
