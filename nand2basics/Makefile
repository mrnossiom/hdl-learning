SRCS_NAMES = nand not and or xor mux demux fulladder
SRCS = $(SRCS_NAMES:%=src/%.vhd)

SRCS_WAVES = $(SRCS:%.vhd=%.vcf)
SRCS_SCHEME = $(SRCS:%.vhd=%.svg)

GHDL=ghdl
GHDL_FLAGS=--workdir=src --work=nand2tetris
#####################

all: $(BINS)

work-obj93.cf: $(OTHER_SRCS)
	rm -f work-obj93.cf
	ghdl import $+

$(SRCS):  %.vhd: %.vhd work-obj93.cf
	ghdl analyse -g $(@:%.o=%.vhdl)

$(SRCS_WAVES): %.vcf: %.vhd
	ghdl analyse -g $(@:%.o=%.vhdl)

$(patsubst %.o,%,$(filter step%,$(OBJS))): $(OTHER_OBJS)
$(BINS): %: %.o
	ghdl analyse -g $@
	# ghdl linker creates a lowercase executable; rename it to stepA_mal
	if [ "$@" = "stepA_mal" ]; then mv stepa_mal $@; fi

clean:
	rm -f $(OBJS) $(BINS) $(OTHER_OBJS) work-obj93.cf mal
