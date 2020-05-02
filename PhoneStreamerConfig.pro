###
#BASIC
###
QT       += core gui widgets quick multimedia sql
TARGET = PhoneStreamerConfig
TEMPLATE = app
TRANSLATIONS = languages/psc_ru.ts

###
#CONFIG
###
win32 {
CONFIG += c++11
}

###
#DEFINES
###
win32 {
DEFINES += PJ_NATIVE_STRING_IS_UNICODE=1 \
           PJ_WIN32=1 \
           PJ_IS_LITTLE_ENDIAN=1 \
           PJ_IS_BIG_ENDIAN=0 \
           PJ_HAS_WINSOCK2_H \
           PJ_HAS_WS2TCPIP_H

DEFINES -= UNICODE

LIBS += -lwinmm \
        -lole32 \
        -lws2_32 \
        -lwsock32 \
        -lgdi32
}

INCLUDEPATH += ../libpjproject/ \
    ../libpjproject/pjlib/include \
    ../libpjproject/pjlib-util/include \
    ../libpjproject/pjsip/include \
    ../libpjproject/pjmedia/include \
    ../libpjproject/pjnath/include \
    ../libpjproject/third_party/gsm/inc \
    ../libpjproject/third_party/resample/include \
    ../libpjproject/third_party/speex/include \
    ../libpjproject/third_party/srtp/include \
    ../libpjproject/third_party/srtp/crypto/include \
    ../libpjproject/third_party/build/srtp \

HEADERS  += \
    mainwindow.h

