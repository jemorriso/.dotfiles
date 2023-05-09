
(
s.reboot { // server options are only updated on reboot
	// configure the sound server: here you could add hardware specific options
	// see http://doc.sccode.org/Classes/ServerOptions.html
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 64; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = 2; // set this to your hardware output channel size, if necessary
	// boot the server and start SuperDirt
	s.waitForBoot {
		~dirt.stop; // stop any old ones, avoid duplicate dirt (if it is nil, this won't do anything)
		~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
		~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)

		~dirt.loadSoundFiles("/Users/jerry/samples/tidalcycles-course/*");

		// for example: ~dirt.loadSoundFiles("/Users/myUserName/Dirt/samples/*");
		// s.sync; // optionally: wait for samples to be read
		~dirt.start(57120, 0 ! 12);   // start listening on port 57120, create two busses each sending audio to channel 0

		// optional, needed for convenient access from sclang:
		(
			~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
			~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
			~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
			~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
		);

		// directly below here, in your own copy of this file, you could add further code that you want to call on startup
		// this makes sure the server and ~dirt are running
		// you can keep this separate and make it easier to switch between setups
		// by using "path/to/my/file.scd".load and if necessary commenting out different load statements
		// ...

	};

	s.latency = 0.3; // increase this if you get "late" messages


};

SynthDef(\cs80lead, {

		arg freq=880, amp=0.5, attack=0.75, decay=0.5, sustain=0.8, release=1.0, fatt=0.75, fdecay=0.5, fsus=0.8, frel=1.0,
			cutoff=200, pan=0, dtune=0.002, vibrate=4, vibdepth=0.015, gate=1.0, ratio=1,out=0,cbus=1;
		var env,fenv,vib,ffreq,sig;
		cutoff=In.kr(cbus);
		//env=EnvGen.kr(Env.adsr(attack,decay,sustain,release),gate,levelScale:1,doneAction:2);
		//fenv=EnvGen.kr(Env.adsr(fatt,fdecay,fsus,frel,curve:2),gate,levelScale:1,doneAction:2);
		vib=SinOsc.kr(vibrate).range(-1*vibdepth,vibdepth)+1;
		freq=Line.kr(freq,freq*ratio,5);
		freq=freq*vib;
		sig=Mix.ar(Saw.ar([freq,freq*(1+dtune)]));
		// keep this below nyquist!!
		//ffreq=max(fenv*freq*12,cutoff)+100;
		ffreq=max(freq*12,cutoff)+100;
		sig=LPF.ar(sig,ffreq);


	    //OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan, env));
	    OffsetOut.ar(out, DirtPan.ar(sig, ~dirt.numChannels, pan));


	}).add;
);

