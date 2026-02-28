#!/usr/bin/with-contenv bashio

bashio::log.info "Starting Jarvis..."

export OPENAI_KEY="$(bashio::config 'openai_key')"
export HA_TOKEN="$(bashio::config 'ha_token')"
export MODEL="$(bashio::config 'openai_model')"
export SPEAKER_GAIN="$(bashio::config 'speaker_gain')"
export MIC_GAIN="$(bashio::config 'mic_gain')"
export LOG_ENABLED="$(bashio::config 'log_enabled')"
export INACTIVITY_TIMEOUT="$(bashio::config 'inactivity_timeout')"
export VOSK_MODEL_PATH="/share/jarvis/models/vosk-model-small-ru-0.22"

# JSON массив → строка через запятую: ["джарвис","жарвис"] → джарвис,жарвис
export WAKE_WORDS="$(bashio::config 'wake_words' | jq -r 'join(",")')"
export STOP_WORDS="$(bashio::config 'stop_words' | jq -r 'join(",")')"

bashio::log.info "Model: ${MODEL} | spk gain: ${SPEAKER_GAIN} | mic gain: ${MIC_GAIN}"
bashio::log.info "Wake words: ${WAKE_WORDS}"
bashio::log.info "Vosk model: ${VOSK_MODEL_PATH}"

exec java -Xmx256m -jar /app/jarvis.jar