###
#SOURCE FILES
###
SOURCES += main.cpp \
        mainwindow.cpp \
    ../libpjproject/third_party/BaseClasses/amfilter.cpp \
    ../libpjproject/third_party/BaseClasses/amvideo.cpp \
    ../libpjproject/third_party/BaseClasses/arithutil.cpp \
    ../libpjproject/third_party/BaseClasses/combase.cpp \
    ../libpjproject/third_party/BaseClasses/ctlutil.cpp \
    ../libpjproject/third_party/BaseClasses/mtype.cpp \
    ../libpjproject/third_party/BaseClasses/renbase.cpp \
    ../libpjproject/third_party/BaseClasses/wxdebug.cpp \
    ../libpjproject/third_party/BaseClasses/wxlist.cpp \
    ../libpjproject/third_party/BaseClasses/wxutil.cpp \
    ../libpjproject/third_party/g7221/common/basicop.c \
    ../libpjproject/third_party/g7221/common/common.c \
    ../libpjproject/third_party/g7221/common/huff_tab.c \
    ../libpjproject/third_party/g7221/common/tables.c \
    ../libpjproject/third_party/g7221/decode/coef2sam.c \
    ../libpjproject/third_party/g7221/decode/dct4_s.c \
    ../libpjproject/third_party/g7221/decode/decoder.c \
    ../libpjproject/third_party/g7221/encode/dct4_a.c \
    ../libpjproject/third_party/g7221/encode/encoder.c \
    ../libpjproject/third_party/g7221/encode/sam2coef.c \
    ../libpjproject/third_party/gsm/src/add.c \
    ../libpjproject/third_party/gsm/src/code.c \
    ../libpjproject/third_party/gsm/src/debug.c \
    ../libpjproject/third_party/gsm/src/decode.c \
    ../libpjproject/third_party/gsm/src/gsm_create.c \
    ../libpjproject/third_party/gsm/src/gsm_decode.c \
    ../libpjproject/third_party/gsm/src/gsm_destroy.c \
    ../libpjproject/third_party/gsm/src/gsm_encode.c \
    ../libpjproject/third_party/gsm/src/gsm_explode.c \
    ../libpjproject/third_party/gsm/src/gsm_implode.c \
    ../libpjproject/third_party/gsm/src/gsm_option.c \
    ../libpjproject/third_party/gsm/src/gsm_print.c \
    ../libpjproject/third_party/gsm/src/long_term.c \
    ../libpjproject/third_party/gsm/src/gsm_lpc.c \
    ../libpjproject/third_party/gsm/src/gsm_preprocess.c \
    ../libpjproject/third_party/gsm/src/rpe.c \
    ../libpjproject/third_party/gsm/src/short_term.c \
    ../libpjproject/third_party/gsm/src/table.c \
    ../libpjproject/third_party/ilbc/anaFilter.c \
    ../libpjproject/third_party/ilbc/constants.c \
    ../libpjproject/third_party/ilbc/createCB.c \
    ../libpjproject/third_party/ilbc/doCPLC.c \
    ../libpjproject/third_party/ilbc/enhancer.c \
    ../libpjproject/third_party/ilbc/filter.c \
    ../libpjproject/third_party/ilbc/FrameClassify.c \
    ../libpjproject/third_party/ilbc/gainquant.c \
    ../libpjproject/third_party/ilbc/getCBvec.c \
    ../libpjproject/third_party/ilbc/helpfun.c \
    ../libpjproject/third_party/ilbc/hpInput.c \
    ../libpjproject/third_party/ilbc/hpOutput.c \
    ../libpjproject/third_party/ilbc/iCBConstruct.c \
    ../libpjproject/third_party/ilbc/iCBSearch.c \
    ../libpjproject/third_party/ilbc/iLBC_decode.c \
    ../libpjproject/third_party/ilbc/iLBC_encode.c \
    ../libpjproject/third_party/ilbc/LPCdecode.c \
    ../libpjproject/third_party/ilbc/LPCencode.c \
    ../libpjproject/third_party/ilbc/lsf.c \
    ../libpjproject/third_party/ilbc/packing.c \
    ../libpjproject/third_party/ilbc/StateConstructW.c \
    ../libpjproject/third_party/ilbc/StateSearchW.c \
    ../libpjproject/third_party/ilbc/syntFilter.c \
    ../libpjproject/third_party/milenage/milenage.c \
    ../libpjproject/third_party/milenage/rijndael.c \
    ../libpjproject/third_party/resample/src/resamplesubs.c \
    ../libpjproject/third_party/speex/libspeex/bits.c \
    ../libpjproject/third_party/speex/libspeex/cb_search.c \
    ../libpjproject/third_party/speex/libspeex/exc_5_64_table.c \
    ../libpjproject/third_party/speex/libspeex/exc_5_256_table.c \
    ../libpjproject/third_party/speex/libspeex/exc_8_128_table.c \
    ../libpjproject/third_party/speex/libspeex/exc_10_16_table.c \
    ../libpjproject/third_party/speex/libspeex/exc_10_32_table.c \
    ../libpjproject/third_party/speex/libspeex/exc_20_32_table.c \
    ../libpjproject/third_party/speex/libspeex/fftwrap.c \
    ../libpjproject/third_party/speex/libspeex/filterbank.c \
    ../libpjproject/third_party/speex/libspeex/filters.c \
    ../libpjproject/third_party/speex/libspeex/gain_table.c \
    ../libpjproject/third_party/speex/libspeex/gain_table_lbr.c \
    ../libpjproject/third_party/speex/libspeex/hexc_10_32_table.c \
    ../libpjproject/third_party/speex/libspeex/hexc_table.c \
    ../libpjproject/third_party/speex/libspeex/high_lsp_tables.c \
    ../libpjproject/third_party/speex/libspeex/kiss_fft.c \
    ../libpjproject/third_party/speex/libspeex/kiss_fftr.c \
    ../libpjproject/third_party/speex/libspeex/lpc.c \
    ../libpjproject/third_party/speex/libspeex/lsp.c \
    ../libpjproject/third_party/speex/libspeex/lsp_tables_nb.c \
    ../libpjproject/third_party/speex/libspeex/ltp.c \
    ../libpjproject/third_party/speex/libspeex/mdf.c \
    ../libpjproject/third_party/speex/libspeex/modes.c \
    ../libpjproject/third_party/speex/libspeex/modes_wb.c \
    ../libpjproject/third_party/speex/libspeex/nb_celp.c \
    ../libpjproject/third_party/speex/libspeex/preprocess.c \
    ../libpjproject/third_party/speex/libspeex/quant_lsp.c \
    ../libpjproject/third_party/speex/libspeex/resample.c \
    ../libpjproject/third_party/speex/libspeex/sb_celp.c \
    ../libpjproject/third_party/speex/libspeex/smallft.c \
    ../libpjproject/third_party/speex/libspeex/speex.c \
    ../libpjproject/third_party/speex/libspeex/speex_callbacks.c \
    ../libpjproject/third_party/speex/libspeex/stereo.c \
    ../libpjproject/third_party/speex/libspeex/vbr.c \
    ../libpjproject/third_party/speex/libspeex/vq.c \
    ../libpjproject/third_party/speex/libspeex/window.c \
    ../libpjproject/third_party/srtp/crypto/cipher/aes.c \
    ../libpjproject/third_party/srtp/crypto/cipher/aes_cbc.c \
    ../libpjproject/third_party/srtp/crypto/cipher/aes_icm.c \
    ../libpjproject/third_party/srtp/crypto/cipher/cipher.c \
    ../libpjproject/third_party/srtp/crypto/cipher/null_cipher.c \
    ../libpjproject/third_party/srtp/crypto/hash/auth.c \
    ../libpjproject/third_party/srtp/crypto/hash/hmac.c \
    ../libpjproject/third_party/srtp/crypto/hash/null_auth.c \
    ../libpjproject/third_party/srtp/crypto/hash/ch_sha1.c \
    ../libpjproject/third_party/srtp/crypto/kernel/alloc.c \
    ../libpjproject/third_party/srtp/crypto/kernel/crypto_kernel.c \
    ../libpjproject/third_party/srtp/crypto/kernel/key.c \
    ../libpjproject/third_party/srtp/crypto/math/datatypes.c \
    ../libpjproject/third_party/srtp/crypto/math/gf2_8.c \
    ../libpjproject/third_party/srtp/crypto/math/stat.c \
    ../libpjproject/third_party/srtp/crypto/replay/rdb.c \
    ../libpjproject/third_party/srtp/crypto/replay/rdbx.c \
    ../libpjproject/third_party/srtp/crypto/replay/ut_sim.c \
    ../libpjproject/third_party/srtp/crypto/rng/ctr_prng.c \
    ../libpjproject/third_party/srtp/crypto/rng/prng.c \
    ../libpjproject/third_party/srtp/crypto/rng/rand_source.c \
    ../libpjproject/third_party/srtp/pjlib/srtp_err.c \
    ../libpjproject/third_party/srtp/srtp/ekt.c \
    ../libpjproject/third_party/srtp/srtp/srtp.c \
    ../libpjproject/pjlib/src/pj/activesock.c \
    ../libpjproject/pjlib/src/pj/addr_resolv_sock.c \
    ../libpjproject/pjlib/src/pj/array.c \
    ../libpjproject/pjlib/src/pj/config.c \
    ../libpjproject/pjlib/src/pj/ctype.c \
    ../libpjproject/pjlib/src/pj/pj_errno.c \
    ../libpjproject/pjlib/src/pj/except.c \
    ../libpjproject/pjlib/src/pj/fifobuf.c \
    ../libpjproject/pjlib/src/pj/file_access_win32.c \
    ../libpjproject/pjlib/src/pj/file_io_win32.c \
    ../libpjproject/pjlib/src/pj/guid.c \
    ../libpjproject/pjlib/src/pj/guid_win32.c \
    ../libpjproject/pjlib/src/pj/hash.c \
    ../libpjproject/pjlib/src/pj/ip_helper_win32.c \
    ../libpjproject/pjlib/src/pj/list.c \
    ../libpjproject/pjlib/src/pj/lock.c \
    ../libpjproject/pjlib/src/pj/log.c \
    ../libpjproject/pjlib/src/pj/log_writer_stdout.c \
    ../libpjproject/pjlib/src/pj/os_core_win32.c \
    ../libpjproject/pjlib/src/pj/os_error_win32.c \
    ../libpjproject/pjlib/src/pj/os_info.c \
    ../libpjproject/pjlib/src/pj/os_time_win32.c \
    ../libpjproject/pjlib/src/pj/os_timestamp_win32.c \
    ../libpjproject/pjlib/src/pj/pool.c \
    ../libpjproject/pjlib/src/pj/pool_buf.c \
    ../libpjproject/pjlib/src/pj/pool_caching.c \
    ../libpjproject/pjlib/src/pj/pool_dbg.c \
    ../libpjproject/pjlib/src/pj/pool_policy_malloc.c \
    ../libpjproject/pjlib/src/pj/rand.c \
    ../libpjproject/pjlib/src/pj/rbtree.c \
    ../libpjproject/pjlib/src/pj/sock_common.c \
    ../libpjproject/pjlib/src/pj/sock_qos_common.c \
    ../libpjproject/pjlib/src/pj/sock_qos_wm.c \
    ../libpjproject/pjlib/src/pj/sock_select.c \
    ../libpjproject/pjlib/src/pj/ssl_sock_common.c \
    ../libpjproject/pjlib/src/pj/ssl_sock_dump.c \
    ../libpjproject/pjlib/src/pj/pj_string.c \
    ../libpjproject/pjlib/src/pj/timer.c \
    ../libpjproject/pjlib/src/pj/types.c \
    ../libpjproject/pjlib/src/pj/unicode_win32.c \
    ../libpjproject/pjlib/src/pj/ioqueue_select.c \
    ../libpjproject/pjlib/src/pj/sock_bsd.c \
    ../libpjproject/pjlib/src/pj/sock_qos_bsd.c \
    ../libpjproject/pjlib/src/pj/sock_qos_dummy.c \
    ../libpjproject/pjlib/src/pj/os_time_common.c \
    ../libpjproject/pjlib/src/pj/os_timestamp_common.c \
    ../libpjproject/pjlib-util/src/pjlib-util/base64.c \
    #../libpjproject/pjlib/src/pj/ioqueue_common_abs.c
    ../libpjproject/pjlib-util/src/pjlib-util/cli.c \
    ../libpjproject/pjlib-util/src/pjlib-util/cli_console.c \
    ../libpjproject/pjlib-util/src/pjlib-util/cli_telnet.c \
    ../libpjproject/pjlib-util/src/pjlib-util/crc32.c \
    ../libpjproject/pjlib-util/src/pjlib-util/dns.c \
    ../libpjproject/pjlib-util/src/pjlib-util/dns_dump.c \
    ../libpjproject/pjlib-util/src/pjlib-util/dns_server.c \
    ../libpjproject/pjlib-util/src/pjlib-util/errno.c \
    ../libpjproject/pjlib-util/src/pjlib-util/getopt.c \
    ../libpjproject/pjlib-util/src/pjlib-util/hmac_md5.c \
    ../libpjproject/pjlib-util/src/pjlib-util/hmac_sha1.c \
    ../libpjproject/pjlib-util/src/pjlib-util/http_client.c \
    ../libpjproject/pjlib-util/src/pjlib-util/json.c \
    ../libpjproject/pjlib-util/src/pjlib-util/md5.c \
    ../libpjproject/pjlib-util/src/pjlib-util/pcap.c \
    ../libpjproject/pjlib-util/src/pjlib-util/resolver.c \
    ../libpjproject/pjlib-util/src/pjlib-util/scanner.c \
    ../libpjproject/pjlib-util/src/pjlib-util/scanner_cis_bitwise.c \
    ../libpjproject/pjlib-util/src/pjlib-util/scanner_cis_uint.c \
    ../libpjproject/pjlib-util/src/pjlib-util/sha1.c \
    ../libpjproject/pjlib-util/src/pjlib-util/srv_resolver.c \
    ../libpjproject/pjlib-util/src/pjlib-util/string.c \
    ../libpjproject/pjlib-util/src/pjlib-util/stun_simple.c \
    ../libpjproject/pjlib-util/src/pjlib-util/stun_simple_client.c \
    ../libpjproject/pjlib-util/src/pjlib-util/symbols.c \
    ../libpjproject/pjlib-util/src/pjlib-util/xml.c \
    ../libpjproject/pjmedia/src/pjmedia/alaw_ulaw.c \
    ../libpjproject/pjmedia/src/pjmedia/alaw_ulaw_table.c \
    ../libpjproject/pjmedia/src/pjmedia/pjm_audiodev.c \
    ../libpjproject/pjmedia/src/pjmedia/avi_player.c \
    ../libpjproject/pjmedia/src/pjmedia/bidirectional.c \
    ../libpjproject/pjmedia/src/pjmedia/clock_thread.c \
    ../libpjproject/pjmedia/src/pjmedia/codec.c \
    ../libpjproject/pjmedia/src/pjmedia/conf_switch.c \
    ../libpjproject/pjmedia/src/pjmedia/conference.c \
    ../libpjproject/pjmedia/src/pjmedia/converter.c \
    ../libpjproject/pjmedia/src/pjmedia/converter_libswscale.c \
    ../libpjproject/pjmedia/src/pjmedia/converter_libyuv.c \
    ../libpjproject/pjmedia/src/pjmedia/delaybuf.c \
    ../libpjproject/pjmedia/src/pjmedia/echo_common.c \
    ../libpjproject/pjmedia/src/pjmedia/echo_port.c \
    ../libpjproject/pjmedia/src/pjmedia/echo_speex.c \
    ../libpjproject/pjmedia/src/pjmedia/echo_suppress.c \
    ../libpjproject/pjmedia/src/pjmedia/pjm_endpoint.c \
    ../libpjproject/pjmedia/src/pjmedia/pjm_errno.c \
    ../libpjproject/pjmedia/src/pjmedia/event.c \
    ../libpjproject/pjmedia/src/pjmedia/ffmpeg_util.c \
    ../libpjproject/pjmedia/src/pjmedia/format.c \
    ../libpjproject/pjmedia/src/pjmedia/g711.c \
    ../libpjproject/pjmedia/src/pjmedia/jbuf.c \
    ../libpjproject/pjmedia/src/pjmedia/master_port.c \
    ../libpjproject/pjmedia/src/pjmedia/mem_capture.c \
    ../libpjproject/pjmedia/src/pjmedia/mem_player.c \
    ../libpjproject/pjmedia/src/pjmedia/null_port.c \
    ../libpjproject/pjmedia/src/pjmedia/plc_common.c \
    ../libpjproject/pjmedia/src/pjmedia/port.c \
    ../libpjproject/pjmedia/src/pjmedia/resample_libsamplerate.c \
    ../libpjproject/pjmedia/src/pjmedia/resample_port.c \
    ../libpjproject/pjmedia/src/pjmedia/resample_resample.c \
    ../libpjproject/pjmedia/src/pjmedia/resample_speex.c \
    ../libpjproject/pjmedia/src/pjmedia/rtcp.c \
    ../libpjproject/pjmedia/src/pjmedia/rtcp_xr.c \
    ../libpjproject/pjmedia/src/pjmedia/rtp.c \
    ../libpjproject/pjmedia/src/pjmedia/sdp.c \
    ../libpjproject/pjmedia/src/pjmedia/sdp_cmp.c \
    ../libpjproject/pjmedia/src/pjmedia/sdp_neg.c \
    ../libpjproject/pjmedia/src/pjmedia/silencedet.c \
    ../libpjproject/pjmedia/src/pjmedia/sound_legacy.c \
    ../libpjproject/pjmedia/src/pjmedia/sound_port.c \
    ../libpjproject/pjmedia/src/pjmedia/splitcomb.c \
    ../libpjproject/pjmedia/src/pjmedia/stereo_port.c \
    ../libpjproject/pjmedia/src/pjmedia/stream.c \
    ../libpjproject/pjmedia/src/pjmedia/stream_common.c \
    ../libpjproject/pjmedia/src/pjmedia/stream_info.c \
    ../libpjproject/pjmedia/src/pjmedia/tonegen.c \
    ../libpjproject/pjmedia/src/pjmedia/transport_adapter_sample.c \
    ../libpjproject/pjmedia/src/pjmedia/transport_ice.c \
    ../libpjproject/pjmedia/src/pjmedia/transport_loop.c \
    ../libpjproject/pjmedia/src/pjmedia/transport_srtp.c \
    ../libpjproject/pjmedia/src/pjmedia/transport_udp.c \
    ../libpjproject/pjmedia/src/pjmedia/pjm_types.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_codec.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_codec_util.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_port.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_stream.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_stream_info.c \
    ../libpjproject/pjmedia/src/pjmedia/vid_tee.c \
    ../libpjproject/pjmedia/src/pjmedia/pjm_videodev.c \
    ../libpjproject/pjmedia/src/pjmedia/wav_player.c \
    ../libpjproject/pjmedia/src/pjmedia/wav_playlist.c \
    ../libpjproject/pjmedia/src/pjmedia/wav_writer.c \
    ../libpjproject/pjmedia/src/pjmedia/wave.c \
    ../libpjproject/pjmedia/src/pjmedia/wsola.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/symb_aps_dev.cpp \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/symb_mda_dev.cpp \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/symb_vas_dev.cpp \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/audiodev.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/audiotest.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/bdimad_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/pjma_errno.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/legacy_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/null_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/pa_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-audiodev/wmme_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/g722/g722_dec.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/g722/g722_enc.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/openh264.cpp \
    ../libpjproject/pjmedia/src/pjmedia-codec/amr_sdp_match.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/audio_codecs.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/g722.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/g7221.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/g7221_sdp_match.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/gsm.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/h263_packetizer.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/h264_packetizer.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/ilbc.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/ipp_codecs.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/l16.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/opencore_amr.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/passthrough.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/silk.c \
    ../libpjproject/pjmedia/src/pjmedia-codec/speex_codec.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/dshowclasses.cpp \
    ../libpjproject/pjmedia/src/pjmedia-videodev/avi_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/colorbar_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/dshow_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/pjmv_errno.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/ffmpeg_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/sdl_dev.c \
    ../libpjproject/pjmedia/src/pjmedia-videodev/videodev.c \
    ../libpjproject/pjnath/src/pjnath/nath_errno.c \
    ../libpjproject/pjnath/src/pjnath/ice_session.c \
    ../libpjproject/pjnath/src/pjnath/ice_strans.c \
    ../libpjproject/pjnath/src/pjnath/nat_detect.c \
    ../libpjproject/pjnath/src/pjnath/stun_auth.c \
    ../libpjproject/pjnath/src/pjnath/stun_msg.c \
    ../libpjproject/pjnath/src/pjnath/stun_msg_dump.c \
    ../libpjproject/pjnath/src/pjnath/stun_session.c \
    ../libpjproject/pjnath/src/pjnath/stun_sock.c \
    ../libpjproject/pjnath/src/pjnath/stun_transaction.c \
    ../libpjproject/pjnath/src/pjnath/turn_session.c \
    ../libpjproject/pjnath/src/pjnath/turn_sock.c \
    ../libpjproject/pjsip/src/pjsip/sip_auth_aka.c \
    ../libpjproject/pjsip/src/pjsip/sip_auth_client.c \
    ../libpjproject/pjsip/src/pjsip/sip_auth_msg.c \
    ../libpjproject/pjsip/src/pjsip/sip_auth_parser.c \
    ../libpjproject/pjsip/src/pjsip/sip_auth_server.c \
    ../libpjproject/pjsip/src/pjsip/sip_config.c \
    ../libpjproject/pjsip/src/pjsip/sip_dialog.c \
    ../libpjproject/pjsip/src/pjsip/sip_endpoint.c \
    ../libpjproject/pjsip/src/pjsip/sip_errno.c \
    ../libpjproject/pjsip/src/pjsip/sip_msg.c \
    ../libpjproject/pjsip/src/pjsip/sip_multipart.c \
    ../libpjproject/pjsip/src/pjsip/sip_parser.c \
    ../libpjproject/pjsip/src/pjsip/sip_resolve.c \
    ../libpjproject/pjsip/src/pjsip/sip_tel_uri.c \
    ../libpjproject/pjsip/src/pjsip/sip_transaction.c \
    ../libpjproject/pjsip/src/pjsip/sip_transport.c \
    ../libpjproject/pjsip/src/pjsip/sip_transport_loop.c \
    ../libpjproject/pjsip/src/pjsip/sip_transport_tcp.c \
    ../libpjproject/pjsip/src/pjsip/sip_transport_tls.c \
    ../libpjproject/pjsip/src/pjsip/sip_transport_udp.c \
    ../libpjproject/pjsip/src/pjsip/sip_ua_layer.c \
    ../libpjproject/pjsip/src/pjsip/sip_uri.c \
    ../libpjproject/pjsip/src/pjsip/sip_util.c \
    ../libpjproject/pjsip/src/pjsip/sip_util_proxy.c \
    ../libpjproject/pjsip/src/pjsip/sip_util_statefull.c \
    ../libpjproject/pjsip/src/pjsip-simple/pjss_errno.c \
    ../libpjproject/pjsip/src/pjsip-simple/evsub.c \
    ../libpjproject/pjsip/src/pjsip-simple/evsub_msg.c \
    ../libpjproject/pjsip/src/pjsip-simple/iscomposing.c \
    ../libpjproject/pjsip/src/pjsip-simple/mwi.c \
    ../libpjproject/pjsip/src/pjsip-simple/pidf.c \
    ../libpjproject/pjsip/src/pjsip-simple/presence.c \
    ../libpjproject/pjsip/src/pjsip-simple/presence_body.c \
    ../libpjproject/pjsip/src/pjsip-simple/publishc.c \
    ../libpjproject/pjsip/src/pjsip-simple/rpid.c \
    ../libpjproject/pjsip/src/pjsip-simple/xpidf.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_100rel.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_inv.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_reg.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_replaces.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_timer.c \
    ../libpjproject/pjsip/src/pjsip-ua/sip_xfer.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_acc.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_aud.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_call.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_core.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_dump.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_im.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_media.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_pres.c \
    ../libpjproject/pjsip/src/pjsua-lib/pjsua_vid.c \
    ../libpjproject/pjsip/src/pjsua2/account.cpp \
    ../libpjproject/pjsip/src/pjsua2/call.cpp \
    ../libpjproject/pjsip/src/pjsua2/endpoint.cpp \
    ../libpjproject/pjsip/src/pjsua2/pjsua2_json.cpp \
    ../libpjproject/pjsip/src/pjsua2/media.cpp \
    ../libpjproject/pjsip/src/pjsua2/persistent.cpp \
    ../libpjproject/pjsip/src/pjsua2/pjsua2_presence.cpp \
    ../libpjproject/pjsip/src/pjsua2/siptypes.cpp \
    ../libpjproject/pjsip/src/pjsua2/pjsua2_types.cpp


FORMS    += mainwindow.ui

###
#OTHER FILES
###
win32 {
    CONFIG(release){
        message("release mode")
        RC_FILE = manifest.rc
    }
    else{
        message("debug mode")
        RC_FILE = debugmanifest.rc
    }
}

RESOURCES += \
    images.qrc \
    style.qrc

DISTFILES += \
    manifest.rc \
    languages/psc_ru.ts
