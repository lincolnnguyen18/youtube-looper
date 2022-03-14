<script>
import Loading from './components/Loading.vue'
import Player from './components/Player.vue'
export default {
  data() {
    return {
      videoId: '',
      start: '',
      end: '',
      mode: 'input'
    }
  },
  computed: {
    playingMode() {
      return this.mode === 'playing'
    },
    inputMode() {
      return this.mode === 'input'
    },
    startSeconds() {
      return this.start.split(':').map(x => parseInt(x)).reduce((a, b) => a * 60 + b)
    },
    endSeconds() {
      return this.end.split(':').map(x => parseInt(x)).reduce((a, b) => a * 60 + b)
    },
  },
  methods: {
    submit() {
      if (this.nonemptyInputs()) {
        // console.log(this.nonemptyInputs())
        // console.log(this.videoId, startSeconds, endSeconds)
        // this.start = ''
        // this.end = ''
        // this.videoId = ''
        window.location.href = `/video?videoId=${this.videoId}&start=${this.startSeconds}&end=${this.endSeconds}`
        // this.videoId = 'lBpfjOaL8iw'
        // this.start = '51:02'
        // this.end = '53:24'
        // this.mode = 'playing'
      }
    },
    closePlayer() {
      this.mode = 'input'
      setTimeout(() => {
        this.$refs.first_input.select()
      }, 100)
    },
    nonemptyInputs() {
      return this.videoId && this.start && this.end
    }
  },
  components: {
    Loading,
    Player
  },
  mounted() {
    // this.videoId = 'lBpfjOaL8iw'
    // this.start = '51:02'
    // this.end = '53:24'
    // listen for escape key
    document.addEventListener('keyup', e => {
      if (e.key == 'Escape') {
        this.closePlayer()
      }
    })
  }
}
</script>

<template>
<div class="page1" v-if="inputMode">
  <h1 class="header">YouTube Looper</h1>
  <div class="inputs">
    <div class="input">
      <span>Video ID</span>
      <input type="text" autofocus v-model="videoId" @keyup.enter="submit" ref="first_input" />
    </div>
    <div class="input">
      <span>Start</span>
      <input type="text" v-model="start" @keyup.enter="submit" />
    </div>
    <div class="input">
      <span>End</span>
      <input type="text" v-model="end" @keyup.enter="submit" />
    </div>
    <button @click="submit">Loop Video</button>
  </div>
</div>
<span class="material-icons-outlined close" @click="closePlayer" v-if="playingMode">close</span>
</template>

<style>
@import url('https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp');

html, body {
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  font-family: 'Roboto', sans-serif;
}
#app {
  display: flex;
  flex-direction: column;
  gap: 14px;
  height: 100%;
  justify-content: center;
}
.header {
  user-select: none;
  cursor: pointer;
}
.inputs {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.input {
  display: flex;
  flex-direction: column;
}
input {
  background: white;
  border: 1px solid #6e6e6e;
  font-size: 16px;
  padding: 7px;
  border-radius: 7px;
  margin-top: 3px;
}
.close {
  position: fixed;
  top: 20px;
  right: 20px;
  font-size: 40px;
  user-select: none;
  cursor: pointer;
}
button {
  background: black;
  color: white;
  width: fit-content;
  border: none;
  padding: 10px;
  font-size: 16px;
  border-radius: 7px;
  cursor: pointer;
  align-self: flex-end;
  margin-top: 10px;
}
button:hover {
  background: #333;
}
</style>
