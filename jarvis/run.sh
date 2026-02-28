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

export WAKE_WORDS="$(bashio::config 'wake_words' | tr '\n' ',' | sed 's/,$//')"
export STOP_WORDS="$(bashio::config 'stop_words' | tr '\n' ',' | sed 's/,$//')"

bashio::log.info "Model: ${MODEL} | spk gain: ${SPEAKER_GAIN} | mic gain: ${MIC_GAIN}"
bashio::log.info "Wake words: ${WAKE_WORDS}"
bashio::log.info "Vosk model: ${VOSK_MODEL_PATH}"

bashio::log.info "Java version: $(java -version 2>&1)"
bashio::log.info "Model exists: $(ls ${VOSK_MODEL_PATH} | head -3)"

exec java -Xmx512m -jar /app/jarvis.jar 2>&1