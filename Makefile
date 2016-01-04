DTC=dtc
targets=mztx-pi-ext-overlay.dtb pitft22-overlay.dtb
overlays=/boot/overlays

all: $(targets)

clean:
	@$(foreach target,$(targets),$(RM) $(target);)

install: $(targets)
	@$(foreach target,$(targets),cp $(target) $(overlays)/$(target) ;)

uninstall: $(targets)
	@$(foreach target,$(targets),rm -f $(overlays)/$(target) ;)

%.dtb: %.dts
	$(DTC) -@ -I dts -O dtb -o $@ $<
