--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';


-- SET default_table_access_method = heap;

--
-- Name: author_information; Type: TABLE; Schema: public; Owner: weirdjs
--

CREATE TABLE public.author_information (
    author_id integer NOT NULL,
    author_name character varying(200)
);



--
-- Name: author_information_author_id_seq; Type: SEQUENCE; Schema: public; Owner: weirdjs
--

CREATE SEQUENCE public.author_information_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: author_information_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: weirdjs
--

ALTER SEQUENCE public.author_information_author_id_seq OWNED BY public.author_information.author_id;


--
-- Name: book_information; Type: TABLE; Schema: public; Owner: weirdjs
--

CREATE TABLE public.book_information (
    book_id integer NOT NULL,
    title character varying(200) NOT NULL,
    author character varying(200) NOT NULL,
    coauthor character varying(200),
    isbn character varying(10) NOT NULL,
    publish_year smallint NOT NULL,
    CONSTRAINT book_information_publish_year_check CHECK ((publish_year > 0))
);


--
-- Name: book_information_book_id_seq; Type: SEQUENCE; Schema: public; Owner: weirdjs
--

CREATE SEQUENCE public.book_information_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: book_information_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: weirdjs
--

ALTER SEQUENCE public.book_information_book_id_seq OWNED BY public.book_information.book_id;


--
-- Name: review_information; Type: TABLE; Schema: public; Owner: weirdjs
--

CREATE TABLE public.review_information (
    review_id integer NOT NULL,
    book_id integer,
    user_id integer,
    score smallint,
    review_date date,
    review_time time without time zone,
    review_text text,
    CONSTRAINT review_information_score_check CHECK (((score > 0) AND (score < 6)))
);



--
-- Name: review_information_review_id_seq; Type: SEQUENCE; Schema: public; Owner: weirdjs
--

CREATE SEQUENCE public.review_information_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: review_information_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: weirdjs
--

ALTER SEQUENCE public.review_information_review_id_seq OWNED BY public.review_information.review_id;


--
-- Name: user_data; Type: TABLE; Schema: public; Owner: weirdjs
--

CREATE TABLE public.user_data (
    user_id integer NOT NULL,
    username character varying(200),
    password_hash character varying(1000)
);



--
-- Name: user_data_user_id_seq; Type: SEQUENCE; Schema: public; Owner: weirdjs
--

CREATE SEQUENCE public.user_data_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: user_data_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: weirdjs
--

ALTER SEQUENCE public.user_data_user_id_seq OWNED BY public.user_data.user_id;


--
-- Name: author_information author_id; Type: DEFAULT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.author_information ALTER COLUMN author_id SET DEFAULT nextval('public.author_information_author_id_seq'::regclass);


--
-- Name: book_information book_id; Type: DEFAULT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.book_information ALTER COLUMN book_id SET DEFAULT nextval('public.book_information_book_id_seq'::regclass);


--
-- Name: review_information review_id; Type: DEFAULT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.review_information ALTER COLUMN review_id SET DEFAULT nextval('public.review_information_review_id_seq'::regclass);


--
-- Name: user_data user_id; Type: DEFAULT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.user_data ALTER COLUMN user_id SET DEFAULT nextval('public.user_data_user_id_seq'::regclass);


--
-- Data for Name: author_information; Type: TABLE DATA; Schema: public; Owner: weirdjs
--

COPY public.author_information (author_id, author_name) FROM stdin;
1	Richard Matheson
2	Walter Scott
3	Ann Packer
4	Neil Gaiman
5	Pittacus Lore
6	Sabaa Tahir
7	Bernard Cornwell
8	Cory Doctorow
9	Glennon Doyle Melton
10	Tedd Arnold
11	Kazuo Ishiguro
12	Shannon Hale
13	Laurell K. Hamilton
14	Matthew Pearl
15	Richard Wurmbrand
16	Madeleine Wickham
17	Linda Fairstein
18	Jennifer Weiner
19	Lorenzo Carcaterra
20	Dorothy L. Sayers
21	Julie Kibler
22	Dylan Thomas
23	Jessi Klein
24	Robyn Carr
25	Paul Torday
26	S.K. Tremayne
27	Sylvia Nasar
28	Bert Dodson
29	Philip Pullman
30	Ramez Naam
31	Robert Jackson Bennett
32	S.C. Stephens
33	Sue Grafton
34	Belva Plain
35	Oscar Wilde
36	Lionel Shriver
37	Alice Clayton
38	Gerda Weissmann Klein
39	P.B. Kerr
40	Eleanor Catton
41	Karen Cushman
42	A.W. Tozer
43	Tom Brokaw
44	Morris Gleitzman
45	Kevin Powers
46	Mercer Mayer
47	Kevin Hearne
48	Rohinton Mistry
49	Christina Schwarz
50	Janette Oke
51	Flannery O'Connor
52	Alan Cumming
53	Kathryn Stockett
54	Brigid Kemmerer
55	Kathryn Lasky
56	Augusten Burroughs
57	Paul Harding
58	Ami McKay
59	Khaled Hosseini
60	Ken Follett
61	Khushwant Singh
62	Sarah Ockler
63	Henry Miller
64	Peter Carey
65	Alexandra Bracken
66	Rachel Hauck
67	Cece Bell
68	Jordan Belfort
69	Paulo Coelho
70	Jessie Burton
71	Carl Sagan
72	Alan Brennert
73	Mary Lawson
74	Raina Telgemeier
75	Michael Chabon
76	Cynthia Hand
77	Jocelyn Davies
78	T.A. Barron
79	Lincoln Child
80	Deborah Rodriguez
81	Hope Jahren
82	Scott McCloud
83	Avi
84	Paul O. Zelinsky
85	Eric S. Nylund
86	Celeste Ng
87	Kate Chopin
88	Kate Grenville
89	Irvine Welsh
90	Michael Ende
91	Naomi Klein
92	R.J. Palacio
93	Susan Abulhawa
94	James Rollins
95	A.S. Byatt
96	Ann Rule
97	Roland Smith
98	Tim O'Brien
99	Jessica Park
100	Robert Louis Stevenson
101	Larry Correia
102	Claire Messud
103	Yoshihiro Togashi
104	Jesmyn Ward
105	Lev Grossman
106	Katherine Allred
107	John Steinbeck
108	Daniel Goleman
109	Leslie Marmon Silko
110	Christopher Moore
111	Marie Lu
112	Alissa Nutting
113	Lisa Jackson
114	Lorrie Moore
115	Jennifer Estep
116	David Foster Wallace
117	Ronald H. Balson
118	Michael Morpurgo
119	Robert Hughes
120	Laurie Halse Anderson
121	Rudolfo Anaya
122	Enid Bagnold
123	Stephanie Danler
124	Robert A. Caro
125	Kaui Hart Hemmings
126	Howard Jacobson
127	Kevin Kwan
128	William Landay
129	Wilson Rawls
130	Thomas Paine
131	Kasie West
132	Sandra Dallas
133	Chris d'Lacey
134	Charles Belfoure
135	Brian Jacques
136	Julie Gregory
137	R.A. Salvatore
138	Jhumpa Lahiri
139	Darynda Jones
140	Jeffrey Archer
141	Anne Fortier
142	Adam Hochschild
143	Carolyn  Parkhurst
144	Katie Alender
145	Julie   Murphy
146	Gregg Hurwitz
147	Clare Mackintosh
148	Ken Grimwood
149	Ray Bradbury
150	Kurt Busiek
151	Judith McNaught
152	Daniel O'Malley
153	Joel C. Rosenberg
154	Laura  McBride
155	Sarah Waters
156	Kurt Vonnegut Jr.
157	Steve Martin
158	Jodi Lynn Anderson
159	Kiera Cass
160	Margaret Weis
161	Barbara Delinsky
162	Dave Cullen
163	Steven Erikson
164	Charles Martin
165	Nicholas Evans
166	Cathy Marie Buchanan
167	Brian Selznick
168	Wallace Stegner
169	Charles M. Sheldon
170	Barack Obama
171	Malcolm Lowry
172	Vladimir Nabokov
173	Jenny Downham
174	Michael Shaara
175	Chelsea M. Cameron
176	Diane Chamberlain
177	Tracy Chevalier
178	Darren Shan
179	Peter Mayle
180	Craig Ferguson
181	Natasha Friend
182	Nora Roberts
183	Stacy Schiff
184	Alessandro Baricco
185	Robin Hobb
186	M.R. Carey
187	John Connolly
188	Paul Tremblay
189	Keri Hulme
190	Slash
191	Jussi Adler-Olsen
192	Donna Tartt
193	Alan Bradley
194	Arthur Golden
195	Louise Penny
196	Erica Jong
197	Steven Johnson
198	Christine Feehan
199	Kerstin Gier
200	Ellen Stoll Walsh
201	Roald Dahl
202	Beverly  Lewis
203	Julie Kagawa
204	Rosamund Lupton
205	Salman Rushdie
206	Dale Brown
207	Jaycee Dugard
208	Wendy Higgins
209	Sara Gruen
210	Claire LaZebnik
211	Tom Rob Smith
212	Elizabeth Scott
213	Stephen Clarke
214	Val McDermid
215	Milan Kundera
216	Michael A. Stackpole
217	Lynda Mullaly Hunt
218	Napoleon Hill
219	Maeve Binchy
220	Amy Gentry
221	David Byrne
222	Alice LaPlante
223	Richard Bachman
224	Jenna Black
225	Julianna Baggott
226	Jonathan Maberry
227	Joseph Conrad
228	Mark Z. Danielewski
229	Tana French
230	Lurlene McDaniel
231	Brad Thor
232	Mike Carey
233	Carl Hiaasen
234	D.H. Lawrence
235	Jacqueline Susann
236	Holly Goldberg Sloan
237	Ingrid Law
238	John  Stephens
239	Tom Clancy
240	Lily King
241	Yuna Kagesaki
242	Julia Heaberlin
243	Frances Mayes
244	Walter Isaacson
245	Paulette Jiles
246	A.S.A. Harrison
247	H.G. Wells
248	Elizabeth Kostova
249	Alan W. Watts
250	Olive Ann Burns
251	Alison Weir
252	Jules Verne
253	Monica Ali
254	Anne Enright
255	Tonya Hurley
256	G.K. Chesterton
257	Herman Wouk
258	Helen Macdonald
259	Truman Capote
260	Vikram Seth
261	Bruce Springsteen
262	Isaac Marion
263	Umberto Eco
264	Art Spiegelman
265	Susanna Kaysen
266	Louise Fitzhugh
267	Sidney Sheldon
268	Lindsey Kelk
269	Gloria Steinem
270	John Steakley
271	Arthur Miller
272	Emily Giffin
273	Max Frisch
274	Beryl Markham
275	Bret Easton Ellis
276	Julie Garwood
277	Eric Berne
278	Jay McInerney
279	Rick Bragg
280	Candace Bushnell
281	Tracey Garvis-Graves
282	Elizabeth Gaskell
283	Ruth Reichl
284	Pepper Winters
285	Katherine Dunn
286	Kristan Higgins
287	Marissa Meyer
288	Alyson Richman
289	Rachel Ward
290	Tammara Webber
291	Mary E. Pearson
292	Abraham Verghese
293	Helen Fielding
294	Charles Portis
295	John Banville
296	Lori Nelson Spielman
297	Robertson Davies
298	Doug Lloyd
299	Taylor Caldwell
300	Jonathan Stroud
301	Winston Graham
302	Harlan Coben
303	Isaac Asimov
304	Jill Mansell
305	Steven Pinker
306	Ken Kesey
307	Nancy Thayer
308	Richard Wright
309	Shari Lapena
310	Genevieve Cogman
311	James Ellroy
312	Shiv Khera
313	Lorraine Hansberry
314	J.M. Darhower
315	Marjorie Kinnan Rawlings
316	M.L. Stedman
317	Marcus Sakey
318	Johanna Edwards
319	Caroline Kepnes
320	J.K. Rowling
321	Susan Cooper
322	Melissa Landers
323	Wilbur Smith
324	Lisa Scottoline
325	Jane Smiley
326	Katherine Neville
327	Joe Sacco
328	Ed Young
329	Mem Fox
330	Gary D. Schmidt
331	Veronica Rossi
332	Sara Paretsky
333	Vera B. Williams
334	Julianne Donaldson
335	William  Boyd
336	Eldridge Cleaver
337	Cheryl McIntyre
338	Jill Bolte Taylor
339	Gretchen Rubin
340	Tom Perrotta
341	T.S. Eliot
342	Lauren DeStefano
343	Harper Lee
344	Michael Herr
345	Gail Carriger
346	Jonathan Kellerman
347	Andy Weir
348	J.D. Robb
349	Anita Diamant
350	Myra McEntire
351	Paula Brackston
352	Thrity Umrigar
353	Yann Martel
354	Malinda Lo
355	Dr. Seuss
356	Catherine Fisher
357	Chuck Klosterman
358	Scarlett Thomas
359	Lois Lowry
360	Patrick Ness
361	Glenn Beck
362	Ursula Hegi
363	Peter Lerangis
364	S.J. Watson
365	Michael Blake
366	Joe Haldeman
367	Dave Ramsey
368	Lang Leav
369	Frank Herbert
370	Paolo Bacigalupi
371	Roger Zelazny
372	Fannie Flagg
373	Frank McCourt
374	Lolly Winston
375	Mary Kay Andrews
376	Ruta Sepetys
377	Nora Ephron
378	Dodie Smith
379	Colleen McCullough
380	Daniel Clowes
381	Elizabeth George Speare
382	Elizabeth Strout
383	David Levithan
384	P.D. Eastman
385	Django Wexler
386	Jenny O'Connell
387	Sudhir Venkatesh
388	Raymond Briggs
389	Caitlin Moran
390	Patricia Highsmith
391	Robert C. O'Brien
392	A.M. Homes
393	Paula McLain
394	Nevada Barr
395	Leila Meacham
396	Mark Helprin
397	Kent Haruf
398	Wendy Mass
399	Smith Henderson
400	Christopher Priest
401	Ann Voskamp
402	Edan Lepucki
403	Melissa Nathan
404	Edward Abbey
405	Kim Harrison
406	Ellen Hopkins
407	Jessica Day George
408	Ian McEwan
409	Eowyn Ivey
410	Jonathan Safran Foer
411	E. Nesbit
412	Robert Greene
413	Madeleine L'Engle
414	Lily Koppel
415	Jim Thompson
416	Faith Hunter
417	Sarah MacLean
418	Don Freeman
419	Angie Thomas
420	Vikas Swarup
421	Karen Kingsbury
422	Rachel Caine
423	Liane Moriarty
424	Julia Hoban
425	Kelly Creagh
426	Susan  Wilson
427	Ira Levin
428	Thor Heyerdahl
429	Heather Dixon
430	Rosamunde Pilcher
431	Simon Schama
432	Myla Goldberg
433	Louise Doughty
434	Georgette Heyer
435	Lisa Tawn Bergren
436	Morton Rhue
437	Elizabeth  George
438	James     Baldwin
439	Amy Ewing
440	Alan Dean Foster
441	V.S. Naipaul
442	Renee Ahdieh
443	Samantha Young
444	Aravind Adiga
445	Sarah Lotz
446	Sarah Addison Allen
447	Kristin Cashore
448	Graeme Simsion
449	Laurie Fabiano
450	John Darnielle
451	Lauren Conrad
452	Emma Healey
453	Chelsea Cain
454	Gayle Forman
455	Andre Dubus III
456	Arthur Conan Doyle
457	Marlo Morgan
458	Chetan Bhagat
459	Stephen R. Donaldson
460	L.A. Weatherly
461	Perry Moore
462	Phaidon Press
463	Mira Grant
464	Larry Niven
465	Austin Kleon
466	Hester Browne
467	Gwen Cooper
468	Ruth Wariner
469	Terry Brooks
470	Elmore Leonard
471	V.E. Schwab
472	Siri Hustvedt
473	Diana Gabaldon
474	Josephine Angelini
475	Sharon Guskin
476	Saul Bellow
477	M.T. Anderson
478	Ravinder Singh
479	Hannu Rajaniemi
480	T.H. White
481	Elizabeth Berg
482	Alfred Bester
483	Georgia Cates
484	Colin Meloy
485	Lucy Grealy
486	Benedict Jacka
487	Scott Westerfeld
488	Ira Wagler
489	John L. Parker Jr.
490	Mark  Lawrence
491	Kenneth Oppel
492	Michel Faber
493	Maggie Stiefvater
494	Tess Gerritsen
495	Craig Johnson
496	Emmuska Orczy
497	Alistair MacLean
498	J.J. Abrams
499	Dan Simmons
500	Jude Deveraux
501	Gary Larson
502	Joseph Heller
503	Robert Graves
504	Lois McMaster Bujold
505	Elly Griffiths
506	Hanya Yanagihara
507	Lauren Blakely
508	Brian Azzarello
509	Linwood Barclay
510	Kevin Henkes
511	Guy Gavriel Kay
512	Robin Oliveira
513	Jessica Sorensen
514	Ava Dellaira
515	Ellen Schreiber
516	Cath Crowley
517	Chad Harbach
518	Patrick Carman
519	Libba Bray
520	Miranda Beverly-Whittemore
521	Rosamund Hodge
522	Edward Rutherfurd
523	Dee Lestari
524	Robin LaFevers
525	Catherine Marshall
526	William  Gibson
527	Cassandra Clare
528	Josh McDowell
529	William Faulkner
530	Alan Hollinghurst
531	E.L. Konigsburg
532	Jennifer Brown
533	Phyllis Reynolds Naylor
534	Diane Mott Davidson
535	Amanda Grange
536	Judy Blume
537	Joan Bauer
538	Jerry A. Coyne
539	John Hersey
540	Amy  Stewart
541	Robert K. Massie
542	Jill Shalvis
543	Teri Terry
544	Gena Showalter
545	Neal Stephenson
546	Sharon M. Draper
547	John Brunner
548	Alex Marwood
549	Hunter S. Thompson
550	Holly Black
551	Robert Crais
552	Robert Lynn Asprin
553	Karen   White
554	Nicole  Williams
555	Anne McCaffrey
556	David Nicholls
557	Emma Cline
558	Victoria Schwab
559	Margaret Mitchell
560	Julia Child
561	Peter Heller
562	Iris Murdoch
563	Thomas Keneally
564	Sonya Sones
565	Sherrilyn Kenyon
566	John Shors
567	Aldous Huxley
568	Richard Price
569	Ernest Hemingway
570	Ellis Avery
571	Elaine Pagels
572	Karen Russell
573	Katie McGarry
574	Nancy Reagin
575	James Joyce
576	Richard Castle
577	Charles Bukowski
578	Lian Hearn
579	Michael  Grant
580	Kalayna Price
581	David Brin
582	Jim Bouton
583	Toni Morrison
584	Herman Melville
585	Robison Wells
586	Lauren Groff
587	Antony Beevor
588	Colleen Houck
589	Ai Yazawa
590	Eric Clapton
591	Daniel Abraham
592	Megan Whalen Turner
593	Gail Carson Levine
594	Amie Kaufman
595	John Wyndham
596	Helene Wecker
597	Amitav Ghosh
598	Joelle Charbonneau
599	Ernest J. Gaines
600	Charles Duhigg
601	Nicci French
602	J.L. Bourne
603	Tim Winton
604	Beth Harbison
605	Pat Conroy
606	Shelly Laurenston
607	Natalie Babbitt
608	Mario Benedetti
609	Arundhati Roy
610	William Golding
611	Ivan Doig
612	Henry Cloud
613	Lori Lansens
614	Rob Bell
615	Lauren Morrill
616	Ilana Tan
617	Marie Rutkoski
618	David Mazzucchelli
619	Anita Shreve
620	Nicholas Sparks
621	Liza Klaussmann
622	Cupcake Brown
623	Sheila Burnford
624	Nick Bruel
625	Eric Jerome Dickey
626	Victoria Aveyard
627	Edgar Rice Burroughs
628	George W. Bush
629	Jackie Collins
630	Melanie Rawn
631	Dolen Perkins-Valdez
632	Christina Lauren
633	Hannah Harrington
634	Jamie Ford
635	Rita Mae Brown
636	Joshua Ferris
637	Tom Robbins
638	Nalini Singh
639	Andrea Levy
640	Siobhan Vivian
641	Gail Tsukiyama
642	Naomi Novik
643	Brian Lumley
644	Natasha Solomons
645	Steven  Rowley
646	Zoe Sugg
647	Margaret Atwood
648	Steve Berry
649	Michael Frayn
650	Anne Bishop
651	Flann O'Brien
652	Tiffany Reisz
653	Ottessa Moshfegh
654	Daniel Woodrell
655	Kate Brian
656	Melanie Benjamin
657	John Green
658	Larry McMurtry
659	Susan Vreeland
660	W.P. Kinsella
661	Viet Thanh Nguyen
662	Stephen Crane
663	Sarah J. Maas
664	Thomas Hardy
665	Patricia Briggs
666	Katherine Paterson
667	Caragh M. O'Brien
668	James Dickey
669	James Luceno
670	Kate Morton
671	Jonathan Lethem
672	Jack McCallum
673	Laura McHugh
674	Marilynne Robinson
675	Jessica Verday
676	Shilpi Somaya Gowda
677	Robin Cook
678	Karen Hesse
679	Leif Enger
680	Daniel Suarez
681	Cinda Williams Chima
682	Mo Hayder
683	Christina Baker Kline
684	Terry McMillan
685	Meg Rosoff
686	Iris Rainer Dart
687	Helen Oyeyemi
688	Mary Karr
689	Vince Flynn
690	Sapphire
691	Virginia Woolf
692	Carolyn Jessop
693	Evelyn Waugh
694	Chris Gardner
695	Christopher Paolini
696	C.S. Pacat
697	John Stuart Mill
698	Spencer Quinn
699	Jacqueline Wilson
700	Natasha Preston
701	Stephen King
702	Sister Souljah
703	Cara Lockwood
704	Samantha Shannon
705	Conn Iggulden
706	Maria V. Snyder
707	Chevy Stevens
708	Anna Sewell
709	Alex   Sanchez
710	Christopher Pike
711	Chimamanda Ngozi Adichie
712	Scott Sigler
713	Erin Watt
714	Eoin Colfer
715	Kate DiCamillo
716	Jonathan Franzen
717	Sarah McCoy
718	Lloyd Alexander
719	Gemma Malley
720	Jodi Picoult
721	Jess Walter
722	Clive Cussler
723	Betty Mahmoody
724	Joan Didion
725	John Buchan
726	L. Frank Baum
727	Peter S. Beagle
728	Fred Gipson
729	Dava Sobel
730	Justin Torres
731	Jan Karon
732	M.J. Arlidge
733	Bill Bryson
734	Iain M. Banks
735	C.S. Friedman
736	Kentaro Yabuki
737	Lauren Beukes
738	Sally Green
739	Aimee Carter
740	Gillian Flynn
741	Walter Dean Myers
742	Jacquelyn Frank
743	Norman Mailer
744	Tracy Kidder
745	J.G. Ballard
746	Annie Proulx
747	Amy Waldman
748	Julia Glass
749	Donald McCaig
750	Chris Cleave
751	Tobias Wolff
752	Elizabeth Wurtzel
753	Peter Straub
754	Tony Hillerman
755	Gordon Korman
756	William C. Dietz
757	Johanna Lindsey
758	Garth Risk Hallberg
759	John Sandford
760	Josh Bazell
761	Trish Doller
762	Beth Revis
763	Evan Wright
764	David Wong
765	NoViolet Bulawayo
766	Sherman Alexie
767	Nick Hornby
768	Jack Kerouac
769	Rita Williams-Garcia
770	Noah Gordon
771	Sigmund Freud
772	Monica  Murphy
773	Richard Paul Evans
774	David Shannon
775	John Berendt
776	Gregory David Roberts
777	Jeffrey Eugenides
778	Laurence Rees
779	Bob Dylan
780	Ben Mikaelsen
781	Linda Howard
782	Jack Welch
783	Martin Heidegger
784	Kingsley Amis
785	Michael Cunningham
786	Rhonda Byrne
787	Cynthia Bond
788	Keith Richards
789	James Clavell
790	Anna Lee Waldo
791	Jean Anouilh
792	Peter  May
793	Sara Ryan
794	David Seltzer
795	Huntley Fitzpatrick
796	John Hart
797	Rick Yancey
798	Ram Dass
799	Alice Walker
800	Kim Gordon
801	Madeleine Roux
802	Jennifer Haigh
803	Justin Halpern
804	Jim Kjelgaard
805	Maurice Sendak
806	George Bernard Shaw
807	Graham Greene
808	Robert McCloskey
809	Garth Nix
810	Bruce Degen
811	Theodore Dreiser
812	Rachel Gibson
813	Alan Weisman
814	Marian Keyes
815	Laura Wiess
816	Timothy Ferriss
817	Dorothea Benton Frank
818	Robert Hicks
819	Roxane Gay
820	Walker Percy
821	Tim Johnston
822	Derf Backderf
823	Richard Russo
824	Octavia E. Butler
825	Jason  Matthews
826	Elizabeth Eulberg
827	Lauren Barnholdt
828	Shayla Black
829	Piers Anthony
830	Ann M. Martin
831	Danielle Trussoni
832	Kathleen Kent
833	Olivia Cunning
834	Pat Frank
835	S.A.R.K.
836	Louisa May Alcott
837	Gregory Maguire
838	Jaclyn Moriarty
839	Indu Sundaresan
840	B.A. Paris
841	Edmund Morris
842	Courtney Allison Moulton
843	Rory Stewart
844	Alyson Noel
845	James Redfield
846	Marisha Pessl
847	Rebecca Wells
848	Chelsea Handler
849	George Orwell
850	Yotam Ottolenghi
851	Simone Elkeles
852	Jandy Nelson
853	William Kent Krueger
854	Chinua Achebe
855	Michael Connelly
856	Ally Condie
857	Craig Thompson
858	Henry Hazlitt
859	Diane Duane
860	C.C. Hunter
861	Richard Branson
862	Susan Coolidge
863	Edith Wharton
864	Suzanne Rindell
865	Alan Lightman
866	Ransom Riggs
867	Kathryn Erskine
868	David Mamet
869	J.I. Packer
870	Alex Garland
871	Emma Straub
872	Gemma Burgess
873	Jennifer L. Armentrout
874	Paullina Simons
875	Jane Austen
876	Patrick Rothfuss
877	Jodi Meadows
878	Robert Charles Wilson
879	Rachel Kushner
880	Jim Gaffigan
881	Sue Monk Kidd
882	Christopher Hitchens
883	Steve Toltz
884	Liz Moore
885	William Styron
886	Eric Wilson
887	Kate Beaton
888	John Gardner
889	Ruth Ware
890	James Patterson
891	Mitch Albom
892	Jennifer Probst
893	Willa Cather
894	Don DeLillo
895	Jim Butcher
896	Pearl S. Buck
897	Breena Clarke
898	Michael Pollan
899	Julie Anne Peters
900	Sara Donati
901	Ann Hood
902	Clifford D. Simak
903	Hugh Howey
904	Mary Kubica
905	Sydney Taylor
906	Ilona Andrews
907	Susannah Cahalan
908	Antonia Fraser
909	Doris Lessing
910	Julia Quinn
911	Lissa Price
912	Allen Eskens
913	Kristin Hannah
914	Jennifer Niven
915	Alastair Reynolds
916	Richard K. Morgan
917	Leo Lionni
918	Miles  Cameron
919	Janice Y.K. Lee
920	E.M. Forster
921	Richard Yates
922	David Auburn
923	Edith Pattou
924	Arthur Nersesian
925	Richard Adams
926	Susan Sontag
927	Josephine Tey
928	Henry James
929	Joseph Kesselring
930	Charles Dickens
931	Ben Aaronovitch
932	Roddy Doyle
933	Michael Thomas Ford
934	Clare Vanderpool
935	Hillary Jordan
936	Amanda Coplin
937	Markus Zusak
938	Alice Hoffman
939	Andrew  Smith
940	Christopher Isherwood
941	Patricia Gaffney
942	Michael J. Sullivan
943	Max Barry
944	Maureen Johnson
945	David Wiesner
946	Michel Houellebecq
947	Douglas Coupland
948	Gary Shteyngart
949	David Guterson
950	Lucie Whitehouse
951	Kristin Levine
952	Alwyn Hamilton
953	Susan Ee
954	Jennifer A. Nielsen
955	Dan Brown
956	Lalita Tademy
957	Joanna Trollope
958	Cristin Terrill
959	Arthur C. Clarke
960	Colleen Hoover
961	Michael Punke
962	C.S. Lewis
963	Ellen DeGeneres
964	Debbie Macomber
965	Ian Falconer
966	Erin Hunter
967	Adolf Hitler
968	Dorothy Koomson
969	Phil Klay
970	David  Brooks
971	Dian Fossey
972	Isabel Wolff
973	S.A. Bodeen
974	Diablo Cody
975	Lisa Kleypas
976	Michael Ondaatje
977	Karen Harper
978	Cate Tiernan
979	Rachel Vincent
980	D.B.C. Pierre
981	Michael J. Fox
982	Emmy Laybourne
983	Jasper Fforde
984	John Scalzi
985	Cathy Glass
986	Jenny Offill
987	Patti Smith
988	Anita Brookner
989	Sylvia Plath
990	Sebastian Barry
991	Deanna Raybourn
992	Jane Hamilton
993	John Hodgman
994	Cat Patrick
995	Julie James
996	Jeff Lindsay
997	Beatriz Williams
998	Timothy Zahn
999	Michael A. Singer
1000	Stephen Davis
1001	Pramoedya Ananta Toer
1002	John Jakes
1003	Stephen Coonts
1004	Ron Rash
1005	R.L. Mathewson
1006	Robert Muchamore
1007	Tara Sivec
1008	Jason Mott
1009	Patricia McCormick
1010	Ellen Marie Wiseman
1011	Chris Bohjalian
1012	Jami Attenberg
1013	Sarah Dunant
1014	Rene Denfeld
1015	Peter Jenkins
1016	Beverly Cleary
1017	Morgan Matson
1018	Brenna Yovanoff
1019	Stephanie Kallos
1020	Virginia Lee Burton
1021	Anna Carey
1022	Corban Addison
1023	Nathan Filer
1024	Paul  Hoffman
1025	Matthew  Thomas
1026	Orhan Pamuk
1027	Thomas Rockwell
1028	Melvin Burgess
1029	Sheri Reynolds
1030	Gary Brandner
1031	Brent Weeks
1032	Mark Bowden
1033	J. Sheridan Le Fanu
1034	Charlie N. Holmberg
1035	Donna Leon
1036	Friedrich A. Hayek
1037	Geraldine Brooks
1038	Sara Raasch
1039	Tahereh Mafi
1040	Anthony Hope
1041	Aprilynne Pike
1042	Helen Keller
1043	Kate Atkinson
1044	Stephen Fry
1045	Alison Croggon
1046	Dorothy Allison
1047	C.J. Box
1048	Blake Crouch
1049	Bob Spitz
1050	Katie Cotugno
1051	Jack Higgins
1052	Peggy Rathmann
1053	Paul Beatty
1054	Kim Stanley Robinson
1055	Margaret Peterson Haddix
1056	Cecelia Ahern
1057	Kathleen Winsor
1058	Jeff VanderMeer
1059	Lee Strobel
1060	Tere Liye
1061	Jerry Spinelli
1062	Sebastian Faulks
1063	Mo Willems
1064	Alison Goodman
1065	Peter  Swanson
1066	Kazu Kibuishi
1067	Stephanie Bond
1068	Neil Simon
1069	Joe Hill
1070	Lee Child
1071	Jo Baker
1072	S.E. Hinton
1073	Eleanor Brown
1074	Winston Groom
1075	Sarah Jio
1076	Denis Johnson
1077	Brian  McClellan
1078	James Herbert
1079	Homer Hickam
1080	Linda Sue Park
1081	Matthew      Lewis
1082	Poppy Z. Brite
1083	Frederik Pohl
1084	Kimberly Derting
1085	Angie Sage
1086	Richard Brautigan
1087	Thomas A. Harris
1088	Jason F. Wright
1089	Kate Jacobs
1090	Anne Tyler
1091	Joe Abercrombie
1092	Ann Cleeves
1093	Kristen Simmons
1094	J. Courtney Sullivan
1095	Joseph Wambaugh
1096	George Carlin
1097	Jonathan Tropper
1098	Jane Yolen
1099	Tracy Letts
1100	Dietrich Bonhoeffer
1101	Jude Watson
1102	Daphne du Maurier
1103	Jon Krakauer
1104	Judith Kerr
1105	Rae Carson
1106	A.S. King
1107	Chris Pavone
1108	Julie Otsuka
1109	Malcolm Gladwell
1110	Victoria Jamieson
1111	Chaim Potok
1112	Tomie dePaola
1113	Richard   Preston
1114	Paul Bowles
1115	Jeannette Walls
1116	S.M. Stirling
1117	Lesley Livingston
1118	April Henry
1119	Robin McKinley
1120	Ozzy Osbourne
1121	Tamara Ireland Stone
1122	Brad Meltzer
1123	Sue Miller
1124	Stephanie Garber
1125	Richard Dawkins
1126	John Galsworthy
1127	F. Scott Fitzgerald
1128	J.P. Delaney
1129	Erin Morgenstern
1130	Melanie Gideon
1131	Lynne Truss
1132	Ralph Ellison
1133	Lisa Gardner
1134	Meredith Wild
1135	Julian Barnes
1136	John Rawls
1137	Cynthia Lord
1138	Scott Lynch
1139	Anna Godbersen
1140	Zane
1141	Elisabeth Naughton
1142	Kendare Blake
1143	Tabitha Suzuma
1144	Elisabeth Egan
1145	Kiersten White
1146	Michelle Richmond
1147	E.L. James
1148	Kristen Ashley
1149	Jacqueline Winspear
1150	Miranda July
1151	Carol Lynch Williams
1152	Allen Say
1153	Barry Lyga
1154	David Weber
1155	Alan Paton
1156	Jennifer Echols
1157	Jay Asher
1158	Jane Green
1159	Anna Todd
1160	Ashwin Sanghi
1161	Chloe Neill
1162	Jack London
1163	Jeanne DuPrau
1164	Amanda Brown
1165	David Small
1166	Ian McGuire
1167	Jerry Pinkney
1168	Curtis Sittenfeld
1169	Kathy Reichs
1170	Knut Hamsun
1171	Anthony Horowitz
1172	David Mitchell
1173	Courtney Milan
1174	Alex Kava
1175	Russell Brand
1176	Wally Lamb
1177	Patrick O'Brian
1178	Jeffery Deaver
1179	Thomas Wolfe
1180	Luke Rhinehart
1181	Maggie Shipstead
1182	Brodi Ashton
1183	Paul Theroux
1184	Rachel Hawkins
1185	Alain de Botton
1186	Emily St. John Mandel
1187	Derek Landy
1188	Vernor Vinge
1189	Ann Patchett
1190	Hilary Mantel
1191	Tim Tharp
1192	James S.A. Corey
1193	Madeline Miller
1194	Dan Chaon
1195	Karina Halle
1196	David Benioff
1197	Walt Whitman
1198	Kass Morgan
1199	Robert   Harris
1200	J.M. Barrie
1201	Lauren Oliver
1202	Connor Franta
1203	William R. Forstchen
1204	Rick Riordan
1205	Mercedes Lackey
1206	Don Winslow
1207	James Agee
1208	Carol Shields
1209	Leon Uris
1210	Alex Haley
1211	Scott Anderson
1212	Tamora Pierce
1213	Elyn R. Saks
1214	Deeanne Gist
1215	Sam Harris
1216	Maria Dahvana Headley
1217	Robert Ludlum
1218	John Patrick Shanley
1219	Martin Amis
1220	Philipp Meyer
1221	Dennis Lehane
1222	Justina Chen
1223	Richard Condon
1224	Cornelius Ryan
1225	Amy Plum
1226	Carrie Jones
1227	William  Kennedy
1228	Philip Yancey
1229	Mark Kurlansky
1230	John Howard Griffin
1231	Charlaine Harris
1232	Shel Silverstein
1233	Alan Bennett
1234	Nina LaCour
1235	John  Williams
1236	Frank De Felitta
1237	Peter Watts
1238	Amy Tintera
1239	Glen Duncan
1240	Amor Towles
1241	Jacqueline Woodson
1242	David Almond
1243	Marieke Nijkamp
1244	Judy Schachner
1245	Jenny Han
1246	Erich Segal
1247	Loretta Chase
1248	Malorie Blackman
1249	Scott  Meyer
1250	Anthony  Ryan
1251	Kathleen Tessaro
1252	Laura Whitcomb
1253	Graham Swift
1254	Kate Mosse
1255	Laura Hillenbrand
1256	John Lanchester
1257	Bill Clegg
1258	Robert Cormier
1259	Seanan McGuire
1260	W. Bruce Cameron
1261	Alexander Gordon Smith
1262	Paul Murray
1263	Elle Kennedy
1264	George R. Stewart
1265	Hugh Laurie
1266	Megan Abbott
1267	Erich Maria Remarque
1268	Isabel Allende
1269	Tad Williams
1270	Jacqueline Sheehan
1271	Oliver Sacks
1272	Dashiell Hammett
1273	K.A. Tucker
1274	Rupi Kaur
1275	Sharon Creech
1276	Lloyd C. Douglas
1277	John Katzenbach
1278	Theodore Taylor
1279	David Sedaris
1280	David Farland
1281	Kathleen Grissom
1282	Alex Gino
1283	Steve Alten
1284	Julia Scheeres
1285	A. Manette Ansay
1286	E.L. Doctorow
1287	Kate Hamer
1288	Kaye Gibbons
1289	L.E. Modesitt Jr.
1290	John Piper
1291	Tennessee Williams
1292	Elizabeth Little
1293	Jon Klassen
1294	Cornelia Funke
1295	Jennifer Crusie
1296	Emma Donoghue
1297	R.L. Stine
1298	Beatrix Potter
1299	Christos Tsiolkas
1300	Yangsze Choo
1301	Edward Bloor
1302	Carlos Castaneda
1303	Debra Dean
1304	Susane Colasanti
1305	Kahlil Gibran
1306	Don Richardson
1307	Robert A. Heinlein
1308	Barbara Kingsolver
1309	Kevin    Wilson
1310	Lincoln Peirce
1311	Jan Brett
1312	Nicola Yoon
1313	Peter H. Reynolds
1314	Banksy
1315	Philip Reeve
1316	Suzanne Collins
1317	Anna Banks
1318	Stephenie Meyer
1319	Chris Van Allsburg
1320	John Keegan
1321	Joseph Boyden
1322	John Irving
1323	Jean M. Auel
1324	Brady Udall
1325	Mary Hoffman
1326	Juliet Marillier
1327	Grant Morrison
1328	Jennifer Donnelly
1329	Alice McDermott
1330	Graeme Base
1331	Douglas Preston
1332	E.H. Gombrich
1333	Peter F. Hamilton
1334	Sarah Weeks
1335	Elizabeth Flock
1336	Mhairi McFarlane
1337	Jeff Wheeler
1338	Chuck Palahniuk
1339	Kurt Cobain
1340	Connie Willis
1341	James  Jones
1342	James Dashner
1343	Joanne Harris
1344	Deborah Harkness
1345	Gigi Levangie Grazer
1346	Jean Ferris
1347	Charles Burns
1348	Elin Hilderbrand
1349	Andrea Hirata
1350	Steve Martini
1351	John Verdon
1352	Josh Malerman
1353	Heather Gudenkauf
1354	Lisa Jewell
1355	Erika Swyler
1356	J. Kenner
1357	Philippa Gregory
1358	Jay Anson
1359	Nic Pizzolatto
1360	Nelson DeMille
1361	Melina Marchetta
1362	Thanhha Lai
1363	Amelia Atwater-Rhodes
1364	Mark Haddon
1365	MaryJanice Davidson
1366	Katherine Addison
1367	Martin Cruz Smith
1368	Sara Zarr
1369	Lisa Lutz
1370	Jessica Knoll
1371	Robert Jordan
1372	Kwame Alexander
1373	Lynn Flewelling
1374	Marisa de los Santos
1375	Catherine Ryan Hyde
1376	N.K. Jemisin
1377	Jack Ketchum
1378	F. Paul Wilson
1379	Ron Chernow
1380	Richard   Phillips
1381	Terry Pratchett
1382	Daniel H. Wilson
1383	Enid Blyton
1384	Anna Maxted
1385	Kelly Corrigan
1386	Robert Goolrick
1387	Colum McCann
1388	Joyce Carol Oates
1389	Nick Cave
1390	Jeaniene Frost
1391	Gary Jennings
1392	Larissa Ione
1393	Alice Munro
1394	Richard Bach
1395	Jean de Brunhoff
1396	Greg Bear
1397	Sarah Pinborough
1398	Edward P. Jones
1399	Dave Eggers
1400	G. Willow Wilson
1401	Laurent Binet
1402	Jonathan Harr
1403	J.D. Salinger
1404	L.J. Smith
1405	Jennifer Close
1406	L.M. Montgomery
1407	Suzanne Young
1408	Laurelin Paige
1409	Sara Shepard
1410	Brian Staveley
1411	Frank E. Peretti
1412	Martha Hall Kelly
1413	Nicole Krauss
1414	Susan Mallery
1415	Charlotte Rogan
1416	Robert Bloch
1417	Neal Shusterman
1418	Clive Barker
1419	M.M. Kaye
1420	Andrea Cremer
1421	Linda Castillo
1422	Danielle L. Jensen
1423	Cheryl Rainfield
1424	Kody Keplinger
1425	Tami Hoag
1426	Anthony Burgess
1427	Jenny  Lawson
1428	Danielle  Paige
1429	Irwin Shaw
1430	George R.R. Martin
1431	Jean Kwok
1432	Gabrielle Zevin
1433	Catherine Bybee
1434	Tom Stoppard
1435	Elizabeth Wein
1436	Ilsa J. Bick
1437	Cormac McCarthy
1438	Anna Quindlen
1439	Guy Delisle
1440	B.A. Shapiro
1441	Becca Fitzpatrick
1442	H.A. Rey
1443	Thea Harrison
1444	Ben Hatke
1445	Esi Edugyan
1446	Iris Johansen
1447	Stephen E. Ambrose
1448	Jamie Oliver
1449	Ben Okri
1450	Anne Rice
1451	Jon J. Muth
1452	Rodman Philbrick
1453	Jonah Lehrer
1454	Jacqueline Carey
1455	Agatha Christie
1456	Cammie McGovern
1457	Jeff Kinney
1458	John Marsden
1459	John Berger
1460	Eva Ibbotson
1461	Anne Morrow Lindbergh
1462	Tara Conklin
1463	Eckhart Tolle
1464	Peter V. Brett
1465	Susan Elizabeth Phillips
1466	Lauren Kate
1467	Janne Teller
1468	Eric Hill
1469	Susan Beth Pfeffer
1470	Gennifer Albin
1471	Sarah Dessen
1472	William Gibson
1473	Alex Berenson
1474	Mitchell Zuckoff
1475	Norman Bridwell
1476	Iain Banks
1477	Nancy Garden
1478	K.R. Dwyer
1479	Lisa See
1480	P.G. Wodehouse
1481	Kate Alcott
1482	Ezra Jack Keats
1483	Joshilyn Jackson
1484	Jana Deleon
1485	James Hilton
1486	Richard Peck
1487	Dan Abnett
1488	Cecily von Ziegesar
1489	Beth Moore
1490	Pat Barker
1491	Katharine Graham
1492	Kiran Desai
1493	David Herbert Donald
1494	Tessa Dare
1495	Gene Wolfe
1496	Lisa O'Donnell
1497	Brit Bennett
1498	Will Durant
1499	Katie Ashley
1500	Audrey Niffenegger
1501	Melissa Senate
1502	Hanif Kureishi
1503	Maya Banks
1504	Daisy Goodwin
1505	Heinrich Harrer
1506	Bill Clinton
1507	Herman Koch
1508	Laline Paull
1509	Adam Gopnik
1510	Louise Erdrich
1511	Daniel Silva
1512	Diane Setterfield
1513	Paula Hawkins
1514	John Saul
1515	P.C. Cast
1516	R.C. Sproul
1517	Rosalind Miles
1518	Jeff Shaara
1519	Tucker Max
1520	Laura Moriarty
1521	Maggie Nelson
1522	James Lee Burke
1523	Plum Sykes
1524	James McBride
1525	Anna Dewdney
1526	Sinclair Lewis
1527	Sherwood Smith
1528	Billie Letts
1529	Judith Krantz
1530	Armistead Maupin
1531	Adam Gidwitz
1532	Rachel Joyce
1533	Roland Merullo
1534	Terry Goodkind
1535	Janet Fitch
1536	Carrie Ryan
1537	Albert Camus
1538	Pierce Brown
1539	Frank Beddor
1540	Wendelin Van Draanen
1541	Lara Adrian
1542	Anne Rivers Siddons
1543	Robert Lopshire
1544	Deborah Ellis
1545	Amanda Hocking
1546	Voltaire
1547	Shaun Tan
1548	Sandra Boynton
1549	Peach-Pit
1550	Kresley Cole
1551	Ted Dekker
1552	Robert Graysmith
1553	Keri Smith
1554	G.A. Aiken
1555	Adam Johnson
1556	Amy Tan
1557	William Goldman
1558	Nick Cutter
1559	Fiona Barton
1560	Jennifer Rush
1561	Mary Higgins Clark
1562	Barbara Cooney
1563	Raymond Khoury
1564	Jeffrey Brown
1565	Anna Kendrick
1566	Jean Rhys
1567	Lynsay Sands
1568	Laura Dave
1569	Jack Finney
1570	Corrie ten Boom
1571	Margaret Edson
1572	Andrew Clements
1573	Dalton Trumbo
1574	Jill Alexander Essbaum
1575	Omar Tyree
1576	Alfred Uhry
1577	James M. Cain
1578	Zilpha Keatley Snyder
1579	Miriam Toews
1580	A.G. Howard
1581	William Shakespeare
1582	Betty Crocker
1583	Mindy Kaling
1584	Joyce Maynard
1585	Michelle Magorian
1586	Joe McGinniss
1587	Jean-Paul Sartre
1588	Flora Rheta Schreiber
1589	Carol Ryrie Brink
1590	Orson Scott Card
1591	Brandon Sanderson
1592	John O'Hara
1593	Gwyn Hyman Rubio
1594	Janet Evanovich
1595	Tom Wolfe
1596	Cherie Priest
1597	Meg Cabot
1598	John Grisham
1599	Mike Lupica
1600	Angela Flournoy
1601	Moira Young
1602	Victoria Hislop
1603	Peter Clines
1604	Claudia Gray
1605	Chuck Wendig
1606	Anita Amirrezvani
1607	Sam Smith
1608	Thomas Pynchon
1609	Veronica Roth
1610	Meg Wolitzer
1611	Betty  Smith
1612	Sylvia Day
1613	Adriana Trigiani
1614	Martha Stout
1615	William Peter Blatty
1616	Leigh Nichols
1617	Ruth Ozeki
1618	Catherine Gilbert Murdock
1619	Lloyd Jones
1620	Leigh Bardugo
1621	Amy Poehler
1622	Daniel Glattauer
1623	Catherine Coulter
1624	Jojo Moyes
1625	Danielle Steel
1626	Timur Vermes
1627	J.A. Redmerski
1628	Lucinda Riley
1629	Jamie McGuire
1630	James Surowiecki
1631	Charlie Higson
1632	Sharon G. Flake
1633	Jon Ronson
1634	Jenny Nimmo
1635	David Eddings
1636	Machado de Assis
1637	Raymond E. Feist
1638	Matt Haig
1639	Lauren Weisberger
1640	Sarah Vowell
1641	Edward Said
1642	Paul Auster
1643	Steven Hall
1644	Emily Murdoch
1645	Cynthia D'Aprix Sweeney
1646	Heather Brewer
1647	Raymond Carver
1648	Carrie Fisher
1649	Sarah Simblet
1650	Douglas Adams
1651	Charles Stross
1652	Leslie Feinberg
1653	Bill Buford
1654	Caleb Carr
1655	Ann Brashares
1656	Scott B. Smith
1657	Tony Parsons
1658	Sarah Winman
1659	David James Duncan
1660	Ildefonso Falcones
1661	J.M. Coetzee
1662	Zadie Smith
1663	Ann-Marie MacDonald
1664	John Knowles
1665	Greg Iles
1666	Amy Efaw
1667	Mircea Eliade
1668	Harry Harrison
1669	Aleatha Romig
1670	Aldo Leopold
1671	Hillary Rodham Clinton
1672	Dee Henderson
1673	Sarah Rees Brennan
1674	Richard Kadrey
1675	Richard Ford
1676	Ulrich Bischoff
1677	John Fowles
1678	Theodore Sturgeon
1679	Shelly Crane
1680	B.J. Novak
1681	Jaci Burton
1682	Eleanor H. Porter
1683	P.D. James
1684	Maya Angelou
1685	George Saunders
1686	Annie Dillard
1687	N.H. Kleinbaum
1688	Ayn Rand
1689	Matthew Reilly
1690	Diana Wynne Jones
1691	Judith Guest
1692	Tom Rachman
1693	Yaa Gyasi
1694	Jo Walton
1695	Terry Hayes
1696	Peter Benchley
1697	Mike Mignola
1698	Cora Carmack
1699	Jacqueline Davies
1700	Laura Lippman
1701	Rainbow Rowell
1702	Eric Carle
1703	Ben H. Winters
1704	Peter Matthiessen
1705	Jonathan Swift
1706	Rashmi Bansal
1707	Gwen Hayes
1708	Ernest Cline
1709	Ann Leckie
1710	Sebastian Junger
1711	Carlos Fuentes
1712	W. Somerset Maugham
1713	Julie Buxbaum
1714	D.J. MacHale
1715	Irving Shulman
1716	James Frey
1717	Len Deighton
1718	Alexandra Adornetto
1719	Arnold Lobel
1720	Joel Fuhrman
1721	James A. Michener
1722	Laini Taylor
1723	Tatiana de Rosnay
1724	Teju Cole
1725	Marguerite Henry
1726	Robin Norwood
1727	C.J. Redwine
1728	T.C. Boyle
1729	Randall Wallace
1730	Miranda Kenneally
1731	Jeanette Winterson
1732	Amy A. Bartol
1733	Bree Despain
1734	Rudyard Kipling
1735	Lisa McMann
1736	Michael Scott
1737	Ian Fleming
1738	Charles Frazier
1739	Walter Mosley
1740	John Updike
1741	Anne Rampling
1742	C.J. Sansom
1743	Kelley Armstrong
1744	Ayaan Hirsi Ali
1745	Margaret Leroy
1746	Joseph O'Neill
1747	Jenna Blum
1748	Bryce Courtenay
1749	Richard Siken
1750	Dan Wells
1751	Mike Mullin
1752	Tom Rath
1753	Arthur Ransome
1754	Robert McCammon
1755	Nancy Horan
1756	John Flanagan
1757	Anchee Min
1758	Noah Hawley
1759	Shirley Jackson
1760	Philip Roth
1761	Sandra Brown
1762	Penelope Ward
1763	Andrew Davidson
1764	Ally Carter
1765	Sylvain Neuvel
1766	Nickolas Butler
1767	Cynthia J. McGean
1768	Kay Thompson
1769	Sylvain Reynard
1770	Donna Woolfolk Cross
1771	Amy Harmon
1772	CLAMP
1773	Erik Larson
1774	Dean Koontz
1775	Louis Sachar
1776	Vera Brosgol
1777	Tony Hawks
1778	Karen Chance
1779	Mary Doria Russell
1780	Joanna Wylde
1781	M.O. Walsh
1782	Lisa Genova
1783	Arthur Hailey
1784	Stephen Hunter
1785	Louise L. Hay
1786	Tawni O'Dell
1787	Gary Paulsen
1788	Lawrence Hill
1789	Sophie Kinsella
1790	Gene Luen Yang
1791	Susanna Kearsley
1792	Melinda Haynes
1793	Peter Shaffer
1794	Raymond Chandler
1795	Nathan  Hill
1796	A.C. Gaughen
1797	J.R. Ward
1798	Richelle Mead
1799	Rebecca Stead
1800	Katy Evans
1801	David McCullough
1802	Edgar Allan Poe
1803	Ludwig Bemelmans
1804	Ann Aguirre
1805	Melissa de la Cruz
1806	Michelle Moran
1807	Kylie Scott
1808	Ellen Raskin
1809	Cynthia Swanson
1810	Caroline Knapp
1811	Jennifer Egan
1812	Trudi Canavan
1813	Jane Shemilt
1814	Philip K. Dick
1815	Elizabeth Norris
1816	James Grady
1817	Jennifer Lynn Barnes
1818	Rebecca Donovan
1819	Mary  Stewart
1820	Karen Marie Moning
1821	Neil Strauss
1822	Mario Puzo
1823	Keri Arthur
1824	Bret Lott
1825	Ursula K. Le Guin
1826	Scott Turow
1827	Sarah Crossan
1828	Brandon Mull
1829	H.M. Ward
1830	Jennifer McMahon
1831	Ann Leary
1832	Donna VanLiere
1833	David Ebershoff
1834	Karin Slaughter
1835	Alex Flinn
1836	Ned Vizzini
1837	Daniel Keyes
1838	Sophie Jordan
1839	Kady Cross
1840	Ramit Sethi
1841	Chelsea Fine
1842	Michael Crichton
1843	Hannah Kent
1844	Edward Gorey
1845	Owen  West
1846	Kristen Britain
1847	David Baldacci
1848	Brunonia Barry
1849	David Gemmell
1850	Robert Frost
1851	James Alexander Thom
1852	Melissa Marr
1853	Tori Spelling
1854	Abbi Glines
1855	J.R.R. Tolkien
1856	Ellis Peters
1857	Wiley Cash
1858	Grant Naylor
1859	Thomas Harris
1860	W.G. Sebald
1861	Janell Cannon
1862	Amy Bloom
1863	Justin Cronin
1864	Paul Zindel
1865	H. Rider Haggard
1866	Nevil Shute
1867	Uwem Akpan
1868	Frederick Forsyth
1869	Sharon Kay Penman
1870	Carrie Vaughn
1871	Anne Michaels
1872	Syd Hoff
1873	Angela Johnson
1874	Glen Cook
1875	Dave Barry
1876	V.C. Andrews
1877	Alice Sebold
1878	Francine Rivers
1879	Olivia Goldsmith
1880	Patricia Cornwell
1881	Ha Jin
\.


--
-- Data for Name: book_information; Type: TABLE DATA; Schema: public; Owner: weirdjs
--

COPY public.book_information (book_id, title, author, coauthor, isbn, publish_year) FROM stdin;
1	Krondor: The Betrayal	Raymond E. Feist	\N	380795272	1998
2	The Dark Is Rising	Susan Cooper	\N	1416949658	1973
3	The Black Unicorn 	Terry Brooks	\N	1857231082	1987
4	I, Robot	Isaac Asimov	\N	553803700	1950
5	Four Blondes	Candace Bushnell	\N	080213825X	2000
6	Love, Stargirl	Jerry Spinelli	\N	375913750	2007
7	The Tenth Circle	Jodi Picoult	\N	074349671X	2006
8	Vanishing Acts	Jodi Picoult	\N	743454553	2005
9	Aztec	Gary Jennings	\N	765317508	1980
10	Marlfox	Brian Jacques	\N	142501085	1998
11	Lady Midnight	Cassandra Clare	\N	1442468351	2016
12	The Secret Keeper	Kate Morton	\N	1439152802	2012
13	The Afghan	Frederick Forsyth	\N	399153942	2006
14	A Touch of Dead	Charlaine Harris	\N	441017835	2009
15	Daja's Book	Tamora Pierce	\N	590554107	1998
16	Steve Jobs	Walter Isaacson	\N	1451648537	2011
17	Cold Fire	Tamora Pierce	\N	590396560	2002
18	Thanks for the Memories	Cecelia Ahern	\N	000723368X	2008
19	Bitterblue	Kristin Cashore	\N	803734735	2012
20	Daisy Miller	Henry James	\N	1592243002	1878
21	The Brothers K	David James Duncan	\N	055337849X	1992
22	The Pact	Jodi Picoult	\N	61150142	1998
23	Plum Spooky	Janet Evanovich	\N	739328271	2009
24	Twice Tempted 	Jeaniene Frost	\N	62076108	2013
25	Legend	Marie Lu	\N	039925675X	2011
26	Thr3e	Ted Dekker	\N	1595543414	2003
27	The Lion's Game	Nelson DeMille	\N	446679097	2000
28	The Rainmaker	John Grisham	\N	385339607	1995
29	Eleanor & Park	Rainbow Rowell	\N	1250012570	2013
30	The Lightning Thief	Rick Riordan	\N	786838655	2005
31	The Final Detail	Harlan Coben	\N	440225450	1999
32	A Cry in the Night	Mary Higgins Clark	\N	743484355	1982
33	Half Bad	Sally Green	\N	670016780	2014
34	Lady Windermere's Fan	Oscar Wilde	\N	140621733	1893
35	The Awakening	Kelley Armstrong	\N	61662763	2009
36	Ham on Rye	Charles Bukowski	\N	006117758X	1982
37	The Van Alen Legacy 	Melissa de la Cruz	\N	1423102266	2009
38	A Pocket for Corduroy	Don Freeman	\N	067056172X	1978
39	The Street Lawyer	John Grisham	\N	385339097	1998
40	Revolutionary Road	Richard Yates	\N	413757102	1961
41	Neuromancer	William Gibson	\N	441569595	1984
42	Catch-22	Joseph Heller	\N	684833395	1961
43	sTORI Telling	Tori Spelling	\N	1416950737	2008
44	The Snowy Day	Ezra Jack Keats	\N	140501827	1962
45	Invisible Monsters	Chuck Palahniuk	\N	99285444	1999
46	Noughts & Crosses	Malorie Blackman	\N	552555703	2001
47	Separation of Power	Vince Flynn	\N	671047345	2001
48	The Weight of Blood	Laura McHugh	\N	812995201	2014
49	Lincoln in the Bardo	George Saunders	\N	812995341	2017
50	Kiss of Midnight	Lara Adrian	\N	553589377	2007
51	Did You Ever Have a Family	Bill Clegg	\N	1476798176	2015
52	The Tiger Who Came to Tea	Judith Kerr	\N	6640613	1968
53	Tuesday	David Wiesner	\N	395870828	1991
54	My Man Jeeves	P.G. Wodehouse	\N	1585678759	1919
55	Hit List	Laurell K. Hamilton	\N	425241130	2011
56	Cabal	Clive Barker	\N	743417321	1988
57	The Sea Wolf	Jack London	\N	1598184318	1904
58	One Good Dog	Susan  Wilson	\N	312571259	2010
59	A Knight of the Word 	Terry Brooks	\N	345424646	1998
60	The Lonely Polygamist	Brady Udall	\N	393062627	2010
61	Born at Midnight	C.C. Hunter	\N	312624670	2011
62	Lover Reborn	J.R. Ward	\N	451235843	2012
63	The Plot Against America	Philip Roth	\N	1400079497	2004
64	I Am Legend 	Richard Matheson	\N	1857988094	1954
65	Hex Hall	Rachel Hawkins	\N	1423121309	2010
66	It	Stephen King	\N	451169514	1986
67	The Player of Games	Iain M. Banks	\N	61053562	1988
68	The Waves	Virginia Woolf	\N	156949601	1931
69	The Angel Experiment	James Patterson	\N	446617792	2005
70	Teen Idol	Meg Cabot	\N	60096187	2004
71	Armageddon's Children	Terry Brooks	\N	345484088	2006
72	Legend 	David Gemmell	\N	345379063	1984
73	The Thief	Megan Whalen Turner	\N	60824972	1996
74	Welcome to Temptation	Jennifer Crusie	\N	312932804	1996
75	The Gods Themselves	Isaac Asimov	\N	1857989341	1972
76	Bullet	Laurell K. Hamilton	\N	425234339	2010
77	A Dog's Purpose 	W. Bruce Cameron	\N	765326264	2010
78	The Devil You Know	Mike Carey	\N	446580309	2006
79	number9dream	David Mitchell	\N	812966929	2001
80	A Week to Be Wicked	Tessa Dare	\N	62049879	2012
81	A Place Called Here	Cecelia Ahern	\N	7198914	2006
82	Master and Commander	Patrick O'Brian	\N	393307050	1969
83	The Six Wives of Henry VIII	Alison Weir	\N	802136834	1980
84	Industrial Magic	Kelley Armstrong	\N	553590162	2004
85	The Will of the Empress	Tamora Pierce	\N	439441722	2005
86	Violets Are Blue	James Patterson	\N	446611212	2001
87	Men at Arms	Terry Pratchett	\N	61092193	1993
88	The Power of One	Bryce Courtenay	\N	034541005X	1989
89	A Discovery of Witches	Deborah Harkness	\N	670022411	2011
90	Free Will	Sam Harris	\N	1451683405	2012
91	Faithless	Karin Slaughter	\N	440242916	2005
92	Three Wishes	Liane Moriarty	\N	60586133	2003
93	Fatherland	Robert   Harris	\N	61006629	1992
94	Never Love a Highlander	Maya Banks	\N	345519515	2011
95	Altered	Jennifer Rush	\N	316197084	2013
96	Fractured	Karin Slaughter	\N	385341954	2008
97	The Charlemagne Pursuit	Steve Berry	\N	345485793	2008
98	I'll Be Seeing You	Mary Higgins Clark	\N	671888587	1993
99	Wench	Dolen Perkins-Valdez	\N	006170654X	2009
100	Red Mars	Kim Stanley Robinson	\N	553560735	1993
101	The 100	Kass Morgan	\N	316234478	2013
102	The Mark of Athena	Rick Riordan	\N	1423140605	2012
103	Her Fearful Symmetry	Audrey Niffenegger	\N	224085611	2009
104	Vicious	V.E. Schwab	 Victoria Schwab	765335344	2013
105	Bad Girls Don't Die	Katie Alender	\N	1423108760	2009
106	Pebble in the Sky	Isaac Asimov	\N	553293427	1950
107	Safe Harbour	Danielle Steel	\N	739437585	2003
108	Lincoln	David Herbert Donald	\N	068482535X	1995
109	The Titan's Curse	Rick Riordan	\N	141382899	2007
110	Tropic of Capricorn	Henry Miller	\N	802151825	1938
111	The Bluest Eye	Toni Morrison	\N	452287065	1970
112	Wife 22	Melanie Gideon	\N	034552795X	2008
113	Frog and Toad Together	Arnold Lobel	\N	069401298X	1971
114	The Lacuna	Barbara Kingsolver	\N	60852577	2009
115	Slapstick	Kurt Vonnegut Jr.	\N	385334230	1976
116	Fearless Fourteen	Janet Evanovich	\N	312349513	2008
117	A Christmas Carol	Charles Dickens	\N	1561797464	1843
118	Straight Talking	Jane Green	\N	767915593	1997
119	Never Let Me Go	Kazuo Ishiguro	\N	1400078776	2005
120	Ice Station Zebra	Alistair MacLean	\N	6161413	1963
121	The Edible Woman	Margaret Atwood	\N	385491069	1969
122	The English Assassin	Daniel Silva	\N	451208188	2002
123	Born of the Night	Sherrilyn Kenyon	\N	312942303	1996
124	Two Ravens and One Crow	Kevin Hearne	\N	385366434	2012
125	Nicholas and Alexandra	Robert K. Massie	\N	345438310	1967
126	A Grief Observed	C.S. Lewis	\N	60652381	1961
127	Right Ho, Jeeves	P.G. Wodehouse	\N	140690483X	1934
128	Mr. Perfect	Linda Howard	\N	743482883	2000
129	Moonrise	Erin Hunter	\N	60744545	2005
130	Moon Over Manifest	Clare Vanderpool	\N	385907508	2010
131	MaddAddam	Margaret Atwood	\N	385528787	2013
132	The Good Guy	Dean Koontz	\N	553804812	1989
133	Shoe Addicts Anonymous 	Beth Harbison	\N	312364687	2007
134	The Gift	Julie Garwood	\N	671702505	1991
135	Winter's Bone	Daniel Woodrell	\N	031605755X	2006
136	A Death in the Family	James Agee	\N	375701230	1957
137	The Firm	John Grisham	\N	582418275	1991
138	Antigone	Jean Anouilh	\N	041330860X	1944
139	Spook Country	William Gibson	\N	399154302	2007
140	Esio Trot	Roald Dahl	 Quentin Blake	224064924	1990
141	The Lady Elizabeth	Alison Weir	\N	345495357	2008
142	One Crazy Summer	Rita Williams-Garcia	\N	60760885	2010
143	Teardrop	Lauren Kate	\N	375990690	2013
144	Fahrenheit 451	Ray Bradbury	\N	307347974	1953
145	Independent Study	Joelle Charbonneau	\N	547959206	2014
146	Tell Me Three Things	Julie Buxbaum	\N	553535641	2016
147	The Brutal Telling	Louise Penny	\N	312377037	2009
148	Wyrd Sisters	Terry Pratchett	\N	61020664	1988
149	Little Earthquakes	Jennifer Weiner	\N	1416528636	2004
150	The City of Ember	Jeanne DuPrau	\N	375822747	2003
151	A Gate at the Stairs	Lorrie Moore	\N	375409289	2009
152	The Ugly Truth	Jeff Kinney	\N	810984911	2010
153	Beauty from Pain	Georgia Cates	\N	148234873X	2013
154	Code to Zero	Ken Follett	\N	451216725	2000
155	The Twentieth Wife	Indu Sundaresan	\N	743428188	2002
156	The Big Nowhere	James Ellroy	\N	99366614	1988
157	Beautiful You	Chuck Palahniuk	\N	385538030	2014
158	Dreams of Gods & Monsters	Laini Taylor	\N	316134074	2014
159	Dragonfly in Amber	Diana Gabaldon	\N	385335970	1992
160	Freak the Mighty	Rodman Philbrick	\N	439286069	1993
161	Blue Mars 	Kim Stanley Robinson	\N	553573357	1996
162	The Virgin Suicides	Jeffrey Eugenides	\N	747560595	1993
163	Pandora's Star	Peter F. Hamilton	\N	345461622	2004
164	Cloudstreet	Tim Winton	\N	743234413	1991
165	The Lunatic Cafe	Laurell K. Hamilton	\N	425201376	1996
166	Under the Tuscan Sun	Frances Mayes	\N	767900383	1996
167	Memoirs of a Geisha	Arthur Golden	\N	739326228	1997
168	My Friend Leonard	James Frey	\N	1594481954	2005
169	Calico Joe	John Grisham	\N	385536073	2012
170	Girl of Nightmares	Kendare Blake	\N	765328666	2012
171	Bad Monkey	Carl Hiaasen	\N	307272591	2013
172	High-Rise	J.G. Ballard	\N	871404028	1975
173	The Miniaturist	Jessie Burton	\N	62306812	2014
174	The Last Olympian	Rick Riordan	\N	739380338	2009
175	Trinity: A Novel of Ireland	Leon Uris	\N	60827882	1976
176	Ford County	John Grisham	\N	385532458	2008
177	Flowers for Algernon	Daniel Keyes	\N	156030306	1966
178	Ellen Foster	Kaye Gibbons	\N	375703055	1987
179	The Hollow Hills	Mary  Stewart	\N	60548266	1973
180	Fantasy In Death	J.D. Robb	\N	399156240	2010
181	First Among Equals	Jeffrey Archer	\N	312997124	1983
182	Madeline's Rescue	Ludwig Bemelmans	\N	670447161	1953
183	See Jane Date	Melissa Senate	\N	373250118	2001
184	The Almost Moon	Alice Sebold	\N	316677469	2007
185	Truly Madly Guilty	Liane Moriarty	\N	1250069793	2016
186	Dead Heat	Patricia Briggs	\N	425256758	2015
187	The Obituary Writer	Ann Hood	\N	393346773	2013
188	Parts	Tedd Arnold	\N	140565337	1997
189	The Face	Dean Koontz	\N	553584480	2003
190	At Grave's End	Jeaniene Frost	\N	61583073	2008
191	The Collaborator	Margaret Leroy	\N	1401341705	2011
192	The neon rain	James Lee Burke	\N	753820331	1987
193	Slated	Teri Terry	\N	1408319462	2012
194	Sein und Zeit	Martin Heidegger	\N	60638508	1927
195	Saving Faith	David Baldacci	\N	446608890	1999
196	Jurassic Park	Michael Crichton	\N	030734813X	1990
197	Chrysanthemum	Kevin Henkes	\N	688147321	1991
198	The Emerald Atlas	John  Stephens	\N	375868704	2011
199	Dragon Haven	Robin Hobb	\N	61931411	2010
200	The Charm School	Nelson DeMille	\N	751531189	1988
201	The Glass Castle	Jeannette Walls	\N	074324754X	2005
202	Hogfather	Terry Pratchett	\N	552154288	1996
203	Plateforme	Michel Houellebecq	\N	1400030269	2001
204	The Hellbound Heart	Clive Barker	\N	61002828	1986
205	Zodiac	Neal Stephenson	\N	553573861	1988
206	Redemption Ark	Alastair Reynolds	\N	044101173X	2003
207	Montana Sky	Nora Roberts	\N	425205754	1996
208	Skin Game	Jim Butcher	\N	451464397	2014
209	The Game	Neil Strauss	\N	60554738	2005
210	Dawn 	V.C. Andrews	\N	671670689	1990
211	Our Souls at Night	Kent Haruf	\N	1101875895	2015
212	One Day	David Nicholls	\N	340896965	2009
213	Fire Study	Maria V. Snyder	\N	778325342	2008
214	The Children Act	Ian McEwan	\N	385539703	2014
215	The First Rule	Robert Crais	\N	399156135	2010
216	Remember Me 	Mary Higgins Clark	\N	743484363	1994
217	The Heist	Daniel Silva	\N	006232005X	2014
218	The Struggle	L.J. Smith	\N	006102001X	1991
219	The Sky Is Everywhere	Jandy Nelson	\N	803734956	2010
220	Lawrence in Arabia	Scott Anderson	\N	038553292X	2013
221	Broken Monsters	Lauren Beukes	\N	316216828	2014
222	The Sixth Man	David Baldacci	\N	446573108	2011
223	Tender Is the Night	F. Scott Fitzgerald	\N	068480154X	1933
224	Port Mortuary	Patricia Cornwell	\N	399157212	2010
225	Crush	Nicole  Williams	\N	62267175	2013
226	Thankless in Death 	J.D. Robb	\N	399164421	2013
227	The Poisonwood Bible	Barbara Kingsolver	\N	60786507	1998
228	American on Purpose	Craig Ferguson	\N	61719544	2009
229	Pirate Latitudes	Michael Crichton	\N	61929379	2009
230	Again the Magic 	Lisa Kleypas	\N	380811081	2004
231	The Bone Bed	Patricia Cornwell	\N	399157565	2012
232	Stone Mattress	Margaret Atwood	\N	385539126	2014
233	Ship Breaker	Paolo Bacigalupi	\N	316056219	2010
234	Enchantment	Orson Scott Card	\N	345482409	1999
235	Night of the Living Dummy	R.L. Stine	\N	439568404	1993
236	The Crown Tower	Michael J. Sullivan	\N	031624371X	2013
237	The Lathe of Heaven	Ursula K. Le Guin	\N	60512741	1971
238	Crispin: The Cross of Lead	Avi	\N	786816589	2002
239	California	Edan Lepucki	\N	316250813	2014
240	The Song of Achilles	Madeline Miller	\N	1408816032	2011
241	Dark of the Moon	John Sandford	\N	399154779	2004
242	Eight Hundred Grapes	Laura Dave	\N	1476789258	2015
243	Bad for You	Abbi Glines	\N	1481420763	2014
244	The Black Cat	Edgar Allan Poe	\N	1594561753	1843
245	A Wedding in December	Anita Shreve	\N	316154512	2005
246	The Capture	Kathryn Lasky	\N	439405572	2003
247	The Accident	Linwood Barclay	\N	553807188	2011
248	The Providence of Fire	Brian Staveley	\N	765336413	2015
249	The Sculptor	Scott McCloud	\N	1596435739	2015
250	Dream Chaser	Sherrilyn Kenyon	\N	312938829	2008
251	Finding the Dream	Nora Roberts	\N	515142891	1996
252	Web of Lies	Jennifer Estep	\N	143914799X	2010
253	The Ruby in the Smoke	Philip Pullman	\N	394895894	1985
254	The Martian	Andy Weir	\N	804139024	2012
255	The Light Between Oceans	M.L. Stedman	\N	1451681739	2012
256	Fallen in Love	Lauren Kate	\N	375990674	2012
257	Pursuit of Honor	Vince Flynn	\N	1416595163	2009
258	American Assassin	Vince Flynn	\N	141659518X	2010
259	A Civil Action	Jonathan Harr	\N	679772677	1995
260	Frog Music	Emma Donoghue	\N	031632468X	2014
261	On the Beach	Nevil Shute	\N	1842322761	1957
262	Magician	Raymond E. Feist	\N	586217835	1982
263	The Shining Ones	David Eddings	\N	345388666	1993
264	Skeleton Crew	Stephen King	\N	751504386	1985
265	Skin	Ted Dekker	\N	1595542779	2006
266	Trouble in Mudbug	Jana Deleon	\N	505527847	2009
267	Her Daughter's Dream	Francine Rivers	\N	1414334095	2010
268	Chasing Fire	Nora Roberts	\N	399157441	2011
269	The Magicians	Lev Grossman	\N	670020559	2009
270	Morning, Noon & Night	Sidney Sheldon	\N	446602213	1995
271	Open House	Elizabeth Berg	\N	345435168	2000
272	Last to Die	Tess Gerritsen	\N	345515633	2012
273	Summer Knight	Jim Butcher	\N	451458923	2002
274	David and Goliath	Malcolm Gladwell	\N	316204366	2011
275	As I Lay Dying	William Faulkner	\N	067973225X	1930
276	The Girl in the Steel Corset	Kady Cross	\N	373210337	2011
277	The Romanov Prophecy	Steve Berry	\N	345460065	2004
278	Max 	James Patterson	\N	316002895	2009
279	Sin Undone	Larissa Ione	\N	446556815	2010
280	Moonlight Mile 	Dennis Lehane	\N	61836923	2010
281	Sepulchre	Kate Mosse	\N	752860550	2007
282	Rock Chick Rescue	Kristen Ashley	\N	1849234752	2009
283	Jack & Jill	James Patterson	\N	446692654	1996
284	Fracture Me	Tahereh Mafi	\N	62284835	2013
285	How I Live Now	Meg Rosoff	\N	553376055	2004
286	John Adams	David McCullough	\N	743223136	2001
287	Firefly Lane	Kristin Hannah	\N	312364083	2008
288	Mockingjay	Suzanne Collins	\N	439023513	2010
289	An Offer From a Gentleman	Julia Quinn	\N	380815583	2001
290	Elephants Can Remember	Agatha Christie	\N	425067823	1972
291	Angel	James Patterson	\N	446545244	2011
292	Succubus Blues	Richelle Mead	\N	758216416	2007
293	Necroscope 	Brian Lumley	\N	031285787X	1986
294	Cross Country	James Patterson	\N	316024643	2008
295	The Pearls of Lutra	Brian Jacques	\N	142401447	1996
296	The Broken Window	Jeffery Deaver	\N	1416549978	2008
297	The Truth	Terry Pratchett	\N	413771164	2000
298	Villa Incognito	Tom Robbins	\N	1842431021	2003
299	Not Without My Daughter	Betty Mahmoody	\N	552152161	1987
300	Flash and Bones	Kathy Reichs	\N	1439102414	2011
301	Endlessly	Kiersten White	\N	61985880	2012
302	The Chrysalids	John Wyndham	\N	140013083	1955
303	Rumpelstilzchen	Paul O. Zelinsky	\N	140558640	1986
304	Obsidian	Jennifer L. Armentrout	\N	1620610078	2011
305	The Sound of Gravel	Ruth Wariner	\N	1250077699	2016
306	The Pursuit of Happyness	Chris Gardner	\N	60744871	2006
307	Jailbird	Kurt Vonnegut Jr.	\N	385333900	1979
308	Falling Up	Shel Silverstein	\N	60513098	1996
309	A Walk to Remember	Nicholas Sparks	\N	446693804	1999
310	Clockwork Prince	Cassandra Clare	\N	1416975888	2011
311	The Time Keeper	Mitch Albom	\N	1401322786	2012
312	Childhood's End	Arthur C. Clarke	\N	345347951	1953
313	The Sorceress	Michael Scott	\N	385735294	2009
314	Guards! Guards!	Terry Pratchett	\N	61020648	1989
1473	Silver Bay	Jojo Moyes	\N	340895934	2007
315	The Great and Secret Show	Clive Barker	\N	006093316X	1989
316	Gabriel's Inferno	Sylvain Reynard	\N	1936305623	2011
317	E Is for Evidence	Sue Grafton	\N	312939035	1988
318	Memories of Ice	Steven Erikson	\N	765348802	2001
319	Calculated in Death	J.D. Robb	\N	399158820	2013
320	Catherine, Called Birdy	Karen Cushman	\N	60739428	1994
321	Can Love Happen Twice?	Ravinder Singh	\N	143417231	2011
322	Twenties Girl	Sophie Kinsella	\N	385342020	2009
323	The Secret Speech	Tom Rob Smith	\N	446402400	2009
324	The Ringworld Engineers 	Larry Niven	\N	345418417	1979
325	Bloody Valentine	Melissa de la Cruz	\N	1423134494	2010
326	Garden Spells	Sarah Addison Allen	\N	553805487	2007
327	Chasing Darkness	Robert Crais	\N	743281640	2008
328	The Magician's Apprentice	Trudi Canavan	\N	316037885	2009
329	Earth Abides	George R. Stewart	\N	345487133	1949
330	Keeping You a Secret	Julie Anne Peters	\N	316009857	2007
331	The White Rose	Glen Cook	\N	812508440	1985
332	A Spell for Chameleon	Piers Anthony	\N	034525855X	1977
333	Midnight Tides	Steven Erikson	\N	553813145	2004
334	PS, I Love You	Cecelia Ahern	\N	786890754	2003
335	The Saving Graces	Patricia Gaffney	\N	60598328	1999
336	Daughter of the Forest	Juliet Marillier	\N	765343436	1999
337	Sea Swept	Nora Roberts	\N	515121843	1998
338	The Shining	Stephen King	\N	450040186	1977
339	Bloodline	Sidney Sheldon	\N	1568650949	1977
340	Touching Spirit Bear	Ben Mikaelsen	\N	60734000	1997
341	Life of Pi	Yann Martel	\N	770430074	2001
342	Torment	Lauren Kate	\N	385739141	2010
343	Nutshell	Ian McEwan	\N	385542070	2016
344	The Wizard Heir	Cinda Williams Chima	\N	1423104870	2007
345	Big Rock	Lauren Blakely	\N	692572031	2016
346	Mercy	Jodi Picoult	\N	743422449	1996
347	True Colors	Kristin Hannah	\N	312364105	2009
348	L.A. Requiem	Robert Crais	\N	2266120921	1999
349	Seven Years to Sin	Sylvia Day	\N	758290411	2011
350	If There Be Thorns	V.C. Andrews	\N	671729454	1981
351	The Desert Spear	Peter V. Brett	\N	345503813	2010
352	Grey	E.L. James	\N	1101946342	2015
353	Brother Odd	Dean Koontz	\N	553804804	2006
354	The Firm	John Grisham	\N	044021145X	1991
355	Tricks	Ellen Hopkins	\N	1416950079	2009
356	Into the Wild	Erin Hunter	\N	61284203	2003
357	The Never War	D.J. MacHale	\N	1597372552	2003
358	Delirium	Lauren Oliver	\N	61726834	2011
359	Magic's Price	Mercedes Lackey	\N	886774268	1990
360	Two States	Chetan Bhagat	\N	8129115301	2009
361	Footfall	Larry Niven	 Jerry Pournelle	345418425	1985
362	Zita the Spacegirl	Ben Hatke	\N	1596434465	2011
363	Waiting	Ha Jin	\N	375706410	1999
364	Throne of Glass	Sarah J. Maas	\N	1599906953	2012
365	The Book of Negroes	Lawrence Hill	\N	393065782	2007
366	The Wolf of Wall Street	Jordan Belfort	\N	553805460	2007
367	It's In His Kiss	Julia Quinn	\N	006053124X	2005
368	Portrait in Death	J.D. Robb	\N	425189031	2003
369	Islands in the Stream	Ernest Hemingway	\N	743253426	1970
370	Darke	Angie Sage	 Mark Zug	006124242X	2011
371	The Cove	Catherine Coulter	\N	399150862	1996
372	Fablehaven	Brandon Mull	\N	1590385810	2006
373	Break No Bones	Kathy Reichs	\N	743233492	2006
374	Too Much Happiness	Alice Munro	\N	307269760	2009
375	Without Remorse	Tom Clancy	\N	425143325	1993
376	Wild Cards	Simone Elkeles	\N	802734375	2013
377	The Fuck-Up	Arthur Nersesian	\N	671027638	1997
378	Throne of Jade	Naomi Novik	\N	345481291	2006
379	One False Move	Harlan Coben	\N	440225442	1998
380	A Matter of Honor	Jeffrey Archer	\N	312933541	1985
381	Trunk Music	Michael Connelly	\N	312941919	1997
382	Monsters	Ilsa J. Bick	\N	1606841750	2011
383	Calamity	Brandon Sanderson	\N	385743602	2016
384	Amadeus	Peter Shaffer	\N	60935499	1979
385	The Sky is Falling	Sidney Sheldon	\N	446610178	2000
386	A Civil Campaign	Lois McMaster Bujold	\N	671578855	1999
387	Rush	Maya Banks	\N	425267040	2013
388	The Brass Verdict	Michael Connelly	\N	316166294	2008
389	Ladies' Night 	Mary Kay Andrews	\N	1250019672	2013
390	Sharp Objects	Gillian Flynn	\N	307341542	2006
391	The Incredible Journey	Sheila Burnford	\N	440226708	1960
392	Where We Belong	Emily Giffin	\N	312554192	2012
393	The Guilty	David Baldacci	\N	1455536253	2015
394	Ruby	Cynthia Bond	\N	804188246	2014
395	Galveston	Nic Pizzolatto	\N	1439166641	2004
396	The Pagan Stone	Nora Roberts	\N	515144665	2008
397	God Emperor of Dune	Frank Herbert	\N	575075066	1981
398	Seduction in Death	J.D. Robb	\N	749934395	2001
399	The Duchess War	Courtney Milan	\N	1937248097	2012
400	Over Sea, Under Stone	Susan Cooper	\N	068987121X	1965
401	Burn	Maya Banks	\N	425267083	2013
402	The Orphan Master's Son	Adam Johnson	\N	812992792	2012
403	The Last Star	Rick Yancey	\N	399162437	2016
404	Intensity	Dean Koontz	\N	553582917	1987
405	Going Too Far	Jennifer Echols	\N	1416571736	2009
406	The Guard	Kiera Cass	\N	62317148	2014
407	Alex Cross, Run	James Patterson	\N	316097527	2013
408	Need	Carrie Jones	\N	1599903385	2008
409	Screw It, Let's Do It	Richard Branson	\N	753510995	2006
410	The Codex	Douglas Preston	\N	076534629X	2003
411	The Revenge of Seven	Pittacus Lore	\N	62194720	2014
412	King Solomon's Mines	H. Rider Haggard	\N	812966295	1885
413	Good Grief	Lolly Winston	\N	446694843	2004
414	Extras	Scott Westerfeld	\N	1416951172	2006
415	The Dharma Bums	Jack Kerouac	\N	140042520	1958
416	Life after God	Douglas Coupland	\N	743231511	1994
417	London Bridges	James Patterson	\N	446613355	2004
418	The Lost Years of Merlin	T.A. Barron	\N	441010288	1996
419	Fish In A Tree	Lynda Mullaly Hunt	\N	399162593	2015
420	Darkest Fear	Harlan Coben	\N	752849190	1999
421	A Long Way From Chicago	Richard Peck	\N	142401102	1998
422	Bearing an Hourglass	Piers Anthony	\N	345313151	1984
423	The Life We Bury	Allen Eskens	\N	1616149981	2014
424	The Winter Rose	Jennifer Donnelly	\N	7191324	2008
425	Moscow Rules	Daniel Silva	\N	399155015	2008
426	The Once and Future King	T.H. White	\N	441627404	1958
427	Ashfall	Mike Mullin	\N	1933718552	2011
428	Equus : a play	Peter Shaffer	\N	140260706	1973
429	Warm Bodies	Isaac Marion	\N	99549344	2010
430	Harvesting the Heart	Jodi Picoult	\N	140230270	1993
431	Pale Demon	Kim Harrison	\N	61138061	2011
432	Consent to Kill	Vince Flynn	\N	1416505016	2005
433	I'll Give You the Sun	Jandy Nelson	\N	803734964	2014
434	Reaper Man	Terry Pratchett	\N	552152951	1991
435	Sing You Home	Jodi Picoult	\N	1439102724	2011
436	The Brooklyn Follies	Paul Auster	\N	312426232	2005
437	Plague	Michael  Grant	\N	61449121	2011
438	The Keep 	F. Paul Wilson	\N	765357054	1981
439	People of the Book	Geraldine Brooks	\N	067001821X	2008
440	Fairest	Marissa Meyer	\N	1250060559	2015
441	Spells	Aprilynne Pike	\N	61668060	2009
442	The Auschwitz Escape	Joel C. Rosenberg	\N	1414336241	2014
443	The Survivors Club	Lisa Gardner	\N	553589458	2002
444	The Vacationers	Emma Straub	\N	1594631573	2014
445	Imajica	Clive Barker	\N	61094145	1991
446	Pop Goes the Weasel	James Patterson	\N	446608815	1999
447	Lord Brocktree	Brian Jacques	\N	142501107	2000
448	Suspect	Robert Crais	\N	399161481	2013
449	Whispers	Dean Koontz	\N	042520992X	1980
450	In Cold Blood	Truman Capote	\N	679745580	1965
451	Tar Baby	Toni Morrison	\N	1400033446	1981
452	What Alice Forgot	Liane Moriarty	\N	141043768	2009
453	Wild Fire	Nelson DeMille	\N	044657967X	2006
454	Area 7	Matthew Reilly	\N	312983220	2001
455	While I Was Gone	Sue Miller	\N	345443284	1998
456	The Painter	Peter Heller	\N	385352093	2014
457	Fool's Quest	Robin Hobb	\N	553392921	2015
458	Ceremony	Leslie Marmon Silko	\N	140086838	1977
459	Black Order	James Rollins	\N	752876457	2006
460	Siege of Darkness	R.A. Salvatore	\N	786901640	1993
461	On the Fence	Kasie West	\N	62235672	2014
462	Princess in the Spotlight	Meg Cabot	\N	64472795	2001
463	Champion	Marie Lu	\N	399256776	2013
464	Canada	Richard Ford	\N	61692042	2012
465	Stone Soup	Jon J. Muth	\N	043933909X	2003
466	Rebel Heart	Moira Young	\N	1442430001	2012
467	I Was So Mad (Look-Look)	Mercer Mayer	\N	307119394	1983
468	Dragon Prince	Melanie Rawn	\N	756403014	1985
469	The Bronze Bow	Elizabeth George Speare	\N	395137195	1961
470	Red	Ted Dekker	\N	1595540342	2004
471	Miles to Go	Richard Paul Evans	\N	1439191379	2011
472	After We Fell	Anna Todd	\N	147679250X	2014
473	City of Bones	Michael Connelly	\N	446699535	2002
474	Dark Prince	Christine Feehan	\N	843955287	1999
475	Twenty Boy Summer	Sarah Ockler	\N	316051594	2009
476	Nevermore	James Patterson	\N	316101842	2012
477	Contact	Carl Sagan	\N	2266079999	1985
478	Class A (Cherub #2)	Robert Muchamore	\N	340881542	2004
479	The Taking	Dean Koontz	\N	553584502	2004
480	Dreams from My Father	Barack Obama	\N	1921351438	1995
481	Austenland	Shannon Hale	\N	1596912855	2007
482	Wondrous Strange	Lesley Livingston	\N	1554682746	2009
483	White Cat	Holly Black	\N	1416963960	2010
484	First Drop of Crimson	Jeaniene Frost	\N	61583227	2010
485	Ricochet	Sandra Brown	\N	1416532358	2006
486	Back on Blossom Street	Debbie Macomber	\N	778324516	2007
487	When She Woke	Hillary Jordan	\N	1565126297	2011
488	Mister B. Gone	Clive Barker	\N	60182989	2007
489	Shattered	K.R. Dwyer	 Dean Koontz	425099334	1973
490	The House On Tradd Street	Karen   White	\N	451225090	2008
491	Dorothy Must Die	Danielle  Paige	\N	62280678	2014
492	The Shelters of Stone	Jean M. Auel	\N	553382616	2002
493	Perfect	Sara Shepard	\N	60887370	2007
494	Rebel Angels	Libba Bray	\N	385733410	2005
495	Visions of Sugar Plums	Janet Evanovich	\N	312986343	2002
496	The Bees	Laline Paull	\N	62331159	2014
497	Light in August	William Faulkner	\N	679732268	1932
498	Blood Promise	Richelle Mead	\N	1595141987	2009
499	Heart of Darkness	Joseph Conrad	\N	1892295490	1899
500	Fear of Flying	Erica Jong	\N	451209435	1973
501	Sunset Express	Robert Crais	\N	345454944	1996
502	The Crystal Cave	Mary  Stewart	\N	60548258	1970
503	The Blade Itself	Joe Abercrombie	\N	575079797	2006
504	Red Storm Rising	Tom Clancy	\N	394298667	1986
505	Sweetheart	Chelsea Cain	\N	031236847X	2008
506	My Blood Approves	Amanda Hocking	\N	557364639	2010
507	The BFG	Roald Dahl	 Quentin Blake	141311371	1982
508	River God	Wilbur Smith	\N	312954468	1993
509	Owen	Kevin Henkes	\N	688114490	1993
510	The Hollow	Nora Roberts	\N	515144592	2008
511	The Hit	David Baldacci	\N	1455521213	2013
512	Strangers in Death 	J.D. Robb	\N	399154701	2008
513	Ten Tiny Breaths	K.A. Tucker	\N	991686004	2012
514	Living Dead Girl	Elizabeth Scott	\N	1416960597	2008
515	Blockade Billy	Stephen King	\N	1587672286	2010
516	Chasing Harry Winston	Lauren Weisberger	\N	743290119	2008
517	MEG: A Novel of Deep Terror	Steve Alten	\N	976165910	1997
518	The Fog	James Herbert	\N	330376152	1975
519	Belong to Me	Marisa de los Santos	\N	61240273	2008
520	Dragonsinger	Anne McCaffrey	\N	689860072	1977
521	To Have and to Hold 	Jane Green	\N	767912276	2002
522	The Best Man	Kristan Higgins	\N	373777922	2013
523	Maine	J. Courtney Sullivan	\N	307595129	2011
524	The Overlook	Michael Connelly	\N	316018953	2007
525	Babyville	Jane Green	\N	767912241	2001
526	Olympos	Dan Simmons	\N	380817934	2005
527	John Dies at the End	David Wong	\N	978970764	2007
528	Black Cherry Blues	James Lee Burke	\N	380712040	1989
529	Succubus On Top	Richelle Mead	\N	758216424	2008
530	Honolulu	Alan Brennert	\N	312360401	2009
531	Dreamland 	Sarah Dessen	\N	142401757	2000
532	Victims	Jonathan Kellerman	\N	345505719	2012
533	A Midsummer's Nightmare	Kody Keplinger	\N	316084220	2012
534	Midnight's Children	Salman Rushdie	\N	99578514	1981
535	Stars Above	Marissa Meyer	\N	1250091845	2016
536	Magic Slays	Ilona Andrews	\N	441020429	2011
537	The Son of Neptune 	Rick Riordan	\N	1423140591	2011
538	Prior Bad Acts	Tami Hoag	\N	055358359X	2006
539	All Tomorrow's Parties	William Gibson	\N	425190447	1999
540	Angel Falls	Kristin Hannah	\N	345484274	2000
541	The Green Mile	Stephen King	\N	451933028	1996
542	Asylum	Madeleine Roux	\N	62220969	2013
543	The Haj	Leon Uris	\N	553248642	1984
544	Divine Justice	David Baldacci	\N	446195502	2008
545	Sea of Silver Light	Tad Williams	\N	641645473	2001
546	The Awakening	L.J. Smith	\N	61020001	1991
547	The Great Hunt	Robert Jordan	\N	812517725	1990
548	Double Fudge	Judy Blume	\N	142408786	2002
549	Eligible	Curtis Sittenfeld	\N	1400068320	2016
550	The Dot	Peter H. Reynolds	\N	763619612	2003
551	Unnatural Exposure	Patricia Cornwell	\N	751530492	1997
552	One Good Turn	Kate Atkinson	\N	316012823	2006
553	Glass Houses	Rachel Caine	\N	451219945	2006
554	The Johnstown Flood	David McCullough	\N	844662925	1968
555	The Nature of the Beast	Louise Penny	\N	1250022088	2015
556	The Gemini Contenders	Robert Ludlum	\N	553282093	1976
557	Lost Souls	Poppy Z. Brite	\N	440212812	1992
558	My Sister's Keeper	Jodi Picoult	\N	743454537	2004
559	Icy Sparks	Gwyn Hyman Rubio	\N	142000205	1998
560	Street Magic	Tamora Pierce	\N	590396439	2001
561	Think of a Number	John Verdon	\N	307588920	2010
562	M Train	Patti Smith	\N	1101875100	2015
563	Straight Man	Richard Russo	\N	375701907	1997
564	Cry, The Beloved Country	Alan Paton	\N	074326195X	1948
565	Night Probe!	Clive Cussler	\N	553277405	1981
566	Broken Homes	Ben Aaronovitch	\N	756409608	2013
567	Alice in Zombieland	Gena Showalter	\N	373210582	2012
568	City of Thieves	David Benioff	\N	670018708	2008
569	The King of Attolia	Megan Whalen Turner	\N	006083577X	2006
570	It's Kind of a Funny Story	Ned Vizzini	\N	078685197X	2006
571	From Potter's Field	Patricia Cornwell	\N	425204693	1995
572	Ender's Game	Orson Scott Card	\N	812550706	1985
573	Addicted	Zane	\N	743442849	1998
574	A Hunger Like No Other	Kresley Cole	\N	1416509879	2006
575	The Coldest Winter Ever	Sister Souljah	\N	1416521690	1999
576	The Bell Jar	Sylvia Plath	\N	61148512	1963
577	Cosmopolis	Don DeLillo	\N	330412744	2003
578	The Secret	Julie Garwood	\N	671744216	1992
579	Mastiff	Tamora Pierce	\N	375814701	2011
580	Red Rabbit	Tom Clancy	\N	399148701	2002
581	Boneshaker 	Cherie Priest	\N	765318415	2009
582	Cross Fire	James Patterson	\N	031603617X	2010
583	The Gift	James Patterson	 Ned Rust	1846054761	2010
584	Point of Impact	Stephen Hunter	\N	99453452	1993
585	Cometh the Hour	Jeffrey Archer	\N	1466867507	2016
586	The Starter Wife	Gigi Levangie Grazer	\N	743265025	2005
587	The Places In Between	Rory Stewart	\N	156031566	2004
588	Girl in Translation	Jean Kwok	\N	1594487561	2010
589	Dark Legend	Christine Feehan	\N	084394952X	2002
590	Castle of Wizardry	David Eddings	\N	345335708	1984
591	Surface Detail	Iain M. Banks	\N	316123404	2010
592	The Mediterranean Caper	Clive Cussler	\N	425197395	1973
593	The Lincoln Lawyer 	Michael Connelly	\N	739465511	2005
594	The Last Coyote	Michael Connelly	\N	075280944X	1995
595	Princess of Glass	Jessica Day George	\N	1599904780	2010
596	The Host	Stephenie Meyer	\N	316068047	2008
597	Spider's Bite	Jennifer Estep	\N	1439147973	2010
598	Undead and Unwed	MaryJanice Davidson	\N	042519485X	2004
599	Day by Day Armageddon	J.L. Bourne	\N	1411608313	2004
600	Gateway	Frederik Pohl	\N	345475836	1977
601	King of the Murgos	David Eddings	\N	552148032	1988
602	P.S. I Still Love You	Jenny Han	\N	144242673X	2015
603	The Young Elites	Marie Lu	\N	399167838	2014
604	We3	Grant Morrison	 Frank Quitely	1401204953	2005
605	Brick Lane	Monica Ali	\N	743243315	2003
606	To Sir Phillip, With Love	Julia Quinn	\N	380820854	2003
607	Illuminae	Amie Kaufman	 Jay Kristoff	553499114	2015
608	The Long Haul 	Jeff Kinney	\N	141971189X	2014
609	Exit to Eden	Anne Rampling	 Anne Rice	727853414	1985
610	The Fold	Peter Clines	\N	553418297	2015
611	Even Now	Karen Kingsbury	\N	310247535	2005
612	Skellig	David Almond	\N	440229081	1998
613	The Gashlycrumb Tinies	Edward Gorey	\N	747541604	1963
614	Lucky You	Carl Hiaasen	\N	330369032	1991
615	A Stolen Life	Jaycee Dugard	\N	1451629184	2011
616	Man and Boy	Tony Parsons	\N	743225082	1999
617	The Giving Tree	Shel Silverstein	\N	60256656	1964
618	The Selection	Kiera Cass	\N	62059939	2012
619	Lord of the Flies 	William Golding	\N	140283331	1954
620	My Sunshine Away	M.O. Walsh	\N	399169520	2015
621	The Last Continent	Terry Pratchett	\N	552154180	1998
622	Castle in the Air	Diana Wynne Jones	\N	64473457	1990
623	Winter Stroll	Elin Hilderbrand	\N	316261130	2015
624	Wedding Night	Sophie Kinsella	\N	812984277	2013
625	Sever	Lauren DeStefano	\N	1442409096	2013
626	A Single Man	Christopher Isherwood	\N	816638624	1964
627	The Raven King	Maggie Stiefvater	\N	545424984	2016
628	Fire Sea	Margaret Weis	 Tracy Hickman	553295411	1991
629	Night Road	Kristin Hannah	\N	312364423	2011
630	Eyes of Prey	John Sandford	\N	425214435	1991
631	Labyrinth	Kate Mosse	\N	425213978	2005
632	Rock Chick	Kristen Ashley	\N	1849231842	2008
633	Hallowe'en Party	Agatha Christie	\N	7120680	1969
634	The Scorpio Races	Maggie Stiefvater	\N	054522490X	2011
635	Moon Called	Patricia Briggs	\N	441013813	2006
636	Proven Guilty	Jim Butcher	\N	451461037	2006
637	Rough Country	John Sandford	\N	399155988	2009
638	Nineteen Minutes	Jodi Picoult	\N	743496728	2007
639	Fall on Your Knees	Ann-Marie MacDonald	\N	743466527	1996
640	Then Came You	Jennifer Weiner	\N	1451617720	2010
641	The Mixed-Up Chameleon	Eric Carle	\N	694011479	1975
642	Weaveworld	Clive Barker	\N	7117140	1987
643	Switched	Amanda Hocking	\N	1453688935	2010
644	The Underworld	Jessica Sorensen	\N	1463756976	2011
645	The Passion of Artemisia	Susan Vreeland	\N	142001821	2001
646	Catching Jordan	Miranda Kenneally	\N	1402262272	2011
647	Paradise Kiss 1	Ai Yazawa	\N	1931514607	2000
648	Open Season	Linda Howard	\N	671027581	2001
649	Dune Messiah 	Frank Herbert	\N	441172695	1969
650	Heat Rises	Richard Castle	\N	1401324436	2011
651	Fly Away Home	Jennifer Weiner	\N	743294270	2010
652	Starship Troopers	Robert A. Heinlein	\N	441783589	1959
653	Apollyon	Jennifer L. Armentrout	\N	1937053164	2013
654	From Here to Eternity	James  Jones	\N	517223007	1951
655	Rumor Has it	Jill Mansell	\N	755328175	2009
656	Dark Angel	V.C. Andrews	\N	067172939X	1986
657	Succubus Dreams 	Richelle Mead	\N	758216432	2008
658	The Space Between Us	Thrity Umrigar	\N	006079156X	2006
659	The Paris Architect	Charles Belfoure	\N	1402284314	2013
660	The Circle	Dave Eggers	\N	385351399	2013
661	Feast of Fools	Rachel Caine	\N	451224639	2008
662	War Horse	Michael Morpurgo	\N	439796636	1982
663	Lover at Last	J.R. Ward	\N	451239350	2013
664	Sudden Prey	John Sandford	\N	425157539	1996
665	A Game of Thrones	George R.R. Martin	\N	553588486	1996
666	Nation	Terry Pratchett	\N	61433012	2008
667	Room	Emma Donoghue	\N	316098337	2010
668	Spell Bound	Rachel Hawkins	\N	1423121325	2012
669	Mariana	Susanna Kearsley	\N	553573764	1994
670	Pretty Girls	Karin Slaughter	\N	62430874	2015
671	Are You My Mother?	P.D. Eastman	\N	1713221	1960
672	Love Medicine	Louise Erdrich	\N	60786469	1984
673	Devil May Cry	Sherrilyn Kenyon	\N	312369506	2007
674	Shantaram	Gregory David Roberts	\N	192076920X	2003
675	Luck in the Shadows	Lynn Flewelling	\N	553575422	1996
676	The Day of the Jackal	Frederick Forsyth	\N	553266306	1971
677	The Stainless Steel Rat	Harry Harrison	\N	1857984986	1961
678	The Hotel New Hampshire	John Irving	\N	552992097	1981
679	The Woman in Cabin 10	Ruth Ware	\N	1501132938	2016
680	Nobody's Fool	Richard Russo	\N	679753338	1993
681	Bridge to Haven	Francine Rivers	\N	1414368186	2014
682	A Tree Grows In Brooklyn 	Betty  Smith	\N	61120073	1943
683	Great House	Nicole Krauss	\N	393079988	2010
684	Ramona Quimby, Age 8	Beverly Cleary	\N	440800463	1981
685	Fool	Christopher Moore	\N	60590319	2009
686	Moriarty	Anthony Horowitz	\N	62377183	2014
687	The Turner House	Angela Flournoy	\N	544303164	2015
688	The Rivers of Zadaa	D.J. MacHale	\N	689869126	2005
689	You Had Me At Hello	Mhairi McFarlane	\N	000748805X	2012
690	Fool Moon 	Jim Butcher	\N	451458125	2001
691	Quicksilver	Neal Stephenson	\N	60593083	2003
692	What Happened to Goodbye	Sarah Dessen	\N	670012947	2011
693	The Body Farm	Patricia Cornwell	\N	425201449	1994
694	The Merchant of Death	D.J. MacHale	\N	743437314	2002
695	The Son of Sobek	Rick Riordan	\N	1423194551	2013
696	The Complete Maus	Art Spiegelman	\N	141014083	1986
697	Insatiable	Meg Cabot	\N	006173506X	2010
698	High Noon	Nora Roberts	\N	399154345	2007
699	Angels	Marian Keyes	\N	60512148	2002
700	Once a Runner	John L. Parker Jr.	\N	915297019	1978
701	A Million Suns 	Beth Revis	\N	159514398X	2012
702	Behind Her Eyes	Sarah Pinborough	\N	125011117X	2017
703	The Yearling	Marjorie Kinnan Rawlings	\N	689846231	1930
704	Party Princess	Meg Cabot	\N	60724552	2006
705	No Mercy	Sherrilyn Kenyon	\N	312546564	2010
706	Rhett Butler's People	Donald McCaig	\N	023070395X	2007
707	Scorpia	Anthony Horowitz	\N	142405787	2004
708	L is for Lawless	Sue Grafton	\N	449221490	1994
709	Rainbow Boys	Alex   Sanchez	\N	689857705	2001
710	The Tenth Insight 	James Redfield	\N	446674575	1996
711	Presumed Innocent	Scott Turow	\N	446350982	1986
712	Thunderstruck	Erik Larson	\N	1400080665	2006
713	The Shoemaker's Wife	Adriana Trigiani	\N	61257095	2012
714	A Little Life	Hanya Yanagihara	\N	385539258	2015
715	Glitter and Glue	Kelly Corrigan	\N	034553283X	2014
716	Gathering Prey	John Sandford	\N	399168796	2015
717	Perfect Chemistry	Simone Elkeles	\N	802798233	2008
718	The High King 	Lloyd Alexander	\N	080508052X	1968
719	The Astronaut Wives Club	Lily Koppel	\N	1455503258	2013
720	When Calls the Heart	Janette Oke	\N	764200119	1983
721	The Sum of All Men	David Farland	\N	812541626	1998
722	Lost	Gregory Maguire	 Douglas Smith	60988649	2001
723	The Naked Face	Sidney Sheldon	\N	446321214	1970
724	Underworld	Don DeLillo	\N	330369954	1997
725	This Savage Song	Victoria Schwab	\N	62380877	2016
726	The Dragonbone Chair	Tad Williams	\N	756402697	1988
727	The Fault in Our Stars	John Green	\N	525478817	2012
728	Tiger's Voyage	Colleen Houck	\N	1450595987	2011
729	The Wasp Factory	Iain Banks	\N	684853159	1984
730	Split Second	David Baldacci	\N	446614459	2003
731	Blindsighted	Karin Slaughter	\N	380820889	2001
732	Since You've Been Gone	Morgan Matson	\N	1442435003	2014
733	Mirror Dance	Lois McMaster Bujold	\N	671876465	1994
734	Angelology	Danielle Trussoni	\N	670021474	2010
735	Blameless	Gail Carriger	\N	316074152	2010
736	L'isola del giorno prima	Umberto Eco	\N	156030373	1994
737	Diamonds are Forever	Ian Fleming	\N	142002054	1956
738	Up From the Grave 	Jeaniene Frost	\N	62076116	2014
739	Singularity Sky	Charles Stross	\N	1841493341	2003
740	Waiting to Exhale	Terry McMillan	\N	451217454	1992
741	The Red Badge of Courage	Stephen Crane	\N	1580495869	1871
742	River Marked	Patricia Briggs	\N	1841497975	2011
743	Stone Cold	David Baldacci	\N	446577391	2007
744	Rachel's Holiday	Marian Keyes	\N	60090383	1997
745	The Book of Shadows	Paula Brackston	\N	031262168X	1991
746	The Patron Saint of Liars	Ann Patchett	\N	1841150509	1992
747	Sizzling Sixteen	Janet Evanovich	\N	739377728	2009
748	The Bonfire of the Vanities	Tom Wolfe	\N	553381342	1987
749	Paddy Clarke Ha Ha Ha	Roddy Doyle	\N	2264022442	1993
750	Mad About the Boy	Helen Fielding	\N	345807952	2013
751	My Name Is Mary Sutter	Robin Oliveira	\N	670021679	2010
752	Infinite Jest	David Foster Wallace	\N	316921173	1996
753	The Ghost Brigades	John Scalzi	\N	765354063	2006
754	Another Fine Myth	Robert Lynn Asprin	\N	441013465	1978
755	To The Lighthouse 	Virginia Woolf	\N	140679239X	1927
756	Heaven	Alexandra Adornetto	\N	312656289	2012
757	Captain's Fury	Jim Butcher	\N	441015271	2007
758	Night World, No. 3	L.J. Smith	\N	1416974520	2009
759	David Gets in Trouble	David Shannon	\N	439050227	2002
760	Beautiful Stranger	Christina Lauren	\N	1476731535	2013
761	Grave Surprise	Charlaine Harris	\N	425212033	2006
762	Empire of Ivory	Naomi Novik	\N	345496876	2007
763	The Lace Reader	Brunonia Barry	\N	097915930X	2006
764	Curious George	H.A. Rey	\N	039515023X	1941
765	Dance Upon The Air	Nora Roberts	\N	749932775	2001
766	Hausfrau	Jill Alexander Essbaum	\N	812997530	2015
767	The Bone People	Keri Hulme	\N	140089225	1984
768	A Rose for Emily	William Faulkner	\N	675093244	1930
769	Strip Tease	Carl Hiaasen	\N	044669567X	1993
770	Frog and Toad Are Friends	Arnold Lobel	\N	64440206	1970
771	Uglies	Scott Westerfeld	\N	689865384	2005
772	Fool's Fate	Robin Hobb	\N	553582461	2003
773	White Witch, Black Curse	Kim Harrison	\N	61138010	2009
774	Children of God	Mary Doria Russell	\N	044900483X	1998
775	Total Control	David Baldacci	\N	446604844	1996
776	The Chosen	Chaim Potok	\N	449213447	1967
777	Terms of Endearment	Larry McMurtry	\N	075283455X	1975
778	Nachfolge	Dietrich Bonhoeffer	\N	684815001	1937
779	The Virgin Cure	Ami McKay	\N	676979564	2011
780	From Russia, with Love	Ian Fleming	\N	142002070	1957
781	Okay for Now	Gary D. Schmidt	\N	547152604	2011
782	Anil's Ghost	Michael Ondaatje	\N	375724370	2000
783	Fang	James Patterson	\N	316036196	2010
784	You Can Heal Your Life	Louise L. Hay	\N	8176210773	1984
785	Still Life with Woodpecker	Tom Robbins	\N	184243022X	1980
786	Waterfall	Lisa Tawn Bergren	\N	1434764338	2011
787	Ilse Witch 	Terry Brooks	\N	345396553	2000
788	The Lost Wife	Alyson Richman	\N	042524413X	2011
789	Greenwitch	Susan Cooper	\N	689840349	1974
790	Tell No One	Harlan Coben	\N	440236703	2001
791	Deity	Jennifer L. Armentrout	\N	1937053148	2012
792	Girls in White Dresses	Jennifer Close	\N	307596850	2011
793	Debt Inheritance	Pepper Winters	\N	1500607533	2014
794	The Notebook	Nicholas Sparks	\N	553816713	1996
795	From the Corner of His Eye	Dean Koontz	\N	553582747	2000
796	Prodigal Summer	Barbara Kingsolver	\N	60959037	2000
797	Stellaluna	Janell Cannon	\N	152802177	1993
798	Ghost World	Daniel Clowes	\N	1560974273	1998
799	The Birth of Venus	Sarah Dunant	\N	812968972	2003
800	Sins of the Night	Sherrilyn Kenyon	\N	312934327	2005
801	The Search	Nora Roberts	\N	399156577	2010
802	Brokeback Mountain	Annie Proulx	\N	743271327	1997
803	Blow Fly	Patricia Cornwell	\N	425198731	2003
804	Lone Wolf	Jodi Picoult	\N	1439102759	2012
805	Hallowed	Cynthia Hand	\N	61996181	2012
806	Servant of the Bones	Anne Rice	\N	963192566	1996
807	The Selfish Gene	Richard Dawkins	\N	199291152	1976
808	Prey	Michael Crichton	\N	61015725	2002
809	The Line of Beauty	Alan Hollinghurst	\N	739464469	2004
810	Hannibal Rising	Thomas Harris	\N	385339410	2006
811	The Source	James A. Michener	\N	375760385	1965
812	A Reliable Wife	Robert Goolrick	\N	1565125967	2009
813	The Bourne Identity	Robert Ludlum	\N	752864327	1980
814	The Evolutionary Void	Peter F. Hamilton	\N	345496574	2009
815	Small Favor	Jim Butcher	\N	451461894	2008
816	The Grapes of Wrath	John Steinbeck	\N	142000663	1939
817	Ringworld	Larry Niven	\N	575077026	1970
818	The Return of the King	J.R.R. Tolkien	\N	345339738	1955
819	Being Nikki	Meg Cabot	\N	545040566	2009
820	Dawn	Erin Hunter	\N	006074457X	2005
821	Losing It	Cora Carmack	\N	988393506	2012
822	The Blind Assassin	Margaret Atwood	\N	1860498809	2000
823	Descent	Tim Johnston	\N	1616203048	2015
824	The Omnivore's Dilemma	Michael Pollan	\N	1594200823	2006
825	King of Foxes	Raymond E. Feist	\N	380803267	2003
826	Eternal Rider	Larissa Ione	\N	044657449X	2011
827	The Other Side of Dawn	John Marsden	\N	439858054	1999
828	The Diviners	Libba Bray	\N	031612611X	2012
829	Valley of the Dolls	Jacqueline Susann	\N	739418378	1966
830	Shatterglass	Tamora Pierce	\N	059039696X	2003
831	Dawn	Octavia E. Butler	\N	446603775	1987
832	Boy Meets Girl	Meg Cabot	\N	330418874	2004
833	The Grand Sophy	Georgette Heyer	\N	99465639	1950
834	Mortal Coil	Derek Landy	\N	7325983	2010
835	Desperation	Stephen King	\N	451188462	1996
836	A Long Walk to Water	Linda Sue Park	\N	547251270	2010
837	Honor Among Enemies	David Weber	\N	671877836	1996
838	Heir of Novron	Michael J. Sullivan	\N	316187712	2012
839	The Copper Beech	Maeve Binchy	\N	752876813	1992
840	Forward the Foundation	Isaac Asimov	\N	553565079	1993
841	The Rumor	Elin Hilderbrand	\N	316334529	2015
842	Strong Poison	Dorothy L. Sayers	\N	60809086	1930
843	Gone for Good	Harlan Coben	\N	440236738	2002
844	Genesis	Karin Slaughter	\N	385341962	2009
845	Magic Bites	Ilona Andrews	\N	441014895	2007
846	Hatchet	Gary Paulsen	\N	689840926	1986
847	Dead and Gone	Charlaine Harris	\N	441017150	2009
848	Code Name Verity	Elizabeth Wein	\N	1405258217	2012
849	Hourglass	Myra McEntire	\N	1606841440	2011
850	Theft of Swords	Michael J. Sullivan	\N	316187747	2011
851	Dare Me	Megan Abbott	\N	316097772	2012
852	The Compound	S.A. Bodeen	\N	312370156	2008
853	The Sword Thief	Peter Lerangis	\N	545135702	2009
854	I Want My Hat Back	Jon Klassen	\N	763655988	2011
855	The Forgotten Garden	Kate Morton	\N	330449605	2008
856	Nine Stories	J.D. Salinger	\N	316767727	1953
857	Yes Please	Amy Poehler	\N	62268341	2014
858	Bel Canto	Ann Patchett	\N	60838728	2001
859	Blue Monday	Nicci French	\N	718154959	2011
860	Charmed Life 	Diana Wynne Jones	\N	000710653X	1977
861	I Am Ozzy	Ozzy Osbourne	 Chris Ayres	446569895	2009
862	Devil Bones	Kathy Reichs	\N	743294386	2008
863	Driving Miss Daisy	Alfred Uhry	\N	930452895	1986
864	The Negotiator	Dee Henderson	\N	1414310560	2000
865	The Perfect Hope	Nora Roberts	\N	1455807044	2012
866	In the Lake of the Woods	Tim O'Brien	\N	061870986X	1994
867	Trapped 	Kevin Hearne	\N	034553364X	2012
868	Physik	Angie Sage	 Mark Zug	60577371	2007
869	Orlando: A Biography	Virginia Woolf	\N	141184272	1928
870	A Fire Upon The Deep	Vernor Vinge	\N	812515285	1992
871	Day After Night	Anita Diamant	\N	743299841	2009
872	The Help	Kathryn Stockett	\N	399155341	2009
873	Mercy Blade	Faith Hunter	\N	451463722	2011
874	Nightshade	Andrea Cremer	\N	039925482X	2010
875	The Beach	Alex Garland	\N	1573226521	1996
876	Private	Kate Brian	\N	1416918736	2006
877	Calling Me Home	Julie Kibler	\N	1250014522	2012
878	Counting by 7s	Holly Goldberg Sloan	\N	803738552	2013
879	Dear John	Nicholas Sparks	\N	446528056	2006
880	East of Eden  	John Steinbeck	\N	142000655	1952
881	Faefever	Karen Marie Moning	\N	385341636	2008
882	Just Listen	Sarah Dessen	\N	670061050	2006
883	Housekeeping	Marilynne Robinson	\N	312424094	1980
884	Forest Mage	Robin Hobb	\N	60757639	2006
885	Cranford	Elizabeth Gaskell	\N	141439882	1853
886	First Rider's Call	Kristen Britain	\N	756401933	2003
887	Night over Water	Ken Follett	\N	451211472	1991
888	L.A. Candy	Lauren Conrad	\N	61767581	2009
889	Everyman	Philip Roth	\N	307277712	2006
890	Winter Moon	Dean Koontz	\N	553582933	1993
891	Kushiel's Justice	Jacqueline Carey	\N	446500038	2007
892	The Prisoner of Zenda	Anthony Hope	\N	140621318	1894
893	Jewels of the Sun	Nora Roberts	\N	515126772	1999
894	Briar's Book	Tamora Pierce	\N	590554115	1999
895	Dragon bound	Thea Harrison	\N	425241505	2011
896	The Enchanted Wood	Enid Blyton	\N	749748001	1939
897	How the Mind Works	Steven Pinker	\N	393318486	1997
898	The Giver	Lois Lowry	\N	385732554	1993
899	Executive Power	Vince Flynn	\N	743453964	2003
900	The Virgin's Lover	Philippa Gregory	\N	743269268	2004
901	Magic Binds	Ilona Andrews	\N	425270696	2016
902	Rumble Fish	S.E. Hinton	\N	440975344	1975
903	Gemeinsames Leben	Dietrich Bonhoeffer	\N	60608528	1939
904	The Stranger	Harlan Coben	\N	525953507	2015
905	Jewel (Oprah's Book Club) 	Bret Lott	\N	671042572	1991
906	Northern Lights	Philip Pullman	\N	679879242	1995
907	Deliverance	James Dickey	\N	038531387X	1970
908	The Castaways	Elin Hilderbrand	\N	316043893	2009
909	The Birth House	Ami McKay	\N	676977731	2006
910	Fox in Socks	Dr. Seuss	\N	7158475	1965
911	I Shall Wear Midnight	Terry Pratchett	\N	385611072	2010
912	The Autumn Republic 	Brian  McClellan	\N	316219126	2015
913	Iced	Karen Marie Moning	\N	385344406	2012
914	Leaving Time	Jodi Picoult	\N	345544927	2014
915	The Moor's Last Sigh	Salman Rushdie	\N	009959241X	1995
916	One	Richard Bach	\N	330311735	1988
917	Sieben Jahre in Tibet	Heinrich Harrer	\N	874778883	1952
918	Blackberry Winter	Sarah Jio	\N	452298385	2012
919	I Capture the Castle	Dodie Smith	\N	312181108	1948
920	The Ruby Circle	Richelle Mead	\N	159514322X	2015
921	Taken	Robert Crais	\N	399158278	2012
922	Between, Georgia	Joshilyn Jackson	\N	446699454	2006
923	Shugo Chara! 1 (Shugo Chara!)	Peach-Pit	\N	345497457	2006
924	Kindred	Octavia E. Butler	\N	807083690	1979
925	Rumors	Anna Godbersen	\N	61345695	2008
926	Lover Revealed	J.R. Ward	\N	451412354	2007
927	Before I Fall	Lauren Oliver	\N	61726818	2010
928	Death on the Nile	Agatha Christie	\N	553119222	1937
929	Great Expectations	Charles Dickens	\N	192833596	1860
930	The Rescue	Nicholas Sparks	\N	446696129	2000
931	The Cradle Will Fall	Mary Higgins Clark	\N	743484274	1980
932	Relic	Douglas Preston	 Lincoln Child	765354942	1995
933	Fever	Maya Banks	\N	425267067	2013
934	The Odd Couple	Neil Simon	\N	573613311	1965
935	Caught	Harlan Coben	\N	052595158X	2010
936	Getting Over It	Anna Maxted	\N	006098824X	2000
937	The Hydrogen Sonata	Iain M. Banks	\N	356501507	2012
938	Matter	Iain M. Banks	\N	1841494186	2008
939	Excession	Iain M. Banks	\N	553575376	1996
940	My Stroke of Insight	Jill Bolte Taylor	\N	1430300612	2006
941	The Chosen One	Carol Lynch Williams	\N	312555113	2009
942	Robopocalypse	Daniel H. Wilson	\N	385533853	2011
943	The Island of Dr. Moreau	H.G. Wells	\N	553214322	1896
944	Matilda	Roald Dahl	 Quentin Blake	141301066	1988
945	Double Whammy	Carl Hiaasen	\N	446695661	1987
946	Black Swan Green	David Mitchell	\N	812974018	2006
947	Secrets of a Summer Night	Lisa Kleypas	\N	61259349	2004
948	Jitterbug Perfume	Tom Robbins	\N	1842430351	1984
949	A Summer Affair	Elin Hilderbrand	\N	316018600	2008
950	The Book of Illusions	Paul Auster	\N	312990960	2002
951	Microserfs	Douglas Coupland	\N	60987049	1995
952	Home Front	Kristin Hannah	\N	312577206	2012
953	Exodus	Leon Uris	\N	553258478	1958
954	Nevermore	Kelly Creagh	\N	1442402008	2010
955	A Faint Cold Fear	Karin Slaughter	\N	60534052	2003
956	The Unlikely Spy	Daniel Silva	\N	451209303	1996
957	Holding the Dream	Nora Roberts	\N	515142883	1996
958	How to Save a Life	Sara Zarr	\N	316036064	2011
959	The Walk	Richard Paul Evans	\N	1439187312	2010
960	Luckiest Girl Alive	Jessica Knoll	\N	1476789630	2015
961	Angle of Repose	Wallace Stegner	\N	140169300	1971
962	Double Star	Robert A. Heinlein	\N	345330137	1956
963	Brown Girl Dreaming	Jacqueline Woodson	\N	399252517	2014
964	Berlin: The Downfall 1945	Antony Beevor	\N	142002801	1998
965	Manwhore	Katy Evans	\N	1501101536	2015
966	Hideaway	Dean Koontz	\N	425203891	1992
967	Prep	Curtis Sittenfeld	\N	081297235X	2005
968	A World Without Heroes	Brandon Mull	\N	141699792X	2011
969	Little Brother	Cory Doctorow	\N	765319853	2008
970	Absolute Power	David Baldacci	\N	330419641	1995
971	Texas	James A. Michener	\N	375761411	1985
972	Harvest 	Tess Gerritsen	\N	067155302X	1996
973	Another Piece of My Heart	Jane Green	\N	312591829	2012
974	The Forsyte Saga	John Galsworthy	\N	192838628	1921
975	Treasure	Clive Cussler	\N	671704656	1988
976	Landline	Rainbow Rowell	\N	1250049377	2014
977	Love & Misadventure	Lang Leav	\N	473235501	2013
978	I, Claudius	Robert Graves	\N	067972477X	1934
979	How to Be a Woman	Caitlin Moran	\N	91940737	2011
980	Alien	Alan Dean Foster	\N	2290011150	1979
981	The Summons	John Grisham	\N	385339593	2002
982	Kiss of Frost	Jennifer Estep	\N	758266944	2011
983	The General's Daughter	Nelson DeMille	\N	446364800	1992
984	Betty Crocker's Cookbook	Betty Crocker	\N	307098222	1969
985	Broken prince	Erin Watt	\N	1682305031	2016
986	Going After Cacciato	Tim O'Brien	\N	767904427	1978
987	The Minority Report	Philip K. Dick	\N	375421874	1956
988	Immortal in Death 	J.D. Robb	\N	749934085	1996
989	Last Night in Twisted River	John Irving	\N	1400063841	2009
990	Return	Karen Kingsbury	 Gary Smalley	842382895	2003
991	Deliver Us From Evil	David Baldacci	\N	446564087	2010
992	The Acid House	Irvine Welsh	\N	393312801	1994
993	Metro Girl	Janet Evanovich	\N	60584025	2004
994	The Messenger	Daniel Silva	\N	399153357	2006
995	Walking Disaster	Jamie McGuire	\N	1476712980	2013
996	The Piano Teacher	Janice Y.K. Lee	\N	670020486	2008
997	The Pledge	Kimberly Derting	\N	1442422017	2011
998	A Painted House	John Grisham	\N	385337930	2001
999	The Turn of the Screw	Henry James	\N	140620613	1898
1000	Kiss the Dead	Laurell K. Hamilton	\N	425247546	2012
1001	Deal Breaker	Harlan Coben	\N	385340605	1995
1002	The Hero of Ages	Brandon Sanderson	\N	765316897	2008
1003	Lipstick Jungle	Candace Bushnell	\N	786887079	2005
1004	Carry On, Jeeves	P.G. Wodehouse	\N	1585673927	1925
1005	Queen of Sorcery	David Eddings	\N	345335651	1982
1006	Numbers	Rachel Ward	\N	545142997	2008
1007	The Gift	Alison Croggon	\N	763631620	2002
1008	Murder Must Advertise	Dorothy L. Sayers	\N	61043559	1933
1009	White Teeth	Zadie Smith	\N	375703861	1999
1010	Scrappy Little Nobody	Anna Kendrick	\N	1501117203	2016
1011	The Invaders	John Flanagan	\N	399256202	2012
1012	All That Remains	Patricia Cornwell	\N	684193957	1992
1013	The Three Pigs	David Wiesner	\N	618007016	2001
1014	The Screaming Staircase	Jonathan Stroud	\N	857532014	2013
1015	The Peripheral	William Gibson	\N	399158448	2014
1016	For a Few Demons More 	Kim Harrison	\N	60788380	2007
1017	Girl, Interrupted	Susanna Kaysen	\N	679746048	1993
1018	The Sicilian	Mario Puzo	\N	345441702	1984
1019	Anathem	Neal Stephenson	\N	61474096	2008
1020	Splintered	A.G. Howard	\N	1419704281	2013
1021	Fire Star	Chris d'Lacey	\N	439845823	2005
1022	Glory in Death	J.D. Robb	\N	425150984	1995
1023	City on Fire	Garth Risk Hallberg	\N	385353774	2015
1024	Midnight for Charlie Bone	Jenny Nimmo	\N	439474299	2002
1025	Tears of the Moon	Nora Roberts	\N	515128546	1999
1026	May We Be Forgiven	A.M. Homes	\N	670025488	2012
1027	Endless Summer	Jennifer Echols	\N	1442406593	2010
1028	The Case for Christ	Lee Strobel	\N	310226058	1988
1029	The Secret Adversary	Agatha Christie	\N	1600963943	1922
1030	Growing up Amish	Ira Wagler	\N	1414339364	2011
1031	Waiting for the Barbarians	J.M. Coetzee	\N	140283358	1980
1032	Dragon Tears	Dean Koontz	\N	425208435	1993
1033	Body Movers 	Stephanie Bond	\N	778324826	2006
1034	Sandman Slim	Richard Kadrey	\N	61714305	2009
1035	Forest of Secrets	Erin Hunter	\N	60525614	2003
1036	The Thirty-Nine Steps	John Buchan	\N	1419151126	1915
1037	Swindle	Gordon Korman	\N	439903440	2008
1038	The Carrie Diaries	Candace Bushnell	\N	61728918	2010
1039	Lean Mean Thirteen	Janet Evanovich	\N	312349491	2007
1040	Crown Duel 	Sherwood Smith	\N	142301515	1997
1041	Birds of America: Stories	Lorrie Moore	\N	312241224	1998
1042	The Monkey's Raincoat	Robert Crais	\N	752816993	1987
1043	Adam	Ted Dekker	\N	1595540075	2008
1044	Feed	Mira Grant	\N	316081051	2010
1045	Aloha from Hell	Richard Kadrey	\N	61714321	2011
1046	The Final Warning	James Patterson	\N	316002860	2008
1047	Sworn to Silence	Linda Castillo	\N	312374976	2009
1048	Twilight	Erin Hunter	\N	60827645	2006
1049	The Handmaid's Tale	Margaret Atwood	\N	038549081X	1985
1050	Go Set a Watchman	Harper Lee	\N	62409859	2015
1051	Homer's Odyssey 	Gwen Cooper	\N	038534385X	2009
1052	The Clan of the Cave Bear	Jean M. Auel	\N	553381679	1980
1053	The Third Day, The Frost	John Marsden	\N	439829127	1995
1054	The Book of Three	Lloyd Alexander	\N	805080481	1964
1055	Master of the Senate	Robert A. Caro	\N	394720954	2002
1056	Patriot Games	Tom Clancy	\N	425134350	1987
1057	The Bronze Horseman	Paullina Simons	\N	6513220	2001
1058	You Suck 	Christopher Moore	\N	60590297	2007
1059	Sisters	Raina Telgemeier	\N	545540607	2014
1060	Flutter	Amanda Hocking	\N	557489563	2010
1061	The Secret Scripture	Sebastian Barry	\N	571215289	2008
1062	Tales of the City	Armistead Maupin	\N	552998761	1978
1063	The Last Detective	Robert Crais	\N	345451902	2003
1064	Sweet Evil	Wendy Higgins	\N	62085611	2012
1065	The Last Battle	C.S. Lewis	\N	7202326	1956
1066	K is for Killer	Sue Grafton	\N	449000664	1994
1067	Hot Water Music	Charles Bukowski	\N	876855966	1983
1068	Magic Steps	Tamora Pierce	\N	590396056	2000
1069	The Ipcress File	Len Deighton	\N	586026193	1962
1070	You	Caroline Kepnes	\N	1476785597	2014
1071	Gilead	Marilynne Robinson	\N	031242440X	2004
1072	Fever 1793	Laurie Halse Anderson	\N	689848919	2000
1073	Disappearing Acts	Terry McMillan	\N	451209133	1989
1074	Ilium	Dan Simmons	\N	380817926	2003
1075	Cinq semaines en ballon	Jules Verne	\N	1421820609	1863
1076	The Kind Worth Killing	Peter  Swanson	\N	62267523	2015
1077	The Locket	Richard Paul Evans	\N	671004239	1998
1078	Commonwealth	Ann Patchett	\N	62491792	2016
1079	No Time for Goodbye	Linwood Barclay	\N	055380555X	2007
1080	Sickened	Julie Gregory	\N	553803077	2003
1081	The Medusa Plot	Gordon Korman	\N	545324092	2011
1082	Demon Lord of Karanda	David Eddings	\N	345363310	1988
1083	The Book of Ruth	Jane Hamilton	\N	385265700	1988
1084	War and Remembrance	Herman Wouk	\N	316954993	1978
1085	Before They Are Hanged	Joe Abercrombie	\N	575077883	2007
1086	Carpe Jugulum	Terry Pratchett	\N	61051586	1998
1087	The Appeal	John Grisham	\N	385515049	2008
1088	Full Black	Brad Thor	\N	141658661X	2011
1089	Four: The Transfer	Veronica Roth	\N	62285637	2013
1090	A Tale for the Time Being	Ruth Ozeki	\N	670026638	2013
1091	The Fixer Upper	Mary Kay Andrews	\N	60837381	2009
1092	The Good House	Ann Leary	\N	1250015545	2013
1093	The Vampire Armand	Anne Rice	\N	345434803	1998
1094	The Death of Bunny Munro	Nick Cave	\N	1847673767	2009
1095	I Was Here	Gayle Forman	\N	451471474	2015
1096	Longbourn	Jo Baker	\N	385351232	2013
1097	Time for Bed	Mem Fox	 Jane Dyer	152010661	1993
1098	Hoot	Carl Hiaasen	\N	440421705	2002
1099	Ask the Passengers	A.S. King	\N	316194689	2012
1100	Memory Man	David Baldacci	\N	1455559822	2015
1101	Breath	Tim Winton	\N	374116342	2008
1102	The Gods of War	Conn Iggulden	\N	044024160X	2006
1103	The Iron Queen	Julie Kagawa	\N	373210183	2011
1104	Scarlet	Marissa Meyer	\N	312642962	2013
1105	This is Water	David Foster Wallace	\N	316068225	2009
1106	The Executioner's Song	Norman Mailer	\N	375700811	1979
1107	The Blood of Olympus	Rick Riordan	\N	1484724917	2014
1108	The Liars' Club: A Memoir	Mary Karr	\N	143035746	1995
1109	Say Goodbye	Lisa Gardner	\N	553804332	2008
1110	Auschwitz: A New History	Laurence Rees	\N	158648303X	2005
1111	Mirror Mirror	Gregory Maguire	\N	60988657	2003
1112	Ladder of Years	Anne Tyler	\N	804113475	1995
1113	The Funhouse	Owen  West	 Dean Koontz	425142485	1980
1114	Paris to the Moon	Adam Gopnik	\N	375758232	2000
1115	Child of God	Cormac McCarthy	\N	679728740	1973
1116	Sapphique	Catherine Fisher	\N	340893613	2000
1117	Lightning	Dean Koontz	\N	425192032	1988
1118	Seduce Me at Sunrise	Lisa Kleypas	\N	312949812	2008
1119	S is for Silence	Sue Grafton	\N	425212696	2005
1120	Zomerhuis met zwembad	Herman Koch	\N	804138818	2011
1121	The Thirteenth Tale	Diane Setterfield	\N	743298020	2006
1122	The Wives of Henry VIII	Antonia Fraser	\N	140132937	1992
1123	Treasure Island	Robert Louis Stevenson	\N	753453800	1882
1124	The Eye of the World	Robert Jordan	\N	812511816	1990
1125	Bury Your Dead	Louise Penny	\N	312377045	2010
1126	Juliet, Naked	Nick Hornby	\N	1594488878	2009
1127	Second Chance	Jane Green	\N	670038571	2007
1128	The Gatecrasher	Madeleine Wickham	\N	312361270	1998
1129	Crooked House	Agatha Christie	\N	031298166X	1949
1130	Dance with the Devil	Sherrilyn Kenyon	\N	312984839	2003
1131	The Year of the Flood	Margaret Atwood	\N	385528779	2009
1132	Digging to America	Anne Tyler	\N	307263940	2006
1133	The Edge of Never	J.A. Redmerski	\N	1480095532	2012
1134	The Fire Eternal	Chris d'Lacey	\N	1846164257	2007
1135	Oh, the Places You'll Go!	Dr. Seuss	\N	679805273	1990
1136	Letter to My Daughter	Maya Angelou	\N	1400066124	2008
1137	The Girls	Lori Lansens	\N	316066346	2005
1138	Eona: The Last Dragoneye	Alison Goodman	\N	670063118	2011
1139	The Scottish Prisoner	Diana Gabaldon	\N	1409135195	2011
1140	Armor	John Steakley	\N	886773687	1984
1141	The Other Boleyn Girl	Philippa Gregory	\N	743227441	2001
1142	Stay Close	Harlan Coben	\N	525952276	2012
1143	The Last Templar	Raymond Khoury	\N	451219953	2006
1144	Sexing the Cherry	Jeanette Winterson	\N	802135781	1989
1145	Four Blind Mice	James Patterson	\N	747266921	2002
1146	Women Who Love Too Much	Robin Norwood	\N	671733419	1985
1147	Dissolution	C.J. Sansom	\N	330411969	2003
1148	The Gate Thief	Orson Scott Card	\N	765326582	2013
1149	Mountain of Black Glass	Tad Williams	\N	886779065	1999
1150	In Our Time	Ernest Hemingway	\N	684822761	1925
1151	Winter of the World	Ken Follett	\N	525952926	2012
1152	Ten Big Ones	Janet Evanovich	\N	312936222	2004
1153	Poison Study	Maria V. Snyder	\N	778324338	2005
1154	Outbreak	Robin Cook	\N	042510687X	1987
1155	A Room of One's Own	Virginia Woolf	\N	141183535	1929
1474	The Rats	James Herbert	\N	333761189	1974
1156	National Velvet	Enid Bagnold	\N	1405209496	1935
1157	Pastoralia	George Saunders	\N	747553866	2000
1158	The Fall of Five	Pittacus Lore	\N	61974618	2013
1159	Rise of the Elgen	Richard Paul Evans	\N	1442454148	2012
1160	Eagle Strike	Anthony Horowitz	\N	142406139	2003
1161	That Summer	Sarah Dessen	\N	670061107	1996
1162	Sycamore Row	John Grisham	\N	385537131	2013
1163	Case Histories	Kate Atkinson	\N	316010707	2004
1164	Love Warrior	Glennon Doyle Melton	\N	1250128544	2016
1165	Slash	Slash	 Anthony Bozza	61351423	2007
1166	Anastasia Krupnik	Lois Lowry	\N	553153382	1978
1167	The Commitments	Roddy Doyle	\N	749391685	1987
1168	North and South	John Jakes	\N	451200810	1982
1169	Curious George Rides a Bike	H.A. Rey	\N	1844285073	1952
1170	There's a Wocket in My Pocket	Dr. Seuss	\N	7169957	1974
1171	Here on Earth 	Alice Hoffman	\N	425169693	1997
1172	The Prize	Julie Garwood	\N	671702513	1991
1173	American Wife	Curtis Sittenfeld	\N	1400064759	2008
1174	A Hologram for the King	Dave Eggers	\N	193636574X	2012
1175	Night Film	Marisha Pessl	\N	140006788X	2013
1176	The Going-To-Bed Book	Sandra Boynton	\N	671449028	1982
1177	Extreme Measures	Vince Flynn	\N	1416599398	2008
1178	Virgin	James Patterson	\N	446609404	1980
1179	The Goblin Emperor	Katherine Addison	\N	076532699X	2014
1180	Oblivion	David Foster Wallace	\N	316010766	2004
1181	Eric	Terry Pratchett	\N	380821214	1990
1182	Echo Burning	Lee Child	\N	515133310	2001
1183	Lord Edgware Dies	Agatha Christie	\N	2314576	1933
1184	Heal Your Body	Louise L. Hay	\N	937611352	1976
1185	The Princess Diarist	Carrie Fisher	\N	399173595	2016
1186	When God Was a Rabbit	Sarah Winman	\N	755379284	2011
1187	Once We Were Brothers	Ronald H. Balson	\N	1250046394	2010
1188	Caraval	Stephanie Garber	\N	1250095255	2017
1189	Reunion in Death	J.D. Robb	\N	749934409	2002
1190	The Escape	David Baldacci	\N	1455521191	2014
1191	Storm Born	Richelle Mead	\N	1420100963	2008
1192	Night School	Lee Child	 Dick Hill	804192979	2016
1193	The Secret Life of Bees	Sue Monk Kidd	\N	142001740	2001
1194	Prisoner of my desire 	Johanna Lindsey	\N	380756277	1991
1195	The Angel of Darkness	Caleb Carr	\N	345427637	1997
1196	Bones Are Forever	Kathy Reichs	\N	1439102430	2012
1197	Fledgling	Octavia E. Butler	\N	446696161	2005
1198	The Passenger	Lisa Lutz	\N	1451686633	2016
1199	The Constant Princess	Philippa Gregory	\N	743272498	2005
1200	Superfudge	Judy Blume	\N	142408808	1980
1201	A Time to Kill	John Grisham	\N	385338600	1989
1202	Amy & Matthew	Cammie McGovern	\N	62271121	2014
1203	Peace Like a River	Leif Enger	\N	802139256	2001
1204	Simply Irresistible	Rachel Gibson	\N	380790076	1998
1205	Crazy For You	Jennifer Crusie	\N	312932812	1999
1206	The Boleyn Inheritance	Philippa Gregory	\N	743272501	2006
1207	Princess Academy	Shannon Hale	\N	1599900734	2005
1208	The Perfect Play	Jaci Burton	\N	425238814	2011
1209	Bookends	Jane Green	\N	767907817	2000
1210	Lon Po Po	Ed Young	\N	399216197	1989
1211	The 19th Wife	David Ebershoff	\N	1400063973	2008
1212	A Man in Full	Tom Wolfe	\N	553381334	1998
1213	Academ's Fury	Jim Butcher	\N	441013406	2005
1214	The Little Stranger	Sarah Waters	\N	1594488800	2009
1215	Shiver	Maggie Stiefvater	\N	545123267	2009
1216	Eon	Greg Bear	\N	812520475	1984
1217	Noble House	James Clavell	\N	440164842	1981
1218	Scoop	Evelyn Waugh	\N	141187492	1937
1219	Fill-in boyfrined	Kasie West	\N	006233638X	2015
1220	Post Office	Charles Bukowski	\N	876850867	1971
1221	Down Under	Bill Bryson	\N	767903862	2000
1222	The Golden Lily	Richelle Mead	\N	1595143181	2012
1223	Rebel Belle	Rachel Hawkins	\N	399256938	2014
1224	Torn	Amanda Hocking	\N	1250006325	2010
1225	Slammerkin	Emma Donoghue	\N	156007479	2000
1226	Jennifer Government	Max Barry	\N	349117624	2002
1227	Allegiant	Veronica Roth	\N	7524277	2013
1228	Mitosis	Brandon Sanderson	\N	449818438	2013
1229	Lucky Jim	Kingsley Amis	 David Lodge	140186301	1954
1230	One Summer	David Baldacci	\N	446583146	2011
1231	Hunger 	Michael  Grant	\N	61449067	2009
1232	A Work in Progress	Connor Franta	\N	1476791619	2015
1233	Hate List	Jennifer Brown	\N	316041440	2009
1234	A Great and Terrible Beauty	Libba Bray	\N	689875347	2003
1235	Six of Crows	Leigh Bardugo	\N	1627792120	2015
1236	The Crossing 	Cormac McCarthy	\N	394574753	1994
1237	Foundation and Empire	Isaac Asimov	\N	553803727	1952
1238	Gone with the Wind	Margaret Mitchell	\N	446675539	1936
1239	The Girl Next Door	Jack Ketchum	\N	843955430	1989
1240	Deep Six	Clive Cussler	\N	1416516859	1984
1241	Elizabeth Street	Laurie Fabiano	\N	1442152613	2006
1242	The Fall of Hyperion	Dan Simmons	\N	553288202	1990
1243	Uprooted	Naomi Novik	\N	804179034	2015
1244	The Secret History	Donna Tartt	\N	1400031702	1992
1245	It's Not Summer Without You	Jenny Han	\N	1416995552	2010
1246	Drei Kameraden	Erich Maria Remarque	\N	449912426	1936
1247	A Fistful of Charms	Kim Harrison	\N	60788194	2006
1248	Whitney, My Love	Judith McNaught	\N	1416530711	1985
1249	Four Past Midnight	Stephen King	\N	450542882	1990
1250	The Thorn Birds	Colleen McCullough	\N	380018179	1977
1251	That Night	Chevy Stevens	\N	1250034604	2014
1252	Broken Angels	Richard K. Morgan	\N	345457714	2003
1253	True Blue	David Baldacci	\N	446195510	2009
1254	The magician's nephew	C.S. Lewis	\N	60764902	1953
1255	La peste	Albert Camus	 Stuart Gilbert	679720219	1947
1256	The Fury and Dark Reunion	L.J. Smith	\N	61140988	2007
1257	The Da Vinci Code	Dan Brown	\N	307277674	2003
1258	Ninth Key	Meg Cabot	\N	60725125	2001
1259	Envy	Anna Godbersen	\N	61345725	2009
1260	Skippy Dies	Paul Murray	\N	241141826	2010
1261	The Lost Colony	Eoin Colfer	\N	786849568	2006
1262	Barefoot	Elin Hilderbrand	\N	316018589	2007
1263	Owl Moon	Jane Yolen	 John Schoenherr	399214577	1987
1264	Defending Jacob	William Landay	\N	385344228	2012
1265	Plum Lovin'	Janet Evanovich	\N	312306342	2007
1266	The Psychopath Test	Jon Ronson	\N	1594485755	2011
1267	Ashes to Ashes	Tami Hoag	\N	553589172	1999
1268	Foxglove Summer	Ben Aaronovitch	\N	575132507	2014
1269	It Happened One Autumn	Lisa Kleypas	\N	60562498	2005
1270	The Wright Brothers	David McCullough	\N	1476728747	2015
1271	The Prefect	Alastair Reynolds	\N	575077166	2007
1272	Undaunted Courage	Stephen E. Ambrose	\N	074347788X	1996
1273	The History of Love	Nicole Krauss	\N	393328627	2005
1274	Sisterland	Curtis Sittenfeld	\N	1400068312	2013
1275	Bloodfever	Karen Marie Moning	\N	038533916X	2007
1276	In His Steps	Charles M. Sheldon	\N	1557488150	1896
1277	Wife by wednesday	Catherine Bybee	\N	1467964409	2011
1278	The First Bad Man	Miranda July	\N	1439172560	2015
1279	Lover Avenged, part one	J.R. Ward	\N	451229851	2010
1280	Lover Enshrined, part one	J.R. Ward	\N	451222725	2008
1281	Redeployment	Phil Klay	\N	1594204993	2014
1282	The Winds of War	Herman Wouk	\N	316952664	1971
1283	Morrigan's Cross	Nora Roberts	\N	515141658	2006
1284	The Other Typist	Suzanne Rindell	\N	241963745	2013
1285	Just Kids	Patti Smith	\N	006621131X	2010
1286	The Dogs of Babel	Carolyn  Parkhurst	\N	316778508	2003
1287	Lit	Mary Karr	\N	60596988	2008
1288	Cat Among the Pigeons	Agatha Christie	\N	425205967	1959
1289	The Tortilla Curtain	T.C. Boyle	\N	014023828X	1995
1290	Gossip Girl	Cecily von Ziegesar	\N	316910333	2002
1291	Erak's Ransom	John Flanagan	\N	1741662095	2007
1292	The Fallen Angel	Daniel Silva	\N	62073125	2012
1293	The Alexandria Link	Steve Berry	\N	345485750	2007
1294	Reboot	Amy Tintera	\N	62217070	2013
1295	Anybody Out There?	Marian Keyes	\N	61240850	2006
1296	Little Altars Everywhere	Rebecca Wells	\N	60759968	1992
1297	The Last Time They Met	Anita Shreve	\N	316713732	2001
1298	Summer Sisters	Judy Blume	\N	440243750	1998
1299	Old Man's War	John Scalzi	\N	765348276	2005
1300	Love Walked In	Marisa de los Santos	\N	452287898	2005
1301	Bared to You	Sylvia Day	\N	425263908	2012
1302	Ordinary Grace	William Kent Krueger	\N	1451645821	2013
1303	Tuck Everlasting	Natalie Babbitt	\N	374480095	1975
1304	Mercy	Julie Garwood	\N	743430336	2001
1305	Embrace the Night	Karen Chance	\N	451461991	2008
1306	The Gates of Rome	Conn Iggulden	\N	440240948	2002
1307	Seating Arrangements	Maggie Shipstead	\N	307599469	2012
1308	Storm Warning	Linda Sue Park	\N	545060494	2010
1309	C is for Corpse	Sue Grafton	\N	312939019	1986
1310	Lockdown	Alexander Gordon Smith	\N	374324913	2009
1311	Gravity's Rainbow	Thomas Pynchon	\N	143039946	1973
1312	The Venetian Betrayal	Steve Berry	\N	345485777	2007
1313	The Colour of Magic	Terry Pratchett	\N	60855924	1983
1314	The Analyst	John Katzenbach	\N	552150215	2002
1315	See Me	Nicholas Sparks	\N	1455520616	2015
1316	Snow Falling on Cedars	David Guterson	\N	067976402X	1994
1317	True Grit	Charles Portis	\N	1585673692	1968
1318	Pyongyang	Guy Delisle	\N	1897299214	2003
1319	The Golden Fool	Robin Hobb	\N	553582453	2002
1320	One Summer: America 1927	Bill Bryson	\N	767919408	2013
1321	Outpost	Ann Aguirre	\N	312650094	2012
1322	Evil Star	Anthony Horowitz	\N	439679966	2006
1323	Joyland	Stephen King	\N	1781162646	2013
1324	Lies	Michael  Grant	\N	61449091	2010
1325	Blue Smoke	Nora Roberts	\N	515141399	2005
1326	Fade	Lisa McMann	\N	1416953582	2009
1327	Goodnight Nobody	Jennifer Weiner	\N	743470125	2005
1328	Something Wonderful	Judith McNaught	\N	671737635	1988
1329	Catch Me	Lisa Gardner	\N	525952764	2012
1330	Candy Girl	Diablo Cody	\N	1592402739	2005
1331	Winter Prey	John Sandford	\N	425141233	1993
1332	Firefight	Brandon Sanderson	\N	385743580	2015
1333	Odd Apocalypse	Dean Koontz	\N	307990672	2012
1334	Ghost Story	Jim Butcher	\N	045146379X	2011
1335	Finnikin of the Rock	Melina Marchetta	\N	670072818	2008
1336	Witness	Sandra Brown	\N	044619154X	1995
1337	Touch the Dark	Karen Chance	\N	451460936	2006
1338	Alexander Hamilton	Ron Chernow	\N	143034758	2004
1339	The Immortal Rules	Julie Kagawa	\N	373210515	2012
1340	Collected Poems 1909-1962	T.S. Eliot	\N	151189781	1963
1341	The Dragon Reborn 	Robert Jordan	\N	765305119	1991
1342	The 158-Pound Marriage	John Irving	\N	345417968	1974
1343	Princess Mia	Meg Cabot	\N	60724617	2007
1344	The Gods of Mars	Edgar Rice Burroughs	\N	345324390	1913
1345	Knife of Dreams	Robert Jordan	\N	812577566	2005
1346	Under the Skin	Michel Faber	\N	1841954802	2000
1347	The Night Watch	Sarah Waters	\N	1594482306	2006
1348	Magonia	Maria Dahvana Headley	\N	62320521	2015
1349	Kill Shot	Vince Flynn	\N	1416595201	2012
1350	Danger in the Shadows	Dee Henderson	\N	1414310552	1999
1351	How to Be Popular	Meg Cabot	\N	60880120	2006
1352	The Stone Monkey	Jeffery Deaver	\N	1410400964	2002
1353	The Brethren	John Grisham	\N	385339674	2000
1354	Sojourn (Dark Elf #3)	R.A. Salvatore	\N	1560760478	1990
1355	The Reckoning	Kelley Armstrong	\N	1841497126	2010
1356	Scarlet	A.C. Gaughen	\N	802723462	2012
1357	I Let You Go	Clare Mackintosh	\N	751554154	2016
1358	Slam	Nick Hornby	\N	399250484	2007
1359	Vengeance in Death	J.D. Robb	\N	749934131	1997
1360	A Piece of Cake: A Memoir	Cupcake Brown	\N	1400052297	2006
1361	Poison Princess	Kresley Cole	\N	1442436646	2012
1362	Underworld	Meg Cabot	\N	545415071	2012
1363	The Bazaar of Bad Dreams	Stephen King	\N	1501111671	2015
1364	Timequake	Kurt Vonnegut Jr.	\N	99267543	1997
1365	The Mistake	Elle Kennedy	\N	151166066X	2015
1366	Succubus Heat	Richelle Mead	\N	553820273	2009
1475	The One	Kiera Cass	\N	62059998	2014
1367	Beat the Reaper	Josh Bazell	\N	316032220	2008
1368	No Second Chance	Harlan Coben	\N	451210557	2003
1369	Asterios Polyp	David Mazzucchelli	\N	307377326	2009
1370	Flight of the Intruder	Stephen Coonts	\N	1591141273	1986
1371	The Honor of the Queen	David Weber	\N	671721720	1993
1372	The Twelfth Card	Jeffery Deaver	\N	739455834	2005
1373	Waiting For You	Susane Colasanti	\N	670011304	2009
1374	Funny Girl	Nick Hornby	\N	1594205418	2014
1375	Kiss the Girls	James Patterson	\N	446677388	1995
1376	Evergreen	Belva Plain	\N	440132940	1978
1377	Sweetbitter	Stephanie Danler	\N	1101875941	2016
1378	Dream Warrior	Sherrilyn Kenyon	\N	749909056	2009
1379	Watermelon	Marian Keyes	\N	99489988	1995
1380	Dark Reunion	L.J. Smith	\N	61059927	1991
1381	Night Fall	Nelson DeMille	\N	446616621	2004
1382	Eat to Live	Joel Fuhrman	\N	316735507	2003
1383	Spirit Bound	Richelle Mead	\N	1595142509	2010
1384	Soul of the Fire	Terry Goodkind	\N	812551494	1999
1385	Carmilla	J. Sheridan Le Fanu	\N	809510839	1872
1386	Before I Go to Sleep	S.J. Watson	\N	62060554	2011
1387	The King Beyond the Gate	David Gemmell	\N	1857236653	1985
1388	Into the Still Blue	Veronica Rossi	\N	62072099	2014
1389	The Darkest Night	Gena Showalter	\N	373772467	2008
1390	In Watermelon Sugar	Richard Brautigan	\N	99437597	1968
1391	White Fang	Jack London	\N	439236193	1906
1392	Herzog	Saul Bellow	 Philip Roth	142437298	1964
1393	The Passion	Jeanette Winterson	\N	802135226	1987
1394	The Fall of Reach	Eric S. Nylund	\N	345451325	2001
1395	The Fiery Heart	Richelle Mead	\N	1595143203	2013
1396	Captivate	Carrie Jones	\N	1599903423	2010
1397	Prince of Fire	Daniel Silva	\N	451215737	2005
1398	Left Drowning	Jessica Park	\N	1477817158	2013
1399	Reunion	Meg Cabot	\N	60725133	2001
1400	My Soul to Keep	Rachel Vincent	\N	373210051	2010
1401	The Sun Also Rises	Ernest Hemingway	\N	743297334	1926
1402	Touch of Frost	Jennifer Estep	\N	758266928	2011
1403	The Shadow of the Torturer	Gene Wolfe	\N	671540661	1980
1404	Americanah	Chimamanda Ngozi Adichie	\N	307271080	2013
1405	The Man from St. Petersburg	Ken Follett	\N	451208706	1982
1406	Storm Front	Jim Butcher	\N	451457811	2000
1407	The Atlantis Complex	Eoin Colfer	\N	1423128192	2010
1408	Magician's Gambit	David Eddings	\N	345335457	1983
1409	Soul On Ice	Eldridge Cleaver	\N	038533379X	1968
1410	Belinda	Anne Rice	 Anne Rampling	425176657	1986
1411	The Fourth Estate	Jeffrey Archer	\N	61092037	1996
1412	The One Tree	Stephen R. Donaldson	\N	345418476	1982
1413	Llama, Llama Red Pajama	Anna Dewdney	\N	670059838	2005
1414	Secrets of a shoe addict	Beth Harbison	\N	312348266	2008
1415	Rosemary and Rue	Seanan McGuire	\N	756405718	2009
1416	Distant Shores	Kristin Hannah	\N	345450728	2002
1417	Columbine	Dave Cullen	\N	446546933	2009
1418	The Fifth Elephant	Terry Pratchett	\N	552154229	1999
1419	The Last Straw	Jeff Kinney	\N	810970686	2009
1420	Marathon Man	William Goldman	\N	330247042	1974
1421	The Enchanted	Rene Denfeld	\N	62285505	2014
1422	The Terminal Man	Michael Crichton	\N	60092572	1972
1423	Broken	Kelley Armstrong	\N	553588184	2006
1424	Succubus Shadows 	Richelle Mead	\N	758232004	2010
1425	Saving Francesca	Melina Marchetta	\N	375829830	2003
1426	Silver Girl	Elin Hilderbrand	\N	031609966X	2011
1427	The Shifting Fog	Kate Morton	\N	330448447	2006
1428	Silverthorn	Raymond E. Feist	\N	586064176	1985
1429	Misery	Stephen King	\N	450417395	1987
1430	The Lorax	Dr. Seuss	\N	679889108	1971
1431	Homer Price	Robert McCloskey	\N	140309276	1942
1432	House of Chains	Steven Erikson	\N	765348810	2004
1433	The Darkest Minds	Alexandra Bracken	\N	1423157370	2012
1434	The Winner's Curse	Marie Rutkoski	\N	374384681	2014
1435	Antrax	Terry Brooks	\N	345397673	2001
1436	Darth Vader and Son	Jeffrey Brown	\N	145210655X	2012
1437	Virtual Light	William Gibson	\N	140157727	1993
1438	Night World, No. 2	L.J. Smith	\N	1416974512	2008
1439	The Sellout	Paul Beatty	\N	374260508	2015
1440	The Magus	John Fowles	\N	316296198	1965
1441	We Are Not Ourselves	Matthew  Thomas	\N	147675666X	2014
1442	Come Home	Lisa Scottoline	\N	312380828	2012
1443	Airhead 	Meg Cabot	\N	545040523	2008
1444	Thud!	Terry Pratchett	\N	552152676	2006
1445	Rapunzel	Paul O. Zelinsky	\N	525456074	1997
1446	Strange Highways	Dean Koontz	\N	446531383	1995
1447	Night Play	Sherrilyn Kenyon	\N	312992424	2004
1448	Little Women	Louisa May Alcott	\N	451529308	1868
1449	Lost & Found	Jacqueline Sheehan	\N	61128643	2007
1450	Sad Cypress	Agatha Christie	\N	7120710	1940
1451	Heft	Liz Moore	\N	393081508	2012
1452	Entice	Carrie Jones	\N	1408810441	2010
1453	Gray Mountain	John Grisham	\N	038553714X	2014
1454	Ashley Bell	Dean Koontz	\N	345545966	2015
1455	A Year in the Merde	Stephen Clarke	\N	1582346178	2004
1456	Pompeii	Robert   Harris	\N	812974611	2003
1457	Napalm & Silly Putty	George Carlin	\N	786887583	2001
1458	The Last Nude	Ellis Avery	\N	1594488134	2012
1459	Forever Odd	Dean Koontz	\N	553588265	2005
1460	The Wednesday Wars	Gary D. Schmidt	\N	618724834	2007
1461	Requiem	Lauren Oliver	\N	62014536	2013
1462	Blue Bloods	Melissa de la Cruz	\N	786838922	2006
1463	The Long Goodbye	Raymond Chandler	\N	394757688	1953
1464	Revelation Space	Alastair Reynolds	\N	441009425	2000
1465	Return to Paradise	Simone Elkeles	\N	738718688	2010
1466	Hop on Pop	Dr. Seuss	\N	7158491	1963
1467	Sempre	J.M. Darhower	\N	1456527738	2014
1468	My Life on the Road	Gloria Steinem	\N	679456201	2015
1469	The Dark Hills Divide	Patrick Carman	\N	439700930	2003
1470	The Argonauts	Maggie Nelson	\N	1555977073	2015
1471	La catedral del mar	Ildefonso Falcones	\N	307376656	2006
1472	Halt's Peril	John Flanagan	\N	1741663024	2009
1476	Die for Me	Amy Plum	\N	62004018	2011
1477	Imitation in Death	J.D. Robb	\N	749934433	2003
1478	The Glass Palace	Amitav Ghosh	\N	375758771	2000
1479	Gut gegen Nordwind	Daniel Glattauer	\N	3552060413	2006
1480	In One Person	John Irving	\N	1451664125	2012
1481	The Ruins	Scott B. Smith	\N	1400043875	2006
1482	Not Quite Dating	Catherine Bybee	\N	1612187145	2012
1483	Simply Irresistible	Jill Shalvis	\N	044657161X	2010
1484	Thirteen Reasons Why	Jay Asher	\N	1595141715	2007
1485	The Confession	John Grisham	\N	385528043	2010
1486	Neverwhere	Neil Gaiman	\N	60557818	1996
1487	Worth Dying For	Lee Child	\N	440339340	2010
1488	The Horse Whisperer	Nicholas Evans	\N	440222656	1995
1489	Foreplay	Sophie Jordan	\N	62279874	2013
1490	Minding Frankie	Maeve Binchy	\N	1409113965	2010
1491	Veil of Midnight	Lara Adrian	\N	440244498	2008
1492	The Caine Mutiny	Herman Wouk	\N	316955108	1951
1493	Anne of the Island	L.M. Montgomery	\N	553213172	1915
1494	Five on a Treasure Island 	Enid Blyton	\N	340796146	1942
1495	Devil in Winter 	Lisa Kleypas	\N	006056251X	2006
1496	V.	Thomas Pynchon	\N	2020418770	1963
1497	The Enemy	Charlie Higson	\N	014132502X	2009
1498	Arthur & George	Julian Barnes	\N	1400097037	2005
1499	The Keepsake	Tess Gerritsen	\N	345497627	2008
1500	The Emperor's Code	Gordon Korman	\N	545060486	2010
1501	Unseen	Karin Slaughter	\N	345539478	2013
1502	The Lover's Dictionary	David Levithan	\N	374193681	2011
1503	The Sweet Gum Tree	Katherine Allred	\N	1419953249	2005
1504	Burmese Days	George Orwell	\N	1421808307	1934
1505	The Apostle	Brad Thor	\N	1416586571	2009
1506	Top Secret Twenty-One	Janet Evanovich	\N	345542924	2014
1507	The Search	Iris Johansen	\N	553589482	2000
1508	Dead Poets Society 	N.H. Kleinbaum	\N	553282980	1988
1509	New York	Edward Rutherfurd	\N	385521383	2009
1510	Princess in Love	Meg Cabot	\N	64472809	2001
1511	Bloodline	James Rollins	\N	61784796	2012
1512	Prom and Prejudice	Elizabeth Eulberg	\N	545240778	2011
1513	The Seventh Scroll	Wilbur Smith	\N	312957572	1995
1514	Dry: A Memoir	Augusten Burroughs	\N	312423799	2003
1515	Hawksong	Amelia Atwater-Rhodes	\N	044023803X	2003
1516	Every Thing On It	Shel Silverstein	\N	61998168	2011
1517	How Music Works	David Byrne	\N	1936365537	2012
1518	Monument 14	Emmy Laybourne	\N	312569033	2012
1519	No Rest for the Wicked	Kresley Cole	\N	1416509887	2006
1520	My Year of Meats	Ruth Ozeki	\N	140280464	1998
1521	Attachments	Rainbow Rowell	\N	525951989	2011
1522	Leviathan Wakes	James S.A. Corey	\N	1841499889	2011
1523	Sh*t My Dad Says	Justin Halpern	\N	61992704	2010
1524	God Help the Child	Toni Morrison	\N	307594173	2014
1525	White Night	Jim Butcher	\N	451461401	2007
1526	The Heretic Queen	Michelle Moran	\N	307381757	2008
1527	My Soul to Steal	Rachel Vincent	\N	373210272	2010
1528	In Real Life	Cory Doctorow	 Jen Wang	1596436581	2014
1529	Shades of Midnight	Lara Adrian	\N	440245265	2009
1530	Blaze	Richard Bachman	 Stephen King	141655484X	2007
1531	Red Rising	Pierce Brown	\N	345539788	2014
1532	Eeny Meeny	M.J. Arlidge	\N	451475496	2014
1533	A Color of His Own	Leo Lionni	\N	375836977	1975
1534	Speak	Laurie Halse Anderson	\N	014131088X	1999
1535	Days with Frog and Toad	Arnold Lobel	\N	64440583	1979
1536	My Friend Dahmer	Derf Backderf	\N	1419702173	2012
1537	The Ambassador's Mission	Trudi Canavan	\N	316037834	2010
1538	Keep Holding On	Susane Colasanti	\N	670012254	2012
1539	A Beautiful Wedding	Jamie McGuire	\N	1476759545	2013
1540	Ship of Destiny	Robin Hobb	\N	553575651	2000
1541	March	Geraldine Brooks	\N	143036661	2004
1542	First Lord's Fury	Jim Butcher	\N	044101769X	2008
1543	Horton Hears a Who!	Dr. Seuss	\N	679800034	1954
1544	Horton Hatches the Egg	Dr. Seuss	\N	7175191	1940
1545	Tramp for the Lord	Corrie ten Boom	\N	515089931	1974
1546	The Cat in the Hat	Dr. Seuss	\N	039480001X	1957
1547	Live and Let Die	Ian Fleming	\N	142003239	1954
1548	Into the Wilderness	Sara Donati	\N	553578529	1998
1549	Doll Bones	Holly Black	 Eliza Wheeler	1416963987	2013
1550	West Side Story	Irving Shulman	\N	671725661	1961
1551	Chasm City	Alastair Reynolds	\N	441010644	2001
1552	Decision Points	George W. Bush	\N	307590615	2010
1553	Fever	Lauren DeStefano	\N	144240907X	2012
1554	Rules of Civility	Amor Towles	\N	670022691	2011
1555	UnSouled	Neal Shusterman	\N	147111810X	2013
1556	A Raisin in the Sun	Lorraine Hansberry	\N	375508333	1959
1557	Love Bites	Lynsay Sands	\N	505525534	2004
1558	A Fraction of the Whole	Steve Toltz	\N	385521723	2008
1559	Lost Light	Michael Connelly	\N	446611638	2003
1560	Queen Song	Victoria Aveyard	\N	62422960	2015
1561	Open Season	C.J. Box	\N	042518546X	2001
1562	Fortune's Rocks	Anita Shreve	\N	316734837	1999
1563	Still Missing	Chevy Stevens	\N	312595670	2010
1564	Flyte	Angie Sage	 Mark Zug	60577363	2006
1565	The Catcher in the Rye	J.D. Salinger	\N	316769177	1951
1566	Deerskin	Robin McKinley	\N	441012396	1993
1567	Complete Me	J. Kenner	\N	345545850	2013
1568	Fatal Vision	Joe McGinniss	\N	451165667	1983
1569	Holding Up the Universe	Jennifer Niven	\N	385755929	2016
1570	The Ice Twins	S.K. Tremayne	\N	7563035	2015
1571	The Dream Thieves	Maggie Stiefvater	\N	545424941	2013
1572	Last Man Standing	David Baldacci	\N	446611778	2001
1573	Darkly Dreaming Dexter	Jeff Lindsay	\N	307277887	2004
1574	Oscar and Lucinda	Peter Carey	\N	702229784	1988
1575	Midnight Bayou	Nora Roberts	\N	515142867	2001
1576	Whiteout	Ken Follett	\N	451215710	2004
1577	What I Loved	Siri Hustvedt	\N	340682388	2002
1578	Bella Tuscany	Frances Mayes	\N	076790284X	1999
1579	The Onion Field	Joseph Wambaugh	\N	385341598	1973
1580	My Soul to Take	Rachel Vincent	\N	373210035	2009
1581	The Dead Girls' Dance	Rachel Caine	\N	451220897	2007
1582	Deadline	Mira Grant	\N	031608106X	2011
1583	Shades of Earth	Beth Revis	\N	1595143998	2013
1584	Find Her	Lisa Gardner	\N	525954570	2016
1585	Abandon	Blake Crouch	\N	312537409	2009
1586	The Valley of Amazement	Amy Tan	\N	62107313	2013
1587	A Suitable Boy	Vikram Seth	\N	60786523	1993
1588	Heart of the Sea	Nora Roberts	\N	515128554	2000
1589	A Pocket Full of Rye	Agatha Christie	\N	451199863	1953
1590	Lethal	Sandra Brown	\N	1455501476	2011
1591	The Ask and the Answer	Patrick Ness	\N	1406310263	2009
1592	Imperium	Robert   Harris	\N	074326603X	2006
1593	The Emperor's Soul	Brandon Sanderson	\N	1616960922	2012
1594	Bitten	Kelley Armstrong	\N	452286034	2001
1595	Ark Angel	Anthony Horowitz	\N	142407380	2005
1596	The Girl Before	J.P. Delaney	\N	425285049	2017
1597	Alas, Babylon	Pat Frank	\N	60741872	1959
1598	Ceremony in Death	J.D. Robb	\N	749934123	1997
1599	Sula	Toni Morrison	\N	452283868	1973
1600	The Light Fantastic	Terry Pratchett	\N	61020702	1986
1601	Origin in Death	J.D. Robb	\N	042520426X	2005
1602	Promise Not to Tell	Jennifer McMahon	\N	61143316	2007
1603	L.A. Confidential	James Ellroy	\N	99366711	1990
1604	In the Skin of a Lion	Michael Ondaatje	\N	679772669	1987
1605	Gregor the Overlander	Suzanne Collins	\N	043977134X	2003
1606	Money	Martin Amis	\N	99461889	1984
1607	Ashes of Midnight	Lara Adrian	\N	440244501	2009
1608	Amy & Isabelle	Elizabeth Strout	\N	375705198	1998
1609	Winger	Andrew  Smith	\N	1442444924	2013
1610	The Redhead Revealed	Alice Clayton	\N	1936305380	2010
1611	A Storm of Swords	George R.R. Martin	\N	055357342X	2000
1612	Left Neglected	Lisa Genova	\N	1439164630	2011
1613	The Alienist	Caleb Carr	\N	812976142	1994
1614	Broken Prey	John Sandford	\N	425204308	2005
1615	To Say Nothing of the Dog	Connie Willis	\N	553575384	1998
1616	The Dovekeepers	Alice Hoffman	\N	145161747X	2011
1617	Big Little Lies	Liane Moriarty	\N	399167064	2014
1618	Black Powder War	Naomi Novik	\N	345481305	2006
1619	The Kill Order	James Dashner	\N	385742886	2012
1620	The Last Sin Eater	Francine Rivers	\N	1414315716	1998
1621	The Hours	Michael Cunningham	\N	312305060	1998
1622	The Breadwinner	Deborah Ellis	\N	888994168	2000
1623	Killer 	Sara Shepard	\N	61566128	2009
1624	Bay of Sighs	Nora Roberts	\N	042528011X	2016
1625	Honour Among Thieves	Jeffrey Archer	\N	312933533	1993
1626	Ex-Heroes	Peter Clines	\N	804136572	2010
1627	Wideacre	Philippa Gregory	\N	743249291	1987
1628	More Than a Carpenter	Josh McDowell	\N	842345523	1977
1629	Johnny Got His Gun	Dalton Trumbo	\N	806512814	1939
1630	The Naked and the Dead	Norman Mailer	\N	312265050	1948
1631	Secret Daughter	Shilpi Somaya Gowda	\N	61922315	2010
1632	Keys to Drawing	Bert Dodson	\N	891343377	1985
1633	Shanghai Girls	Lisa See	\N	1400067111	2009
1634	Dept. of Speculation	Jenny Offill	\N	385350813	2014
1635	Dragon's Oath	P.C. Cast	 Kristin Cast	1250000238	2011
1636	Sunshine	Robin McKinley	\N	515138819	2003
1637	Indignation	Philip Roth	\N	054705484X	2008
1638	Sophie & Carter	Chelsea Fine	\N	1935089447	2011
1639	Kushiel's Scion	Jacqueline Carey	\N	044661002X	2006
1640	The Wee Free Men	Terry Pratchett	\N	60012382	2003
1641	The Humans	Matt Haig	\N	1476727910	2013
1642	Bloodlines	Richelle Mead	\N	1595143173	2011
1643	The God Delusion	Richard Dawkins	\N	618680004	2006
1644	Death Masks	Jim Butcher	\N	451459407	2003
1645	Cloud Atlas	David Mitchell	\N	375507256	2004
1646	The Princess Diaries	Meg Cabot	\N	613371658	2000
1647	Mouse Paint	Ellen Stoll Walsh	\N	152002650	1989
1648	A Murder is Announced	Agatha Christie	\N	1579126294	1950
1649	The Proposition	Katie Ashley	\N	1480114480	2012
1650	The Finkler Question	Howard Jacobson	\N	1408808870	2010
1651	Just Like Heaven	Julia Quinn	\N	749941995	2011
1652	Born in Ice	Nora Roberts	\N	515116750	1995
1653	Saint	Ted Dekker	\N	1595540067	2006
1654	Takedown	Brad Thor	\N	743271181	2006
1655	Shadows Linger	Glen Cook	\N	812508424	1984
1656	Ulysses	James Joyce	\N	679722769	1922
1657	Bad Kitty	Nick Bruel	\N	1596430699	2005
1658	Sundiver	David Brin	\N	553269828	1980
1659	State of Wonder	Ann Patchett	\N	62049801	2011
1660	The Arctic Incident	Eoin Colfer	\N	786851473	2002
1661	Brain Droppings	George Carlin	\N	786891122	1997
1662	The Goddess Test	Aimee Carter	\N	373210264	2011
1663	Hana	Lauren Oliver	\N	62124366	2011
1664	What Katy Did  	Susan Coolidge	\N	543904709	1872
1665	Redwall	Brian Jacques	\N	1862301387	1986
1666	Some Girls Bite	Chloe Neill	\N	451226259	2009
1667	The Time Paradox	Eoin Colfer	\N	1423108361	2008
1668	Coming Home	Rosamunde Pilcher	\N	340752475	1995
1669	How to Fall in Love	Cecelia Ahern	\N	000735049X	2014
1670	Savvy	Ingrid Law	\N	803733062	2008
1671	Exile's Return	Raymond E. Feist	\N	380803275	2004
1672	The Lost Stories	John Flanagan	\N	399256180	2011
1673	Curse the Dawn	Karen Chance	\N	451412702	2009
1674	Peak	Roland Smith	\N	152024174	2007
1675	Mystic River	Dennis Lehane	\N	60584750	2001
1676	Ancillary Justice	Ann Leckie	\N	031624662X	2013
1677	Loving Frank	Nancy Horan	\N	345494997	2007
1678	Playing For Pizza	John Grisham	\N	385525001	2007
1679	The Undead Pool	Kim Harrison	\N	61957933	2014
1680	Jemima J	Jane Green	\N	767905180	2001
1681	Damaged	H.M. Ward	\N	061579615X	2013
1682	Rabbit Is Rich	John Updike	\N	140249435	1981
1683	The Midwife's Apprentice	Karen Cushman	\N	006440630X	1995
1684	The Weight of Silence	Heather Gudenkauf	\N	077832740X	2008
1685	The Renegades of Pern	Anne McCaffrey	\N	345419391	1989
1686	The Last Man	Vince Flynn	\N	141659521X	2012
1687	Underground Airlines	Ben H. Winters	\N	316261246	2016
1688	The Target	David Baldacci	\N	1455521205	2014
1689	Ella Enchanted	Gail Carson Levine	\N	590920685	1997
1690	Look Again	Lisa Scottoline	\N	312380720	2009
1691	Fifty Shades Freed	E.L. James	\N	345803507	2012
1692	Festive in Death	J.D. Robb	\N	399164448	2014
1693	Perfect	Natasha Friend	\N	1571316515	2004
1694	Tris's Book	Tamora Pierce	\N	590554093	1998
1695	A Farewell to Arms	Ernest Hemingway	\N	99910101	1929
1696	The Bad Place	Dean Koontz	\N	425195481	1989
1697	Wicked Ties	Shayla Black	\N	425213617	2007
1698	Ptolemy's Gate	Jonathan Stroud	\N	786818611	2006
1699	Seriously...I'm Kidding	Ellen DeGeneres	\N	446585025	2011
1700	Dare You To	Katie McGarry	\N	373210639	2013
1701	Into the Wild	Jon Krakauer	\N	385486804	1996
1702	Swamplandia!	Karen Russell	\N	307263991	2011
1703	Beautiful Redemption	Jamie McGuire	\N	1502541858	2015
1704	The Book of Speculation	Erika Swyler	\N	125005480X	2015
1705	The Secret Place	Tana French	\N	670026328	2014
1706	One With You	Sylvia Day	\N	1250109302	2016
1707	Destroy Me	Tahereh Mafi	\N	62208195	2012
1708	The Scorch Trials	James Dashner	\N	385738757	2010
1709	Transfer of Power	Vince Flynn	\N	1416516352	1999
1710	Entwined	Heather Dixon	\N	62001035	2011
1711	Last Chance Saloon	Marian Keyes	\N	60086246	1999
1712	The Power of Six	Pittacus Lore	\N	61974552	2011
1713	Avalon High	Meg Cabot	\N	60755865	2005
1714	Death at La Fenice	Donna Leon	\N	006074068X	1992
1715	The Cardinal of the Kremlin	Tom Clancy	\N	425116840	1988
1716	Scarecrow	Matthew Reilly	\N	312937660	2003
1717	Soul Music	Terry Pratchett	\N	057506689X	1994
1718	Enduring Love	Ian McEwan	\N	99481243	1997
1719	Where the Heart Is	Billie Letts	\N	446672211	1995
1720	Mile 81	Stephen King	\N	1451665601	2011
1721	The Last Runaway	Tracy Chevalier	\N	525952993	2013
1722	Sold	Patricia McCormick	\N	786851716	2006
1723	The Mummy	Anne Rice	\N	009947137X	1989
1724	Summer of Night	Dan Simmons	\N	446362662	1991
1725	Bastard Out of Carolina	Dorothy Allison	\N	452287057	1992
1726	Love wins	Rob Bell	\N	006204964X	2011
1727	The Black Circle	Patrick Carman	\N	545060451	2009
1728	Incendiary	Chris Cleave	\N	1400096685	2005
1729	Long Lost	Harlan Coben	\N	525951059	2009
1730	Mister Monday	Garth Nix	\N	439856264	2003
1731	My Cousin Rachel	Daphne du Maurier	\N	316252964	1951
1732	Stormy, Misty's Foal	Marguerite Henry	\N	1416927883	1963
1733	Crash Into You	Katie McGarry	\N	037321099X	2013
1734	A Single Shard	Linda Sue Park	\N	440418518	2001
1735	Afterburn	Sylvia Day	\N	1459245954	2013
1736	The Jefferson Key	Steve Berry	\N	345505514	2011
1737	Blood of Dragons	Robin Hobb	\N	62116851	2013
1738	My Life Next Door 	Huntley Fitzpatrick	\N	803736991	2012
1739	Hostage to Pleasure	Nalini Singh	\N	425223256	2008
1740	The Temporal Void	Peter F. Hamilton	\N	1405088834	2008
1741	The Crow Road	Iain Banks	\N	349103232	1992
1742	The Subterraneans	Jack Kerouac	\N	802131867	1958
1743	Peony in Love	Lisa See	\N	140006466X	2007
1744	The Face Of Deception	Iris Johansen	\N	340739304	1998
1745	Eye of the Storm	Jack Higgins	\N	425138232	1992
1746	Chesapeake	James A. Michener	\N	812970438	1978
1747	Tales from Earthsea	Ursula K. Le Guin	\N	441011241	2001
1748	Darkness, Take My Hand	Dennis Lehane	\N	055350584X	1996
1749	Murder at the Vicarage	Agatha Christie	\N	1579126251	1930
1750	Maskerade	Terry Pratchett	\N	575058080	1995
1751	Ascend	Amanda Hocking	\N	1250006333	2012
1752	Tourist Season	Carl Hiaasen	\N	446695718	1986
1753	The Diamond of Darkhold	Jeanne DuPrau	\N	375955712	2008
1754	A Court of Wings and Ruin	Sarah J. Maas	\N	1408857901	2017
1755	This Is Where It Ends	Marieke Nijkamp	\N	149262246X	2016
1756	Almost Heaven	Judith McNaught	\N	671011332	1989
1757	Dawn on a Distant Shore	Sara Donati	\N	553578553	2000
1758	The Dice Man	Luke Rhinehart	\N	6513905	1971
1759	Conspiracy in Death	J.D. Robb	\N	749934174	1999
1760	Peter Pan	J.M. Barrie	 Michael Hague	805072454	1904
1761	Reflected in You	Sylvia Day	\N	425263916	2012
1762	The Innocent	Harlan Coben	\N	045121577X	2005
1763	Dark Star Safari 	Paul Theroux	\N	618446877	2002
1764	Cold Fire	Dean Koontz	\N	425199584	1991
1765	The Martian Chronicles	Ray Bradbury	\N	553278223	1950
1766	Anyone But You 	Jennifer Crusie	\N	037377138X	1996
1767	The Maze Runner	James Dashner	\N	385737947	2009
1768	White Oleander	Janet Fitch	\N	316182540	1999
1769	Dark Days	Derek Landy	\N	7325940	2010
1770	Star Island	Carl Hiaasen	\N	307272583	2010
1771	Wings 	Aprilynne Pike	\N	61668036	2009
1772	The ABC Murders	Agatha Christie	\N	1579126243	1936
1773	Green	Ted Dekker	\N	1595542884	2009
1774	The Lions of Al-Rassan	Guy Gavriel Kay	\N	60733497	1995
1775	S.	J.J. Abrams	 Doug Dorst	316201642	2013
1776	The Buddha in the Attic	Julie Otsuka	\N	307700003	2011
1777	The Bonehunters	Steven Erikson	\N	553813153	2006
1778	Suffer the Children	John Saul	\N	044018293X	1977
1779	Summer and the City	Candace Bushnell	\N	61728934	2011
1780	Sugar and Spice	Lauren Conrad	\N	61767603	2010
1781	Shopgirl: A Novella	Steve Martin	\N	786891076	2000
1782	Thoughtless	S.C. Stephens	\N	146109111X	2009
1783	Grave Witch	Kalayna Price	\N	451463803	2010
1784	Ancillary Sword	Ann Leckie	\N	316246654	2014
1785	The Goldfinch	Donna Tartt	\N	316055433	2013
1786	Certain Prey	John Sandford	\N	743484193	1999
1787	Don't You Cry	Mary Kubica	\N	778319059	2016
1788	Wielding a Red Sword	Piers Anthony	\N	345322215	1986
1789	The Hundred Secret Senses	Amy Tan	\N	080411109X	1995
1790	Once Upon a Marigold	Jean Ferris	\N	152050841	2002
1791	Drowning Ruth	Christina Schwarz	\N	345439104	2000
1792	Bayou Moon	Ilona Andrews	\N	441019455	2010
2003	Unearthly	Cynthia Hand	\N	61996165	2011
1793	The Stranger Beside Me	Ann Rule	\N	451203267	1980
1794	Dead Until Dark	Charlaine Harris	\N	441008534	2001
1795	Goldfinger	Ian Fleming	\N	142002046	1959
1796	Thirteen Moons	Charles Frazier	\N	375509321	2006
1797	Just One Day	Gayle Forman	\N	142422959	2013
1798	Cocktails for Three	Madeleine Wickham	\N	312349998	2000
1799	Home	Toni Morrison	\N	307594165	2011
1800	For One More Day	Mitch Albom	\N	1401303277	2006
1801	Roots	Alex Haley	\N	440174643	1976
1802	On Basilisk Station 	David Weber	\N	1416509372	1992
1803	Mort	Terry Pratchett	\N	61020680	1987
1804	An Officer and a Spy	Robert   Harris	\N	385349580	2013
1805	The Ghost Road	Pat Barker	\N	452276721	1995
1806	Once	Morris Gleitzman	\N	014132063X	2005
1807	Fingersmith	Sarah Waters	\N	1573229725	2002
1808	Inkheart	Cornelia Funke	\N	1905294964	1990
1809	Indemnity Only	Sara Paretsky	\N	440210690	1982
1810	The Path of Daggers	Robert Jordan	\N	812550293	1998
1811	The Death of Bees	Lisa O'Donnell	\N	62209841	2012
1812	Ruin and Rising	Leigh Bardugo	\N	080509461X	2014
1813	Dr. No	Ian Fleming	\N	142002038	1958
1814	Consequences	Aleatha Romig	\N	1465341889	2011
1815	Winter Garden	Kristin Hannah	\N	312364121	2009
1816	Vanish	Tess Gerritsen	\N	345476980	2006
1817	Prince of the Blood	Raymond E. Feist	\N	553588117	1989
1818	Blueberries for Sal	Robert McCloskey	\N	670175919	1948
1819	Nothing to Lose	Lee Child	\N	385340567	2008
1820	Me Before You	Jojo Moyes	\N	670026603	2012
1821	Just for You	Mercer Mayer	\N	030711838X	1975
1822	Ghost Story	Peter Straub	\N	671685635	1979
1823	All Over But the Shoutin'	Rick Bragg	\N	679774025	1997
1824	Love That Dog	Sharon Creech	\N	64409597	2001
1825	The Jewel	Amy Ewing	\N	62235796	2014
1826	The Historian	Elizabeth Kostova	\N	751537284	2005
1827	The Dead-Tossed Waves 	Carrie Ryan	\N	385736843	2010
1828	The Amateur Marriage	Anne Tyler	\N	345472454	2004
1829	Garden of Shadows	V.C. Andrews	\N	067172942X	1987
1830	Ape House	Sara Gruen	\N	385664443	2010
1831	The Abstinence Teacher	Tom Perrotta	\N	307356361	2007
1832	The Light in the Ruins	Chris Bohjalian	\N	385534817	2013
1833	The Darkest Surrender	Gena Showalter	\N	373775814	2011
1834	Needful Things	Stephen King	\N	045057458X	1991
1835	The Last Picture Show	Larry McMurtry	\N	752837214	1966
1836	Glengarry Glen Ross	David Mamet	\N	802130917	1983
1837	The English Girl	Daniel Silva	\N	62073168	2013
1838	The Lake House	James Patterson	\N	446696587	2003
1839	Every Dead Thing	John Connolly	\N	067102731X	1999
1840	The Descendants	Kaui Hart Hemmings	\N	1400066336	2007
1841	Swimmy 	Leo Lionni	\N	394826205	1963
1842	Rules Of Prey	John Sandford	\N	425205819	1989
1843	The Lies of Locke Lamora	Scott Lynch	\N	553804677	2006
1844	Dreams of a Dark Warrior	Kresley Cole	\N	1439136807	2011
1845	The Lion & the Mouse	Jerry Pinkney	\N	316013560	2009
1846	Wide Sargasso Sea	Jean Rhys	\N	140274219	1966
1847	The Children of Men	P.D. James	\N	307279901	1992
1848	The Rose Society	Marie Lu	\N	399167846	2015
1849	Five Go Adventuring Again	Enid Blyton	\N	340796154	1943
1850	Out of the Silent Planet	C.S. Lewis	\N	7157150	1938
1851	The Naked God 	Peter F. Hamilton	\N	333725034	1999
1852	The Gift	Danielle Steel	\N	440221315	1986
1853	JPod	Douglas Coupland	\N	1596911050	2006
1854	Twilight	Stephenie Meyer	\N	316015849	2005
1855	Lenobia's Vow	P.C. Cast	 Kristin Cast	1250000246	2012
1856	Ice Cold	Tess Gerritsen	\N	034551548X	2010
1857	Agent to the stars	John Scalzi	\N	1596060204	2004
1858	Blackmoore	Julianne Donaldson	\N	1609074602	2013
1859	Paths of Glory	Jeffrey Archer	\N	312539517	2009
1860	Shutter Island	Dennis Lehane	\N	038073186X	2003
1861	The Valley of Horses	Jean M. Auel	\N	553381660	1982
1862	The Third Option	Vince Flynn	\N	743499697	2000
1863	Messenger of Truth	Jacqueline Winspear	\N	805078983	2006
1864	The Third Victim	Lisa Gardner	\N	553578685	2001
1865	Illusions	Aprilynne Pike	\N	61668095	2011
1866	The Lost World	Michael Crichton	\N	752224417	1995
1867	Never Fade	Alexandra Bracken	\N	1423157516	2013
1868	Bad Moon Rising	Sherrilyn Kenyon	\N	749909226	2009
1869	Stay Hungry Stay Foolish	Rashmi Bansal	\N	9381626715	2008
1870	The Other Woman	Jane Green	\N	452287146	2004
1871	Eclipse	Stephenie Meyer	\N	316160202	2007
1872	The Last Werewolf	Glen Duncan	\N	1847679447	2011
1873	The Luxe	Anna Godbersen	\N	61345660	2007
1874	Out to Canaan (Mitford)	Jan Karon	\N	143035061	1997
1875	When He was Wicked	Julia Quinn	\N	60531231	2004
1876	Shattered	Kevin Hearne	\N	345548485	2014
1877	Vampire Kisses	Ellen Schreiber	\N	60093366	2003
1878	Pushing Ice	Alastair Reynolds	\N	441014011	2005
1879	The Collectors	David Baldacci	\N	044653109X	2006
1880	Secrets to the Grave	Tami Hoag	\N	052595192X	2010
1881	Shadowland	Meg Cabot	\N	60725117	2000
1882	Remarkable Creatures	Tracy Chevalier	\N	7178379	2009
1883	Etiquette & Espionage	Gail Carriger	\N	031619008X	2013
1884	Nine Princes in Amber	Roger Zelazny	\N	380014300	1970
1885	Reaper's Gale	Steven Erikson	\N	593046315	2007
1886	The Road to Character	David  Brooks	\N	081299325X	2015
1887	Guilty Pleasures	Laurell K. Hamilton	\N	425197549	1993
1888	Things Fall Apart	Chinua Achebe	\N	385474547	1958
1889	Hot Six	Janet Evanovich	\N	312976275	2000
1890	Someone Like You	Sarah Dessen	\N	142401773	1998
1891	The Black Echo	Michael Connelly	\N	446612731	1992
1892	Such a Pretty Girl	Laura Wiess	\N	1416521836	2007
1893	Purity in Death	J.D. Robb	\N	749934417	2002
1894	The Tea Rose	Jennifer Donnelly	\N	7208006	2002
1895	Heretic	Bernard Cornwell	\N	006053284X	2003
1896	Living Dead in Dallas	Charlaine Harris	\N	1841493007	2002
1897	The Heroes	Joe Abercrombie	\N	316123358	2011
1898	Naked	David Sedaris	\N	316777730	1997
1899	El Deafo	Cece Bell	 David Lasky	1419710206	2014
1900	Crystal Singer	Anne McCaffrey	\N	345327861	1982
1901	Dog on It	Spencer Quinn	\N	1416585834	2008
1902	Twelfth Grade Kills	Heather Brewer	\N	525422242	2010
1903	The Forgetting Time	Sharon Guskin	\N	1250076420	2016
1904	Till We Have Faces	C.S. Lewis	\N	156904365	1956
1905	The Legend of Luke	Brian Jacques	\N	142501093	1999
1906	H is for Hawk	Helen Macdonald	\N	224097008	2015
1907	The Algebraist	Iain M. Banks	\N	1597800449	2004
1908	Princess on the Brink	Meg Cabot	\N	60724560	2006
1909	When It Happens	Susane Colasanti	\N	670060291	2006
1910	Under the Volcano	Malcolm Lowry	\N	60955228	1947
1911	King & Maxwell	David Baldacci	\N	1455521310	2013
1912	The Prophet	Kahlil Gibran	\N	000100039X	1923
1913	Boomerang	Tatiana de Rosnay	\N	312593317	2009
1914	The Siege of Macindaw	John Flanagan	\N	174166134X	2006
1915	We Were the Mulvaneys	Joyce Carol Oates	\N	452282829	1996
1916	Finally	Wendy Mass	\N	545052424	2010
1917	Dark Gold (Dark #3)	Christine Feehan	\N	843958448	2000
1918	This Lullaby	Sarah Dessen	\N	142501557	2002
1919	Rules of Attraction	Simone Elkeles	\N	802720854	2010
1920	The Bourne Ultimatum	Robert Ludlum	\N	752858491	1990
1921	The Nanny	Melissa Nathan	\N	60560118	2003
1922	The Demon King	Cinda Williams Chima	\N	1423118235	2009
1923	Merrick	Anne Rice	\N	345422406	2000
1924	Midnight Crossroad	Charlaine Harris	\N	425263150	2014
1925	The Maze of Bones 	Rick Riordan	\N	545060397	2008
1926	The Obsession	Nora Roberts	\N	399175164	2016
1927	The Post-Birthday World 	Lionel Shriver	\N	61187844	2007
1928	QB VII	Leon Uris	\N	055327094X	1970
1929	Silence 	Becca Fitzpatrick	\N	1442426640	2011
1930	Say You're One of Them	Uwem Akpan	\N	316113786	2008
1931	The Sparrow	Mary Doria Russell	\N	449912558	1996
1932	The Dark Divine	Bree Despain	\N	1606840576	2009
1933	RoomHate	Penelope Ward	\N	1523662441	2016
1934	Takedown Twenty	Janet Evanovich	\N	345542886	2013
1935	The Alibi	Sandra Brown	\N	446618675	1999
1936	From Head to Toe	Eric Carle	\N	61119725	1997
1937	Until I Die	Amy Plum	\N	62004042	2012
1938	Unseen Academicals	Terry Pratchett	\N	61161705	2009
1939	The First World War	John Keegan	\N	375700455	1998
1940	Savannah Breeze	Mary Kay Andrews	\N	60564679	2006
1941	A Bad Case of Stripes	David Shannon	\N	439598389	1998
1942	Catering to Nobody	Diane Mott Davidson	\N	553584707	1990
1943	City of Stairs	Robert Jackson Bennett	\N	080413717X	2014
1944	The Big Four	Agatha Christie	\N	7120818	1927
1945	Disgrace	J.M. Coetzee	\N	143036378	1999
1946	Night World, No. 1	L.J. Smith	\N	1416974504	2008
1947	The Eye of Minds	James Dashner	\N	385741391	2013
1948	The Gods of Guilt	Michael Connelly	\N	316069515	2013
1949	Furies of Calderon 	Jim Butcher	\N	044101268X	2004
1950	Sanctuary	Nora Roberts	\N	515122734	1997
1951	The Call of the Wild	Jack London	\N	439227143	1903
1952	Between Sisters	Kristin Hannah	\N	345450744	2003
1953	The North Water	Ian McGuire	\N	1627795944	2016
1954	From a Buick 8	Stephen King	\N	743211375	2002
1955	Small Gods	Terry Pratchett	\N	552152978	1992
1956	The Rosie Effect	Graeme Simsion	\N	1922182109	2014
1957	The Way to Cook	Julia Child	\N	679747656	1989
1958	The Far Pavilions	M.M. Kaye	\N	031215125X	1978
1959	Silent in the Grave	Deanna Raybourn	\N	778324109	2006
1960	An Old-Fashioned Girl	Louisa May Alcott	\N	1406501069	1869
1961	All My Puny Sorrows	Miriam Toews	\N	345808002	2014
1962	The Stepford Wives	Ira Levin	\N	60080841	1972
1963	The Mermaids Singing 	Val McDermid	\N	312983603	1995
1964	Tipping the Velvet	Sarah Waters	\N	1573227889	1998
1965	Grave Secrets	Kathy Reichs	\N	684859734	2002
1966	Player Piano	Kurt Vonnegut Jr.	\N	385333781	1952
1967	Chasing The Night	Iris Johansen	\N	312651198	2010
1968	Please Ignore Vera Dietz	A.S. King	\N	375865861	2010
1969	Le Mur	Jean-Paul Sartre	\N	184391400X	1939
1970	The Wise Man's Fear	Patrick Rothfuss	\N	756404738	2011
1971	The Winter King	Bernard Cornwell	\N	312156960	1995
1972	Variant	Robison Wells	\N	62026089	2011
1973	The Abolition of Man	C.S. Lewis	\N	60652942	1943
1974	Cathedral	Raymond Carver	\N	679723692	1983
1975	Ghostwritten	David Mitchell	\N	375724508	1999
1976	Finger Lickin' Fifteen	Janet Evanovich	\N	312383282	2009
1977	Cat's Eye	Margaret Atwood	\N	385491026	1988
1978	Out of My Mind	Sharon M. Draper	\N	141697170X	2010
1979	You Belong to Me	Mary Higgins Clark	\N	671004549	1998
1980	The Husband	Dean Koontz	\N	553804790	2006
1981	The Thin Man	Dashiell Hammett	\N	679722637	1934
1982	August: Osage County	Tracy Letts	\N	1559363304	2008
1983	Just the Sexiest Man Alive	Julie James	\N	425224201	2008
1984	Boy Meets Boy	David Levithan	\N	375832998	2003
1985	The Railway Children	E. Nesbit	\N	486410226	1906
1986	Shadow & Claw	Gene Wolfe	\N	312890176	1994
1987	Mona Lisa Overdrive	William Gibson	\N	553281747	1988
1988	Turn of Mind	Alice LaPlante	\N	385669852	2011
1989	The Untethered Soul	Michael A. Singer	\N	1572245379	2007
1990	Clear and Present Danger	Tom Clancy	\N	425144372	1989
1991	Choke	Chuck Palahniuk	\N	385720920	2001
1992	Q & A: Slumdog Millionaire	Vikas Swarup	\N	739467042	2005
1993	Jazz	Toni Morrison	\N	452269652	1992
1994	Heart of the Matter	Emily Giffin	\N	312554168	2010
1995	Running with the Demon	Terry Brooks	\N	345379624	1997
1996	Dark Witch	Nora Roberts	\N	425259854	2013
1997	The Winter's Tale	William Shakespeare	\N	521293731	1600
1998	Certain Girls	Jennifer Weiner	\N	743294254	2000
1999	Flotsam	David Wiesner	\N	618194576	2006
2000	Moo, Baa, La La La!	Sandra Boynton	\N	689861133	1982
2001	The Cobra Event	Richard   Preston	\N	679457143	1997
2002	Inversions	Iain M. Banks	\N	074341196X	1998
2004	I Can Read with My Eyes Shut!	Dr. Seuss	\N	7158513	1978
2005	Lucky Man	Michael J. Fox	\N	91879205	2002
2006	The Darkest Whisper	Gena Showalter	\N	373773927	2009
2007	The Shepherd's Crown	Terry Pratchett	\N	62429973	2015
2008	No Logo	Naomi Klein	\N	312421435	1999
2009	Smoke Screen	Sandra Brown	\N	1416563067	2008
2010	More Tales of the City	Armistead Maupin	\N	055299877X	1980
2011	The Omen	David Seltzer	\N	451219422	1976
2012	The Best Laid Plans	Sidney Sheldon	\N	446604089	1997
2013	Awakened	P.C. Cast	 Kristin Cast	312650248	2011
2014	Black Hills	Nora Roberts	\N	399155813	2009
2015	The Foundation Trilogy	Isaac Asimov	\N	380508567	1953
2016	Heartstone	C.J. Sansom	\N	230711251	2010
2017	Feverborn	Karen Marie Moning	\N	385344422	2016
2018	Evermore	Alyson Noel	\N	031253275X	2009
2019	The Crying of Lot 49	Thomas Pynchon	\N	006091307X	1966
2020	The Ruby Knight	David Eddings	\N	345373529	1990
2021	The Healer	Dee Henderson	\N	1414310609	2002
2022	Naked in Death	J.D. Robb	\N	399151575	1995
2023	The Next Accident	Lisa Gardner	\N	752848267	2001
2024	Every Soul A Star	Wendy Mass	\N	316002569	2008
2025	The Sugar Queen	Sarah Addison Allen	\N	553805495	2008
2026	Flesh and Blood	Patricia Cornwell	\N	62325345	2014
2027	Faith	Jennifer Haigh	\N	60755806	2011
2028	TransAtlantic	Colum McCann	\N	1400069599	2013
2029	The Forgotten	David Baldacci	\N	446573051	2012
2030	A Grief Observed	C.S. Lewis	\N	60652896	1942
2031	Hope Was Here	Joan Bauer	\N	142404241	2000
2032	Dead Witch Walking	Kim Harrison	\N	60572965	2004
2033	The Shipping News	Annie Proulx	\N	743225422	1993
2034	West with the Night	Beryl Markham	\N	865471185	1942
2035	Brilliance of the Moon 	Lian Hearn	\N	1594480869	2003
2036	Hidden Order	Brad Thor	\N	1476717095	2013
2037	Kon-Tiki Ekspedisjonen	Thor Heyerdahl	\N	671726528	1948
2038	The Gun Seller	Hugh Laurie	\N	067102082X	1996
2039	A Dangerous Fortune	Ken Follett	\N	440217490	1993
2040	Glass (Crank, #2)	Ellen Hopkins	\N	1416940901	2007
2041	Twisted	Sara Shepard	\N	62081012	2011
2042	The Good Father	Diane Chamberlain	\N	778313468	2012
2043	Little Mercies	Heather Gudenkauf	\N	778316335	2014
2044	Dubliners	James Joyce	 Jeri Johnson	192839993	1914
2045	Dark Magic	Christine Feehan	\N	505523892	2000
2046	A Town Like Alice	Nevil Shute	\N	1842323008	1950
2047	The False Prince	Jennifer A. Nielsen	\N	545284139	2012
2048	Chill Factor	Sandra Brown	\N	743466772	2005
2049	Porno	Irvine Welsh	\N	8433972618	2005
2050	Scarpetta	Patricia Cornwell	\N	399155163	2008
2051	Lord Foul's Bane	Stephen R. Donaldson	\N	345348656	1977
2052	Iceberg	Clive Cussler	\N	425197387	1974
2053	Here be Dragons	Sharon Kay Penman	\N	345382846	1985
2054	The Faceless Ones	Derek Landy	\N	7302142	2008
2055	The Narrows	Michael Connelly	\N	446699543	2004
2056	Nine Dragons	Michael Connelly	\N	316166316	2009
2057	Mother Night	Kurt Vonnegut Jr.	\N	385334141	1961
2058	Rock Hard	Olivia Cunning	\N	1402245793	2011
2059	The Teeth of the Tiger	Tom Clancy	\N	141004924	2003
2060	Crewel	Gennifer Albin	\N	374316414	2012
2061	The Famished Road	Ben Okri	\N	385425139	1991
2062	Trace	Patricia Cornwell	\N	425204200	2004
2063	The Collector	John Fowles	\N	99470470	1963
2064	Shadow's Edge	Brent Weeks	\N	316033650	2008
2065	The Sentry	Robert Crais	\N	399157077	2011
2066	Family Pictures	Jane Green	\N	312591837	2013
2067	Plenty	Yotam Ottolenghi	\N	91933684	2010
2068	The Shock of the Fall	Nathan Filer	\N	7491433	2013
2069	Dream Man	Linda Howard	\N	671019759	1994
2070	The Daughter of Time	Josephine Tey	\N	684803860	1951
2071	Going Postal	Terry Pratchett	\N	60502932	2004
2072	This is Not My Hat	Jon Klassen	\N	763655996	2012
2073	Too Good To Be True	Kristan Higgins	\N	373773552	2009
2074	Lock and Key	Sarah Dessen	\N	067001088X	2008
2075	The Shadow Rising 	Robert Jordan	\N	812513738	1992
2076	Six Years	Harlan Coben	\N	525953485	2013
2077	Winter's Tale	Mark Helprin	\N	156031191	1983
2078	Colonel Roosevelt	Edmund Morris	\N	375504877	2010
2079	Inside Out	Maria V. Snyder	\N	037321006X	2010
2080	Pride and Prejudice	Jane Austen	\N	679783261	1813
2081	Crazy Rich Asians	Kevin Kwan	\N	385536976	2013
2082	A Feast for Crows	George R.R. Martin	\N	055358202X	2005
2083	Burn For Me	Ilona Andrews	\N	62289241	2014
2084	Single White Vampire	Lynsay Sands	\N	505525526	2003
2085	A Prayer for Owen Meany	John Irving	\N	552135399	1989
2086	The Problem of Pain	C.S. Lewis	\N	6280935	1940
2087	On the Road	Jack Kerouac	\N	140042598	1955
2088	The Widow of the South	Robert Hicks	\N	446697435	2005
2089	Schooled	Gordon Korman	\N	786856920	2000
2090	Sense & Sensibility	Joanna Trollope	\N	62200461	2013
2091	Soumission 	Michel Houellebecq	\N	2081354802	2015
2092	One Thousand Gifts	Ann Voskamp	\N	310321913	2011
2093	Go, Dog. Go!	P.D. Eastman	\N	394800206	1961
2094	The Road to Serfdom	Friedrich A. Hayek	\N	226320618	1944
2095	The Stone Diaries	Carol Shields	\N	014023313X	1993
2096	Manual do guerreiro da luz	Paulo Coelho	\N	60527986	1997
2097	Body of Evidence 	Patricia Cornwell	\N	743493915	1991
2098	Vinegar Girl	Anne Tyler	\N	804141266	2016
2099	King of Thorns	Mark  Lawrence	\N	1937007472	2012
2100	Star Wars: Darth Plagueis	James Luceno	\N	034551128X	2012
2101	Ethan Frome	Edith Wharton	\N	142437808	1911
2102	Turbo Twenty-Three	Janet Evanovich	\N	345543009	2016
2103	City of Heavenly Fire	Cassandra Clare	\N	1481426303	2014
2104	Hardline	Meredith Wild	\N	099050560X	2014
2105	Portrait of a Spy	Daniel Silva	\N	62072188	2011
2106	Breakfast at Tiffany's	Truman Capote	\N	679745653	1958
2107	Only the Good Spy Young	Ally Carter	\N	1423128206	2010
2108	Mine Till Midnight	Lisa Kleypas	\N	312949804	2007
2109	Tortilla Flat	John Steinbeck	\N	582461502	1935
2110	First King of Shannara	Terry Brooks	\N	1857236556	1996
2111	The Serpent's Shadow	Rick Riordan	\N	1423140575	2012
2112	The Lost Hero	Rick Riordan	\N	142311339X	2010
2113	When the Lion Feeds	Wilbur Smith	\N	312940661	1964
2114	Brilliance	Marcus Sakey	\N	1611099692	2013
2115	Rabbit Redux	John Updike	\N	449911934	1971
2116	Enchanters' End Game	David Eddings	\N	345300785	1984
2117	Live by Night	Dennis Lehane	\N	60004878	2012
2118	Paper Towns	John Green	\N	014241493X	2008
2119	Pleasure of a Dark Prince 	Kresley Cole	\N	1416580956	2010
2120	To Build a Fire	Jack London	\N	968709184	1903
2121	Red Queen	Victoria Aveyard	\N	1409151174	2015
2122	Snow Like Ashes	Sara Raasch	\N	62286927	2014
2123	The Last Don	Mario Puzo	\N	345412214	1996
2124	A Hundred Summers	Beatriz Williams	\N	039916216X	2013
2125	The Bone Collector	Jeffery Deaver	\N	451188454	1997
2126	The Broken Kingdoms	N.K. Jemisin	\N	316043966	2010
2127	The Heretic's Daughter	Kathleen Kent	\N	316037532	2008
2128	Storia della bruttezza	Umberto Eco	\N	847829863	2007
2129	Damaged	Cathy Glass	\N	7236344	2007
2130	Night Chills	Dean Koontz	\N	425098648	1976
2131	Winter Street	Elin Hilderbrand	\N	316376116	2014
2132	Await Your Reply	Dan Chaon	\N	345476026	2009
2133	The Persian Pickle Club	Sandra Dallas	\N	312147015	1995
2134	The Thousand Names	Django Wexler	\N	451465105	2013
2135	My Soul to Save	Rachel Vincent	\N	373210043	2009
2136	Saving Grace	Julie Garwood	\N	671870114	1993
2137	A Knight in Shining Armor	Jude Deveraux	\N	743457269	1989
2138	The Given Day	Dennis Lehane	\N	688163181	2008
2139	If You Could See Me Now	Cecelia Ahern	\N	140130866X	2005
2140	Heir to the Shadows	Anne Bishop	\N	451456726	1999
2141	inf	Sherrilyn Kenyon	\N	312599072	2010
2142	Leaving Paradise	Simone Elkeles	\N	738710180	2007
2143	Touch of Power	Maria V. Snyder	\N	778313077	2011
2144	Personal	Lee Child	\N	804178747	2014
2145	Enemy of God	Bernard Cornwell	\N	312187149	1996
2146	Affinity	Sarah Waters	\N	1573228737	1999
2147	A God in Ruins	Kate Atkinson	\N	316176532	2015
2148	The Mermaid Chair	Sue Monk Kidd	\N	143036696	2004
2149	Sister	Rosamund Lupton	\N	749942010	2010
2150	Covet	J.R. Ward	\N	451228219	2009
2151	The Last Days of Dogtown	Anita Diamant	\N	743225740	2005
2152	Arcadia	Lauren Groff	\N	1401340873	2012
2153	Lunar Park	Bret Easton Ellis	\N	375727272	2005
2154	Sovereign 	C.J. Sansom	\N	670038318	2006
2155	The Red Tent	Anita Diamant	\N	312353766	1997
2156	Crocodile Tears	Anthony Horowitz	\N	399250565	2009
2157	Runaway 	Meg Cabot	\N	545040604	2010
2158	Children of Dune	Frank Herbert	\N	441104029	1976
2159	The Girl in the Red Coat	Kate Hamer	\N	571313248	2015
2160	Can You Keep a Secret?	Sophie Kinsella	\N	440241901	2003
2161	Ride Steady	Kristen Ashley	\N	145553322X	2015
2162	Twilight	Meg Cabot	\N	60724692	2005
2163	Stargirl	Jerry Spinelli	\N	439488400	2000
2164	Revelation	C.J. Sansom	\N	1405092726	2008
2165	The Next Big Thing	Johanna Edwards	\N	425200280	2005
2166	The Wisdom of Crowds	James Surowiecki	\N	385721706	2004
2167	Matched	Ally Condie	\N	525423648	2010
2168	Just Go to Bed	Mercer Mayer	\N	307119408	1983
2169	A Year in Provence	Peter Mayle	\N	679731148	1989
2170	Icefire	Chris d'Lacey	\N	439672465	2003
2171	Significance	Shelly Crane	\N	1481200577	2011
2172	Looking for Alibrandi	Melina Marchetta	\N	375836942	1992
2173	Playing for Keeps	R.L. Mathewson	\N	983212546	2011
2174	Possession	A.S. Byatt	\N	679735909	1990
2175	Moab Is My Washpot	Stephen Fry	\N	1569472025	1997
2176	Body Double	Tess Gerritsen	\N	034545894X	2004
2177	Independence Day	Richard Ford	\N	99447126	1995
2178	Deception	Jonathan Kellerman	\N	345505670	2009
2179	Life After Life	Kate Atkinson	\N	316176486	2013
2180	A King's Ransom	Jude Watson	\N	545298407	2011
2181	The Devil's Punchbowl	Greg Iles	\N	743292511	2009
2182	The Law of Nines	Terry Goodkind	\N	399156046	2009
2183	New Spring	Robert Jordan	\N	1841492612	2004
2184	Circle of Friends	Maeve Binchy	\N	99498596	1990
2185	Moon Over Soho	Ben Aaronovitch	\N	345524594	2011
2186	Heat Wave	Richard Castle	\N	1401323820	2008
2187	Friction	Sandra Brown	\N	145558116X	2015
2188	Mary, Mary	James Patterson	\N	446619035	2005
2189	Carrion Comfort	Dan Simmons	\N	446359203	1989
2190	The Sea of Monsters	Rick Riordan	\N	786856866	2006
2191	The Slap	Christos Tsiolkas	\N	1741753597	2008
2192	The Lone Drow	R.A. Salvatore	\N	786932287	2003
2193	Grendel	John Gardner	\N	679723110	1970
2194	The Panther	Nelson DeMille	\N	1455518379	2012
2195	Just a Mess (Look-Look)	Mercer Mayer	\N	307119483	1987
2196	Roses Are Red	James Patterson	\N	446605484	2000
2197	Crown of Midnight	Sarah J. Maas	\N	1619630621	2013
2198	Testimony	Anita Shreve	\N	316059862	2008
2199	The Weird Sisters	Eleanor Brown	\N	399157220	2011
2200	Heart-Shaped Box	Joe Hill	\N	61147931	2007
2201	Faithful Place	Tana French	\N	670021873	2010
2202	Christ the Lord: Out of Egypt	Anne Rice	\N	345436830	2005
2203	Pulp	Charles Bukowski	\N	876859260	1994
2204	The Submission	Amy Waldman	\N	374271569	2011
2205	Raven Rise	D.J. MacHale	\N	1416914188	2008
2206	Nesmrtelnost	Milan Kundera	\N	057114456X	1990
2207	Haunted	Meg Cabot	\N	60751649	2003
2208	Another Brooklyn	Jacqueline Woodson	\N	62359983	2016
2209	Splendor	Anna Godbersen	\N	61626317	2009
2210	Point of Origin	Patricia Cornwell	\N	751530484	1998
2211	The Demolished Man	Alfred Bester	\N	1857988221	1953
2212	Cover Her Face	P.D. James	\N	743219570	1962
2213	The Druid of Shannara	Terry Brooks	\N	1857233808	1991
2214	Devil in a Blue Dress	Walter Mosley	\N	743451791	1990
2215	Something About You	Julie James	\N	425233383	2010
2216	Shalimar the Clown	Salman Rushdie	\N	679783482	2005
2217	The House Girl	Tara Conklin	\N	62207393	2013
2218	First Grave on the Right	Darynda Jones	\N	312662750	2011
2219	Thorn Queen	Richelle Mead	\N	553819879	2008
2220	Notes from a Big Country	Bill Bryson	\N	076790382X	1998
2221	The Princess Bride	William Goldman	\N	345418263	1973
2222	At the Water's Edge	Sara Gruen	\N	385523238	2015
2223	The Wandering Fire	Guy Gavriel Kay	\N	451458265	1986
2224	The Celestine Prophecy	James Redfield	\N	446671002	1993
2225	The Eternal Dawn	Christopher Pike	\N	1442413174	2010
2226	For Love of Evil	Piers Anthony	\N	380752859	1988
2227	Going Solo	Roald Dahl	 Quentin Blake	141311428	1986
2228	They Do it with Mirrors	Agatha Christie	\N	451199901	1952
2229	Siege and Storm	Leigh Bardugo	\N	805094601	2013
2230	A Bruxa de Portobello	Paulo Coelho	\N	7251866	2006
2231	Save the Date	Mary Kay Andrews	\N	1250019699	2014
2232	The horse and his boy	C.S. Lewis	\N	439861365	1954
2233	The White Tiger	Aravind Adiga	\N	1416562591	2008
2234	The Negotiator	Frederick Forsyth	\N	553283936	1989
2235	Swan Song	Robert McCammon	\N	671741039	1987
2236	The Hunt for Red October	Tom Clancy	\N	425172902	1984
2237	Still Life	Louise Penny	\N	312948557	2005
2238	Echo Park	Michael Connelly	\N	316734950	2006
2239	Lover Avenged, part two	J.R. Ward	\N	451233166	2011
2240	Cold Days	Jim Butcher	\N	451464400	2012
2241	Me & Emma	Elizabeth Flock	\N	778322858	2005
2242	A Death In Vienna	Daniel Silva	\N	141019085	2003
2243	The Glass Magician	Charlie N. Holmberg	\N	1477825940	2014
2244	Waylander 	David Gemmell	\N	345379071	1986
2245	I've Got Your Number	Sophie Kinsella	\N	385342063	2011
2246	Queen of Shadows	Sarah J. Maas	\N	1619636042	2015
2247	His Dark Materials	Philip Pullman	\N	440238609	2000
2248	Forgotten	Cat Patrick	\N	316094617	2011
2249	The Bone Season	Samantha Shannon	\N	1620401398	2013
2250	The Night is for Hunting	John Marsden	\N	439858046	1998
2251	The Power of the Dog	Don Winslow	\N	1400096936	2005
2252	The Krishna Key	Ashwin Sanghi	\N	9381626685	2012
2253	Innocent	Scott Turow	\N	446562424	2005
2254	Keeping Faith	Jodi Picoult	\N	60878061	1999
2255	The Tombs of Atuan	Ursula K. Le Guin	\N	689845367	1970
2256	The Wedding Dress	Rachel Hauck	\N	1595549633	2012
2257	Factotum	Charles Bukowski	\N	876852630	1975
2258	Peeps	Scott Westerfeld	\N	1595140838	2005
2259	Romancing the Duke	Tessa Dare	\N	62240196	2014
2260	Bed of Roses	Nora Roberts	\N	425230074	2009
2261	The Good Girl	Mary Kubica	\N	778316556	2014
2262	The Heart of the Matter	Graham Greene	\N	99478420	1948
2263	Blessings	Anna Quindlen	\N	345468694	2002
2264	Lucky Us	Amy Bloom	\N	1400067243	2014
2265	I Am Pilgrim	Terry Hayes	\N	1439177724	2013
2266	V is for Vengeance	Sue Grafton	\N	399157867	2011
2267	Practice Makes Perfect	Julie James	\N	425226743	2009
2268	The Silent Sister	Diane Chamberlain	\N	1250010713	2014
2269	HHhH	Laurent Binet	\N	2246760011	2009
2270	The Heart of Betrayal	Mary E. Pearson	\N	805099247	2015
2271	Dream Team	Jack McCallum	\N	345520483	2012
2272	The Christmas Box	Richard Paul Evans	\N	684832356	1993
2273	Bet Me	Jennifer Crusie	\N	312987854	2004
2274	The Crown	Kiera Cass	\N	62392174	2016
2275	Changeless	Gail Carriger	\N	316074144	2010
2276	Dispatches	Michael Herr	\N	679735259	1977
2277	Skin Trade	Laurell K. Hamilton	\N	425227723	2009
2278	The Darkest Seduction	Gena Showalter	\N	373776578	2012
2279	The Grouchy Ladybug	Eric Carle	\N	64434508	1977
2280	Tinkers	Paul Harding	\N	1934137197	2008
2281	Cold Sassy Tree	Olive Ann Burns	\N	038531258X	1984
2282	Where She Went	Gayle Forman	\N	525422943	2011
2283	The Darkest Road	Guy Gavriel Kay	\N	451451805	1986
2284	Dust of Dreams	Steven Erikson	\N	765316552	2009
2285	The Sociopath Next Door	Martha Stout	\N	767915828	2005
2286	The Kill Artist	Daniel Silva	\N	451209338	2000
2287	City of Dragons	Robin Hobb	\N	61561630	2011
2288	Map of Bones	James Rollins	\N	60765240	2005
2289	Wish You Well	David Baldacci	\N	446699489	2000
2290	The Black Dahlia	James Ellroy	\N	446698873	1987
2291	News of the World	Paulette Jiles	\N	62409204	2016
2292	Night Star	Alyson Noel	\N	312590989	2010
2293	The Tale of Peter Rabbit	Beatrix Potter	\N	723247706	1901
2294	Behind Closed Doors	B.A. Paris	\N	1250121000	2016
2295	Fire and Ice	Erin Hunter	\N	60525592	2003
2296	The Last Song	Nicholas Sparks	\N	446547565	2008
2297	Hopeless	Colleen Hoover	\N	1301949825	2012
2298	Elsewhere	Gabrielle Zevin	\N	312367465	2005
2299	Fire	Kristin Cashore	\N	803734611	2009
2300	Bumi Manusia	Pramoedya Ananta Toer	\N	9799731232	1975
2301	Exile 	R.A. Salvatore	\N	786939834	1990
2302	Snuff	Terry Pratchett	\N	038561926X	2011
2303	Dead in the Family	Charlaine Harris	\N	441018645	2010
2304	The Way of Shadows	Brent Weeks	\N	316033677	2008
2305	Atlantis Found	Clive Cussler	\N	425204030	1999
2306	Midwives	Chris Bohjalian	\N	375706771	1997
2307	Geek Love	Katherine Dunn	\N	375713344	1989
2308	An Untamed State	Roxane Gay	\N	802122515	2014
2309	The Guns of Avalon	Roger Zelazny	\N	380000830	1972
2310	Rising Sun	Michael Crichton	\N	606298231	1992
2311	Empress of the World	Sara Ryan	\N	142500593	2001
2312	The Good Lord Bird	James McBride	\N	1594486344	2013
2313	Sharpe's Tiger	Bernard Cornwell	\N	60932309	1997
2314	Unless	Carol Shields	\N	7154615	2002
2315	A Handful of Dust	Evelyn Waugh	\N	316926051	1934
2316	Journal 64	Jussi Adler-Olsen	\N	8756795459	2010
2317	Lila	Marilynne Robinson	\N	374187614	2014
2318	Altered Carbon	Richard K. Morgan	\N	345457692	2002
2319	The Eternity Cure	Julie Kagawa	\N	373210698	2013
2320	I Know This Much Is True 	Wally Lamb	\N	60987561	1998
2321	Prince of Thorns	Mark  Lawrence	\N	7423292	2011
2322	Hawaii	James A. Michener	\N	375760377	1959
2323	Armada	Ernest Cline	\N	804137250	2015
2324	Wicked Appetite	Janet Evanovich	\N	312652917	2009
2325	Ozma of Oz	L. Frank Baum	\N	543895149	1907
2326	Maisie Dobbs	Jacqueline Winspear	\N	142004332	2003
2327	Catching Fire	Suzanne Collins	\N	439023491	2009
2328	What My Mother Doesn't Know	Sonya Sones	\N	689855532	2001
2329	Post Captain	Patrick O'Brian	\N	6499163	1972
2330	The Road	Cormac McCarthy	\N	307265439	2006
2331	Six Days of the Condor	James Grady	\N	393086925	1974
2332	Filth	Irvine Welsh	\N	393318680	1998
2333	Prodigy	Marie Lu	\N	399256768	2013
2334	The 4-Hour Body	Timothy Ferriss	\N	030746363X	2000
2335	Arrow's Fall	Mercedes Lackey	\N	886774004	1988
2336	Sybil	Flora Rheta Schreiber	\N	446359408	1973
2337	Trojan Odyssey	Clive Cussler	\N	425199320	2003
2338	Raised by Wolves	Jennifer Lynn Barnes	\N	1606840592	2010
2339	Pet Sematary	Stephen King	\N	1416524347	1983
2340	The Round House	Louise Erdrich	\N	62065246	2012
2341	Love the One You're With	Emily Giffin	\N	312348673	2008
2342	The Dragonriders of Pern	Anne McCaffrey	\N	785729194	1968
2343	The Price of Salt	Patricia Highsmith	\N	393325997	1952
2344	Deadeye Dick	Kurt Vonnegut Jr.	\N	385334176	1982
2345	The Promise	Danielle Steel	\N	751505544	1977
2346	Ticktock	Dean Koontz	\N	345405137	1996
2347	Clariel: The Lost Abhorsen	Garth Nix	\N	006156155X	2014
2348	Rose Under Fire	Elizabeth Wein	\N	1423183096	2013
2349	On Liberty	John Stuart Mill	\N	140432078	1859
2350	Up Country	Nelson DeMille	\N	446611913	2002
2351	One Second After	William R. Forstchen	\N	765317583	2009
2352	Down London Road	Samantha Young	\N	451419715	2013
2353	The Third Wheel	Jeff Kinney	\N	1419705849	2012
2354	South of Broad	Pat Conroy	\N	038541305X	2009
2355	Station Eleven	Emily St. John Mandel	\N	385353308	2014
2356	Wither	Lauren DeStefano	\N	1442409053	2011
2357	A Twist in the Tale	Jeffrey Archer	\N	312933525	1988
2358	Ghosts of Onyx	Eric S. Nylund	\N	765354705	2006
2359	Pivot Point	Kasie West	\N	62117378	2013
2360	The Great Gatsby	F. Scott Fitzgerald	\N	743273567	1925
2361	Coraline	Neil Gaiman	\N	61139378	2002
2362	The Warrior Heir	Cinda Williams Chima	\N	786839171	2006
2363	The Elves of Cintra 	Terry Brooks	\N	345484118	2007
2364	Demon Thief	Darren Shan	\N	316012386	2005
2365	Stolen Songbird	Danielle L. Jensen	\N	1908844965	2014
2366	Dark Lover	J.R. Ward	\N	451216954	2005
2367	Whispers Under Ground	Ben Aaronovitch	\N	345524616	2012
2368	Good Night, Mr. Tom	Michelle Magorian	\N	006440174X	1981
2369	The Kitchen God's Wife	Amy Tan	\N	143038109	1991
2370	Enna Burning	Shannon Hale	\N	1582349061	2004
2371	Mein Kampf	Adolf Hitler	\N	395083621	1925
2372	Book of the Dead	Patricia Cornwell	\N	399153934	2007
2373	The Hidden City	David Eddings	\N	345390407	1994
2374	The Guardian	Dee Henderson	\N	1414310579	2001
2375	With a Tangled Skein	Piers Anthony	\N	345318854	1985
2376	Rage of Angels	Sidney Sheldon	\N	6178731	1980
2377	Petals on the Wind	V.C. Andrews	\N	671729470	1980
2378	The Way of Kings	Brandon Sanderson	\N	765326353	2010
2379	Pawn of Prophecy	David Eddings	\N	345468643	1982
2380	Sourcery	Terry Pratchett	\N	61020672	1988
2381	Red Country	Joe Abercrombie	\N	316214442	2012
2382	Peace Child	Don Richardson	\N	830737847	1974
2383	My Name Is Asher Lev	Chaim Potok	\N	1400031044	1972
2384	Wicked Nights	Gena Showalter	\N	373776985	2012
2385	Sign of the Unicorn	Roger Zelazny	\N	380008319	1975
2386	The Christmas List	Richard Paul Evans	\N	1439150001	2009
2387	Ship of Magic	Robin Hobb	\N	000649885X	1998
2388	Momo	Michael Ende	\N	3522168577	1973
2389	Rose Daughter	Robin McKinley	\N	441005837	1997
2390	The Moving Finger	Agatha Christie	\N	7120842	1942
2391	The Warlock	Michael Scott	\N	385735332	2011
2392	Triptych	Karin Slaughter	\N	385339461	2006
2393	Stealing Parker	Miranda Kenneally	\N	1402271875	2012
2394	Washington: A Life	Ron Chernow	\N	1594202664	2010
2395	The Very Hungry Caterpillar	Eric Carle	\N	241003008	1969
2396	The Expats	Chris Pavone	\N	307956350	2012
2397	Pope Joan	Donna Woolfolk Cross	\N	345416260	1996
2398	The Flood	William C. Dietz	\N	345459210	2003
2399	The Tell-Tale Heart	Edgar Allan Poe	\N	553212281	1843
2400	Wildwood	Colin Meloy	 Carson Ellis	006202468X	2011
2401	The Areas of My Expertise	John Hodgman	\N	1594482225	2005
2402	Bleachers	John Grisham	\N	99468190	2003
2403	Outer Dark	Cormac McCarthy	\N	330314920	1968
2404	Frederica	Georgette Heyer	\N	99465647	1965
2405	Er ist wieder da	Timur Vermes	\N	3847905171	2012
2406	Dragonquest	Anne McCaffrey	\N	345335082	1971
2407	Audrey Rose	Frank De Felitta	\N	446324825	1975
2408	Pattern Recognition	William Gibson	\N	425198685	2003
2409	The Way of Zen	Alan W. Watts	\N	375705104	1957
2410	True Believer	Nicholas Sparks	\N	044669651X	2003
2411	City of Glass	Cassandra Clare	\N	1416914307	2009
2412	Many Waters	Madeleine L'Engle	\N	312368577	1986
2413	The Undomestic Goddess	Sophie Kinsella	\N	385338694	2005
2414	Quentins	Maeve Binchy	\N	752849522	2002
2415	The Lifeboat	Charlotte Rogan	\N	316185906	2012
2416	East	Edith Pattou	\N	152052216	2003
2417	Cross Bones	Kathy Reichs	\N	743453026	2005
2418	A Caribbean Mystery	Agatha Christie	\N	451199928	1964
2419	Three to Get Deadly	Janet Evanovich	\N	312966091	1997
2420	The Nix	Nathan  Hill	\N	110194661X	2016
2421	Once	Anna Carey	\N	62048546	2012
2422	Paladin of Souls	Lois McMaster Bujold	\N	380818612	2003
2423	Black Magic Sanction	Kim Harrison	\N	61138037	2010
2424	The First Wives Club	Olivia Goldsmith	\N	99435136	1992
2425	Lost In Time	Melissa de la Cruz	\N	1423121295	2011
2426	A Wizard of Earthsea	Ursula K. Le Guin	\N	553383043	1968
2427	Thief of Time	Terry Pratchett	\N	61031321	2001
2428	The Sinner	Tess Gerritsen	\N	553815024	2003
2429	Maurice	E.M. Forster	\N	393310329	1971
2430	Round Ireland with a Fridge	Tony Hawks	\N	312274920	1997
2431	The Quillan Games	D.J. MacHale	\N	1416914234	2005
2432	Point Blanc	Anthony Horowitz	\N	142406120	2001
2433	Second Grave on the Left	Darynda Jones	\N	312360819	2011
2434	Rubyfruit Jungle	Rita Mae Brown	\N	553146963	1973
2435	Murder in Mesopotamia	Agatha Christie	\N	7113803	1936
2436	Rocket Boys	Homer Hickam	\N	385333218	1998
2437	Bluebeard	Kurt Vonnegut Jr.	\N	038533351X	1987
2438	The Elite	Kiera Cass	\N	62059963	2013
2439	The Blue Bistro	Elin Hilderbrand	\N	312992629	2005
2440	Mightier Than the Sword	Jeffrey Archer	\N	1250034515	2015
2441	The Outcasts	John Flanagan	\N	399256199	2011
2442	House Rules	Jodi Picoult	\N	743296435	2010
2443	Miss Rumphius	Barbara Cooney	\N	140505393	1981
2444	O Monte Cinco	Paulo Coelho	\N	722536542	1996
2445	Last Breath	Rachel Caine	\N	451234871	2011
2446	Tangerine	Edward Bloor	 Danny De Vito	152057803	1997
2447	About That Night	Julie James	\N	425246957	2012
2448	The Laughing Corpse	Laurell K. Hamilton	\N	425204669	1994
2449	Thirst No. 2	Christopher Pike	\N	1416983090	2010
2450	La Chute	Albert Camus	 Justin O'Brien	679720227	1956
2451	The Emperor's Blades	Brian Staveley	\N	765336405	2014
2452	The Silver Star	Jeannette Walls	\N	1451661509	2013
2453	The Story of an Hour	Kate Chopin	\N	078915479X	1894
2454	To the Nines	Janet Evanovich	\N	747267634	2003
2455	The Dark And Hollow Places	Carrie Ryan	\N	385738595	2011
2456	A Long Way Down	Nick Hornby	\N	1594481938	2005
2457	Knit Two	Kate Jacobs	\N	039915583X	2007
2458	The Vor Game	Lois McMaster Bujold	\N	671720147	1990
2459	The Path to Power	Robert A. Caro	\N	679729453	1982
2460	Frostbitten	Kelley Armstrong	\N	1841497762	2009
2461	Vinegar Hill (P.S.)	A. Manette Ansay	\N	60897848	1994
2462	My Favorite Mistake	Chelsea M. Cameron	\N	1478322306	2012
2463	Edge of Eternity	Ken Follett	\N	525953094	2014
2464	The Moon and More	Sarah Dessen	\N	670785601	2013
2465	Furiously Happy	Jenny  Lawson	\N	1250077001	2015
2466	The Innocent	David Baldacci	\N	446572993	2012
2467	A Walk Across America	Peter Jenkins	\N	006095955X	1979
2468	Magician	Raymond E. Feist	\N	553564943	1982
2469	The Prophet of Yonwood	Jeanne DuPrau	\N	440421241	2006
2470	All Together Dead	Charlaine Harris	\N	441014941	2007
2471	The Crimson Crown	Cinda Williams Chima	\N	1423144333	2012
2472	The River Why	David James Duncan	\N	553344862	1983
2473	Wemberly Worried	Kevin Henkes	\N	688170277	2000
2474	Eve	Anna Carey	\N	62048503	2011
2475	Salt: A World History	Mark Kurlansky	\N	142001619	2002
2476	Galileo's Daughter	Dava Sobel	\N	140280553	1999
2477	The Quiet Game	Greg Iles	\N	340686030	1999
2478	Bloody Bones	Laurell K. Hamilton	\N	425205673	1996
2479	Flipped	Wendelin Van Draanen	\N	375825444	2001
2480	Dune	Frank Herbert	\N	340839937	1965
2481	The Dressmaker	Kate Alcott	\N	385535589	2012
2482	This Charming Man	Marian Keyes	\N	718149122	2008
2483	B is for Burglar	Sue Grafton	\N	312939000	1985
2484	Hornet's Nest	Patricia Cornwell	\N	042516098X	1996
2485	Henry & Ramona	Cynthia J. McGean	\N	871297485	1997
2486	The Winner's Kiss	Marie Rutkoski	\N	374384738	2016
2487	Stolen	Kelley Armstrong	\N	452285933	2002
2488	I Still Dream About You	Fannie Flagg	\N	1400065933	2010
2489	The Scarlet Pimpernel	Emmuska Orczy	\N	1576469239	1905
2490	Among Others	Jo Walton	\N	076532153X	2011
2491	The Secret	Rhonda Byrne	\N	1582701709	2006
2492	The Boy Next Door (Boy #1)	Meg Cabot	\N	60845546	2002
2493	Fade Out	Rachel Caine	\N	451228669	2009
2494	Dearly Devoted Dexter	Jeff Lindsay	\N	1400095921	2005
2495	The Razor's Edge	W. Somerset Maugham	\N	1400034205	1944
2496	The Two Pearls of Wisdom	Alison Goodman	\N	670062278	2008
2497	Startide Rising	David Brin	\N	055327418X	1983
2498	Finding Audrey	Sophie Kinsella	\N	553536516	2015
2499	Dead Beat	Jim Butcher	\N	045146091X	2005
2500	Orientalism	Edward Said	\N	039474067X	1978
2501	The Lady in the Lake	Raymond Chandler	\N	394758250	1943
2502	Winning	Jack Welch	 Suzy Welch	60753943	1992
2503	You Can Win	Shiv Khera	\N	1904910033	1998
2504	Maitreyi	Mircea Eliade	\N	9735004100	1933
2505	The Aquitaine Progression	Robert Ludlum	\N	752858521	1984
2506	Act of Treason	Vince Flynn	\N	743270371	2006
2507	Life	Keith Richards	\N	297854399	2010
2508	Damned	Chuck Palahniuk	\N	385671105	2011
2509	Say Cheese and Die!	R.L. Stine	\N	439568420	1992
2510	Absurdistan	Gary Shteyngart	\N	812971671	2006
2511	Copper Sun	Sharon M. Draper	\N	689821816	2006
2512	Skeletons at the Feast	Chris Bohjalian	\N	307394956	2008
2513	Peril at End House	Agatha Christie	\N	7119305	1932
2514	The Dragon Keeper	Robin Hobb	\N	7273746	2009
2515	Practical Magic	Alice Hoffman	\N	425190374	1995
2516	The Gate House	Nelson DeMille	\N	446533424	2008
2517	Magic Shifts	Ilona Andrews	\N	042527067X	2015
2518	A Quick Bite	Lynsay Sands	\N	60773758	2005
2519	Seize the Night	Sherrilyn Kenyon	\N	749935871	2004
2520	Nemesis	Agatha Christie	\N	451200187	1971
2521	Dirty	Kylie Scott	\N	1250083214	2016
2522	After	Anna Todd	\N	1476792488	2014
2523	The Templar Legacy	Steve Berry	\N	345476166	2006
2524	After the Night	Linda Howard	\N	671019708	1995
2525	Kidnapped	Robert Louis Stevenson	\N	439295785	1886
2526	Fated	Benedict Jacka	\N	1937007294	2012
2527	Blackout	Connie Willis	\N	553803190	2010
2528	Hard Magic	Larry Correia	\N	1439134340	2011
2529	Third Grave Dead Ahead	Darynda Jones	\N	1250001544	2012
2530	Blue Dahlia	Nora Roberts	\N	749935332	2004
2531	Fool Me Once	Harlan Coben	\N	525955097	2016
2532	Black Cat, Volume 1	Kentaro Yabuki	\N	142150605X	2001
2533	Stars of Fortune	Nora Roberts	\N	425280101	2015
2534	Ramona and Her Mother	Beverly Cleary	\N	038070952X	1980
2535	Accelerando	Charles Stross	\N	441014151	2005
2536	Breaking Dawn	Stephenie Meyer	\N	031606792X	2008
2537	The Weight of Glory	C.S. Lewis	\N	60653205	1949
2538	Casino Royale	Ian Fleming	\N	014200202X	1953
2539	Oryx and Crake	Margaret Atwood	\N	385721676	2003
2540	A Spot of Bother	Mark Haddon	\N	385520514	2006
2541	The Pale Rider	Bernard Cornwell	\N	61144835	2005
2542	Such a Rush	Jennifer Echols	\N	145165801X	2012
2543	The Physician	Noah Gordon	\N	751503894	1986
2544	Skipping Christmas	John Grisham	\N	99481685	2001
2545	Sweethearts	Sara Zarr	\N	316014559	2008
2546	The Plains of Passage	Jean M. Auel	\N	553381652	1990
2547	Airframe	Michael Crichton	\N	99556316	1996
2548	Clean Sweep	Ilona Andrews	\N	1625173431	2012
2549	Gone, Baby, Gone	Dennis Lehane	\N	380730359	1998
2550	Daughter	Jane Shemilt	\N	1405915293	2014
2551	Frost Burned	Patricia Briggs	\N	441020011	2013
2552	Twelve Sharp	Janet Evanovich	\N	312349486	2006
2553	Flyy Girl	Omar Tyree	\N	743218574	1993
2554	Rabbit, Run	John Updike	\N	449911659	1960
2555	Homo faber: Ein Bericht	Max Frisch	\N	156421356	1957
2556	The Howling	Gary Brandner	\N	449138240	1977
2557	Hades	Alexandra Adornetto	\N	312656270	2011
2558	Babylon's Ashes	James S.A. Corey	\N	356504263	2016
2559	The Big Bad Wolf  	James Patterson	\N	446610224	2003
2560	Nemesis	Isaac Asimov	\N	553286285	1989
2561	Captains Courageous	Rudyard Kipling	\N	543895882	1897
2562	First Strike	Eric S. Nylund	\N	345467817	2003
2563	The Serpent of Venice	Christopher Moore	\N	61779768	2014
2564	Along for the Ride	Sarah Dessen	\N	670011940	2009
2565	Coyote Blue	Christopher Moore	\N	60735430	1994
2566	Tribute	Nora Roberts	\N	399154914	2008
2567	Foundation's Edge	Isaac Asimov	\N	553293389	1982
2568	The Violets of March	Sarah Jio	\N	452297036	2011
2569	Dead to the World	Charlaine Harris	\N	441012183	2004
2570	The Pilgrims of Rayne	D.J. MacHale	\N	1416914161	2007
2571	Loser	Jerry Spinelli	\N	60540745	2002
2572	Elizabeth Is Missing	Emma Healey	\N	62309668	2014
2573	The Kings of Clonmel	John Flanagan	\N	1741663016	2008
2574	The Measure of a Lady	Deeanne Gist	\N	764200739	2006
2575	Apple Tree Yard	Louise Doughty	\N	571297889	2013
2576	Soulless	Gail Carriger	\N	316056634	2009
2577	The Darkest Kiss	Gena Showalter	\N	373772327	2008
2578	The Well of Lost Plots	Jasper Fforde	\N	143034359	2003
2579	The Far Side Gallery	Gary Larson	\N	836220625	1984
2580	George	Alex Gino	\N	545812542	2015
2581	The Comfort of Strangers	Ian McEwan	\N	679749845	1981
2582	The Novice	Trudi Canavan	\N	1841493147	2002
2583	The Mane Event	Shelly Laurenston	\N	758220367	2007
2584	I Am the Cheese	Robert Cormier	\N	141300515	1977
2585	On a Pale Horse	Piers Anthony	\N	345338588	1983
2586	The Caves of Steel	Isaac Asimov	\N	586008357	1954
2587	Tricked	Kevin Hearne	\N	345533623	2012
2588	Envy (Fallen Angels, #3)	J.R. Ward	\N	349400202	2011
2589	Light on Snow	Anita Shreve	\N	316014281	2004
2590	Clockwork Princess	Cassandra Clare	\N	1406321346	2013
2591	The Returned	Jason Mott	\N	778315339	2013
2592	No Humans Involved	Kelley Armstrong	\N	553588370	2007
2593	The Summer Tree	Guy Gavriel Kay	\N	451458222	1984
2594	That Hideous Strength	C.S. Lewis	\N	7157177	1945
2595	The Manchurian Candidate	Richard Condon	\N	743482972	1959
2596	Cannery Row 	John Steinbeck	\N	014200068X	1945
2597	Inside the O'Briens	Lisa Genova	\N	147671777X	2015
2598	Beautiful Ruins	Jess Walter	\N	61928127	2012
2599	The Beautiful Mystery	Louise Penny	\N	1250031125	2012
2600	The Painted Veil	W. Somerset Maugham	\N	307277771	1925
2601	The Blinding Knife	Brent Weeks	\N	031607991X	2012
2602	Sometimes Never	Cheryl McIntyre	\N	1481268503	2012
2603	Skinny Dip	Carl Hiaasen	\N	446615129	2004
2604	Zero History	William Gibson	\N	399156828	2010
2605	Look to Windward	Iain M. Banks	\N	743421922	2000
2606	Wolf in White Van	John Darnielle	\N	374292086	2014
2607	Evil Under the Sun	Agatha Christie	\N	1579126286	1941
2608	Forget You	Jennifer Echols	\N	1439178232	2010
2609	Sea of Poppies	Amitav Ghosh	\N	071956896X	2008
2610	Lady Friday	Garth Nix	\N	439700884	2007
2611	Phantoms	Dean Koontz	\N	425181103	1983
2612	Get Shorty	Elmore Leonard	\N	006008216X	1990
2613	Raven Black	Ann Cleeves	\N	312359667	2006
2614	The Bonesetter's Daughter	Amy Tan	\N	345457374	2001
2615	Black and Blue	Anna Quindlen	\N	385333137	1998
2616	Dexter by Design	Jeff Lindsay	\N	752885170	2008
2617	Aura	Carlos Fuentes	\N	9580469717	1962
2618	Enclave	Ann Aguirre	\N	312650086	2011
2619	Perfect	Judith McNaught	\N	743474171	1993
2620	Daughter of Smoke & Bone	Laini Taylor	\N	316134023	2011
2621	Sphere	Michael Crichton	\N	345418972	1987
2622	Sahara	Clive Cussler	\N	030720961X	1992
2623	Night Watch	Terry Pratchett	\N	055215430X	2002
2624	Cry Wolf	Patricia Briggs	\N	441016154	2008
2625	Old Yeller	Fred Gipson	\N	60935472	1956
2626	The Book of Lost Things	John Connolly	\N	743298853	2006
2627	LaRose	Louise Erdrich	\N	62277022	2016
2628	House of Many Ways	Diana Wynne Jones	\N	61477958	2008
2629	Leota's Garden	Francine Rivers	\N	842335722	1999
2630	Gathering Blue	Lois Lowry	\N	385732562	2000
2631	Guilty as Sin (Deer Lake #2)	Tami Hoag	\N	752815393	1996
2632	The Art Forger	B.A. Shapiro	\N	1616201320	2012
2633	Mere Christianity	C.S. Lewis	\N	684823780	1952
2634	Stolen Prey	John Sandford	\N	399157689	2012
2635	The Matchmaker	Elin Hilderbrand	\N	316099759	2014
2636	The Lost Symbol	Dan Brown	\N	385504225	2009
2637	The Storyteller	Jodi Picoult	\N	1439102767	2013
2638	Black-Eyed Susans	Julia Heaberlin	\N	804177996	2015
2639	Grim Tuesday	Garth Nix	\N	439703700	2004
2640	King's Cage	Victoria Aveyard	\N	62310712	2017
2641	Diary	Chuck Palahniuk	\N	1400032814	2003
2642	Passenger	Alexandra Bracken	\N	1484715772	2016
2643	A Chair for My Mother 	Vera B. Williams	\N	688040748	1982
2644	The Kept Woman	Karin Slaughter	\N	62430211	2016
2645	The Life List	Lori Nelson Spielman	\N	345540875	2013
2646	Pandemonium	Lauren Oliver	\N	006197806X	2012
2647	Fight Club	Chuck Palahniuk	\N	393327345	1996
2648	Train to Pakistan	Khushwant Singh	\N	802132219	1956
2649	Burned	Karen Marie Moning	\N	385344414	2015
2650	Moon Palace	Paul Auster	\N	140115854	1989
2651	My Booky Wook	Russell Brand	\N	340936150	2007
2652	I Heart New York	Lindsey Kelk	\N	7288387	2009
2653	Autumn in Paris	Ilana Tan	\N	9792230300	2007
2654	Imperial Bedrooms	Bret Easton Ellis	\N	330517090	2010
2655	Angelfall	Susan Ee	\N	144477851X	2011
2656	My Sweet Audrina	V.C. Andrews	\N	671729462	1982
2657	A Certain Slant of Light	Laura Whitcomb	\N	061858532X	2005
2658	Airborn	Kenneth Oppel	\N	60531827	2004
2659	The Stonekeeper	Kazu Kibuishi	\N	439846803	2008
2660	Son (The Giver, #4)	Lois Lowry	\N	547887205	2012
2661	Amazonia	James Rollins	\N	60002492	2002
2662	Inherent Vice	Thomas Pynchon	\N	1594202249	2009
2663	You'll Grow Out of It	Jessi Klein	\N	1455531189	2016
2664	The Cement Garden	Ian McEwan	\N	99468387	1978
2665	Married By Morning	Lisa Kleypas	\N	312605382	2010
2666	Just After Sunset	Stephen King	\N	1416584080	2008
2667	The Abduction	John Grisham	\N	1444736930	2010
2668	While My Sister Sleeps	Barbara Delinsky	\N	385524927	2009
2669	Anne of Windy Poplars	L.M. Montgomery	\N	808516965	1936
2670	Main Street	Sinclair Lewis	\N	375753141	1920
2671	Fool's Errand	Robin Hobb	\N	6486010	2001
2672	Chocolat	Joanne Harris	\N	014100018X	1998
2673	Incarceron	Catherine Fisher	\N	340893605	2007
2674	The Firebird	Susanna Kearsley	\N	140227663X	2013
2675	The House We Grew Up In	Lisa Jewell	\N	1476702993	2013
2676	Dandelion Wine	Ray Bradbury	\N	671037706	1957
2677	The Dispossessed	Ursula K. Le Guin	\N	61054887	1974
2678	The Tale of the Body Thief	Anne Rice	\N	345419634	1992
2679	Back Roads	Tawni O'Dell	\N	451212452	1999
2680	Oracle Night	Paul Auster	\N	965913228	2004
2681	The Indigo Spell	Richelle Mead	\N	159514319X	2013
2682	Better Than Life	Grant Naylor	\N	451452313	1990
2683	The Mammoth Hunters	Jean M. Auel	\N	553381644	1985
2684	Shadows of Self	Brandon Sanderson	\N	765378558	2015
2685	Hot Ticket	Olivia Cunning	\N	1402245858	2013
2686	The Invention of Wings	Sue Monk Kidd	\N	670024783	2014
2687	Whose Body?	Dorothy L. Sayers	\N	61043575	1923
2688	Us	David Nicholls	\N	034089699X	2014
2689	Inheritance	Christopher Paolini	\N	375856110	2011
2690	The Last Patriot	Brad Thor	\N	141654383X	2008
2691	Black Notice	Patricia Cornwell	\N	425175405	1999
2692	Until I Find You	John Irving	\N	345479726	2005
2693	Tiger Lily	Jodi Lynn Anderson	\N	62114611	2012
2694	The Human Stain	Philip Roth	\N	99282194	2000
2695	The Lords of Discipline	Pat Conroy	\N	553271369	1980
2696	Finding Cinderella	Colleen Hoover	\N	147677143X	2013
2697	Shopaholic and Sister	Sophie Kinsella	\N	044024191X	2004
2698	The Black Company	Glen Cook	\N	812521390	1984
2699	The Rose & the Dagger	Renee Ahdieh	\N	399171622	2016
2700	The Orc King	R.A. Salvatore	\N	786943408	2007
2701	Home	Marilynne Robinson	\N	374299102	2008
2702	Dark Guardian	Christine Feehan	\N	843949945	2002
2703	Strengths Finder 2.0	Tom Rath	\N	159562015X	2007
2704	Edvard Munch	Ulrich Bischoff	\N	3822859710	1990
2705	The Temple of My Familiar	Alice Walker	\N	753819481	1989
2706	Three Junes	Julia Glass	\N	385721420	2002
2707	Contest	Matthew Reilly	\N	312286252	1996
2708	A Cup of Friendship	Deborah Rodriguez	\N	174275001X	2011
2709	Life As We Knew It	Susan Beth Pfeffer	\N	152061548	2006
2710	Nightmares & Dreamscapes 	Stephen King	\N	450610098	1993
2711	Glass Sword	Victoria Aveyard	\N	62310666	2016
2712	A Complicated Kindness	Miriam Toews	\N	1582433224	2004
2713	Psycho	Robert Bloch	\N	747545251	1959
2714	The Glass Lake	Maeve Binchy	\N	752876872	1994
2715	Hollywood	Charles Bukowski	\N	843391426X	1989
2716	An Ember in the Ashes	Sabaa Tahir	\N	1595148035	2015
2717	The Other Daughter	Lisa Gardner	\N	553576798	1999
2718	Never Look Away	Linwood Barclay	\N	055380717X	2010
2719	Written in Red	Anne Bishop	\N	451464966	2013
2720	One for the Money	Janet Evanovich	\N	312362080	1994
2721	The Lost World 	Arthur Conan Doyle	\N	812967259	1912
2722	Raising Steam	Terry Pratchett	\N	857522272	2013
2723	The Odessa File	Frederick Forsyth	\N	553271989	1972
2724	Salmon Fishing in the Yemen	Paul Torday	\N	753821788	2006
2725	Junk	Melvin Burgess	\N	380732238	1996
2726	Carolina Moon	Nora Roberts	\N	515130389	2000
2727	Cop Town	Karin Slaughter	\N	345547497	2014
2728	Library of Souls 	Ransom Riggs	\N	159474758X	2015
2729	The Visitor	Lee Child	\N	515130974	2000
2730	The Dog Stars	Peter Heller	\N	307959945	2012
2731	Music of the Heart	Katie Ashley	\N	1301786454	2013
2732	Economics in One Lesson	Henry Hazlitt	\N	517548233	1946
2733	Longitude	Dava Sobel	 Neil Armstrong	802714625	1995
2734	Blankets	Craig Thompson	\N	1891830430	2003
2735	The Secret Servant	Daniel Silva	\N	399154221	2007
2736	After I'm Gone	Laura Lippman	\N	62083392	2014
2737	This Present Darkness	Frank E. Peretti	\N	1581345283	1986
2738	A Scanner Darkly 	Philip K. Dick	\N	057507681X	1977
2739	The Black Prism	Brent Weeks	\N	316075558	2010
2740	The Chaperone	Laura Moriarty	\N	1594487014	2012
2741	Skinwalker	Faith Hunter	\N	451462807	2009
2742	Princeps' Fury	Jim Butcher	\N	441016383	2008
2743	Abarat	Clive Barker	\N	64407330	2002
2744	If You Find Me	Emily Murdoch	\N	1250021529	2013
2745	The Secret Between Us	Barbara Delinsky	\N	385518684	2008
2746	The Collector	Nora Roberts	\N	399171088	2014
2747	Emperor of Thorns	Mark  Lawrence	\N	425256855	2013
2748	The Engagements	J. Courtney Sullivan	\N	030795871X	2013
2749	Plum Island	Nelson DeMille	\N	446679089	1997
2750	The Oath	Frank E. Peretti	\N	1595541896	1995
2751	Morgawr 	Terry Brooks	\N	345435753	2002
2752	The Smoke Jumper	Nicholas Evans	\N	440235162	2001
2753	Mortal Engines	Philip Reeve	\N	60082097	2001
2754	The Water is Wide	Pat Conroy	\N	553381571	1969
2755	Private Peaceful	Michael Morpurgo	\N	439636485	2003
2756	The Red Garden	Alice Hoffman	\N	307393879	2011
2757	A Perfect Evil	Alex Kava	\N	778322335	2000
2758	Sandry's Book	Tamora Pierce	\N	590554085	1997
2759	Forever . . .	Judy Blume	\N	033039780X	1975
2760	Bless Me, Ultima	Rudolfo Anaya	\N	446675369	1972
2761	Mila 18	Leon Uris	\N	553241605	1961
2762	The Marriage Bargain	Jennifer Probst	\N	1937044963	2012
2763	Requiem (Providence #2)	Jamie McGuire	\N	615487424	2011
2764	The Shining Girls	Lauren Beukes	\N	316216852	2013
2765	Dark Fire	Christine Feehan	\N	505524473	2001
2766	On the Way to Wedding	Julia Quinn	\N	60531258	2006
2767	Drop City	T.C. Boyle	 Richard Poe	142003808	2003
2768	Star Wars: Lost Stars	Claudia Gray	\N	1484724984	2015
2769	The Sapphire Rose 	David Eddings	\N	034537472X	1991
2770	The Runaway Jury	John Grisham	\N	385339690	1996
2771	The Shell Seekers	Rosamunde Pilcher	\N	051722285X	1987
2772	Dark Rivers of the Heart	Dean Koontz	\N	553582895	1994
2773	Drowned Wednesday	Garth Nix	\N	439436567	2004
2774	Until You	Judith McNaught	\N	552143545	1994
2775	Tara Road	Maeve Binchy	\N	440235596	1998
2776	Revelations	Melissa de la Cruz	\N	1423102282	2008
2777	The Feast of All Saints	Anne Rice	\N	345376048	1979
2778	Big Trouble	Dave Barry	\N	425178102	1999
2779	Stitches: A Memoir	David Small	\N	393068579	2009
2780	A Window Opens	Elisabeth Egan	\N	1501105434	2015
2781	Darkest Hour	Meg Cabot	\N	60725141	2001
2782	Blood Red Road 	Moira Young	\N	1442429984	2011
2783	Mountain Interval	Robert Frost	\N	486275507	1916
2784	Fuzzy Nation	John Scalzi	\N	765328542	2011
2785	A Gentleman in Moscow	Amor Towles	\N	670026190	2016
2786	Shadow Spell	Nora Roberts	\N	425259862	2014
2787	The Skull Throne	Peter V. Brett	\N	345531485	2015
2788	Songs of Willow Frost	Jamie Ford	\N	345522028	2013
2789	The Lost Saint	Bree Despain	\N	1606840584	2010
2790	Partials	Dan Wells	\N	62071041	2012
2791	Prayers for Rain 	Dennis Lehane	\N	380730367	1999
2792	Fire Touched	Patricia Briggs	\N	425256766	2016
2793	A Different Blue	Amy Harmon	\N	1482658143	2013
2794	Queen of Babble Gets Hitched	Meg Cabot	\N	006085202X	2008
2795	Slave to Sensation	Nalini Singh	\N	425212866	2006
2796	The Wrath & the Dawn	Renee Ahdieh	\N	399171614	2015
2797	The Amulet of Samarkand	Jonathan Stroud	\N	078681859X	2003
2798	The Memory of Earth	Orson Scott Card	\N	812532597	1992
2799	Supernova: Petir	Dee Lestari	\N	9799822939	2004
2800	Children of the Mind	Orson Scott Card	\N	765304740	1996
2801	All the Pretty Horses	Cormac McCarthy	\N	679744398	1992
2802	Tyrannosaur Canyon	Douglas Preston	\N	765349655	2005
2803	The Akhenaten Adventure	P.B. Kerr	\N	439670209	2004
2804	Sabriel	Garth Nix	\N	64471837	1995
2805	Wicked Lovely 	Melissa Marr	\N	61214655	2007
2806	Graffiti Moon	Cath Crowley	\N	330425781	2010
2807	Magyk	Angie Sage	\N	60577312	2005
2808	The Heart Goes Last	Margaret Atwood	\N	385540353	2015
2809	These High, Green Hills	Jan Karon	\N	1589190645	1995
2810	Living History	Hillary Rodham Clinton	\N	743222253	2003
2811	A Study in Scarlet	Arthur Conan Doyle	\N	1420925539	1887
2812	Monster	Frank E. Peretti	\N	1595541217	2005
2813	Deeper than Midnight	Lara Adrian	\N	440246113	2011
2814	The Likeness	Tana French	\N	670018864	2008
2815	Ragtime	E.L. Doctorow	\N	812978188	1974
2816	Second Chance Summer	Morgan Matson	\N	1416990674	2012
2817	Cities of the Plain 	Cormac McCarthy	\N	679747192	1996
2818	Heartless	Marissa Meyer	\N	1250044650	2016
2819	Half Blood Blues	Esi Edugyan	\N	1846687756	2011
2820	City of Golden Shadow	Tad Williams	\N	886777631	1996
2821	Saphirblau	Kerstin Gier	\N	3401063472	2010
2822	Deception Point	Dan Brown	\N	671027387	2001
2823	Chromosome 6	Robin Cook	\N	425161242	1997
2824	Christy	Catherine Marshall	\N	310241634	1967
2825	The Nest	Cynthia D'Aprix Sweeney	\N	62414216	2016
2826	Run	Ann Patchett	\N	61340634	2007
2827	Memory	Doug Lloyd	\N	1632168146	2015
2828	On the Jellicoe Road	Melina Marchetta	\N	670070297	2006
2829	Lord of Scoundrels	Loretta Chase	\N	380776162	1995
2830	Rebel of the Sands	Alwyn Hamilton	\N	698410424	2016
2831	Skinny Legs and All	Tom Robbins	\N	1842430343	1990
2832	T is for Trespass 	Sue Grafton	\N	399154485	2007
2833	The Girl of Fire and Thorns	Rae Carson	\N	62026488	2011
2834	In the Woods	Tana French	\N	670038601	2007
2835	Stone of Tears	Terry Goodkind	\N	312857063	1995
2836	The Assassin's Blade	Sarah J. Maas	\N	1408852594	2014
2837	Vanish	Sophie Jordan	\N	61935107	2011
2838	A Trick of the Light	Louise Penny	\N	312655452	2011
2839	Beezus and Ramona	Beverly Cleary	\N	192750968	1955
2840	The Human Division	John Scalzi	\N	765333511	2013
2841	Barnyard Dance	Sandra Boynton	\N	1563054426	1993
2842	Dark Desire	Christine Feehan	\N	843956534	1999
2843	Cleopatra's Daughter	Michelle Moran	\N	184724954X	2009
2844	Twilight Eyes	Dean Koontz	\N	425100650	1984
2845	Lover Unbound	J.R. Ward	\N	451222350	2007
2846	The Namesake	Jhumpa Lahiri	\N	618485228	2003
2847	Pardonable Lies	Jacqueline Winspear	\N	312426216	2005
2848	The Summer I Turned Pretty	Jenny Han	\N	1416968237	2009
2849	The Testament	John Grisham	\N	440234743	1999
2850	The Magic of Recluce	L.E. Modesitt Jr.	\N	812505182	1991
2851	The Year of Fog	Michelle Richmond	\N	385340117	2006
2852	Archangel's Blade	Nalini Singh	\N	425243915	2011
2853	SilverFin	Charlie Higson	\N	078683661X	2005
2854	Lothaire	Kresley Cole	\N	1439136823	2012
2855	Watership Down	Richard Adams	\N	038039586X	1972
2856	Crank (Crank, #1)	Ellen Hopkins	\N	689865198	2004
2857	The Wounded Land	Stephen R. Donaldson	\N	345418468	1979
2858	Anne of Green Gables	L.M. Montgomery	\N	451528824	1908
2859	The Eternity Code	Eoin Colfer	\N	141321318	2003
2860	Key of Knowledge	Nora Roberts	\N	739439065	2003
2861	Lily and the Octopus	Steven  Rowley	\N	1501126229	2016
2862	Rich Man, Poor Man	Irwin Shaw	\N	440174244	1969
2863	The Great Book of Amber	Roger Zelazny	\N	380809060	1999
2864	Love You More	Lisa Gardner	\N	553807250	2011
2865	Acceptance	Jeff VanderMeer	\N	374104115	2014
2866	Birthright	Nora Roberts	\N	515137111	2003
2867	Open City	Teju Cole	\N	1400068096	2011
2868	Roses	Leila Meacham	\N	446550000	2010
2869	The Complete Works	William Shakespeare	\N	517053616	1623
2870	Best Kept Secret	Jeffrey Archer	\N	125000098X	2013
2871	The Lions of Lucerne	Brad Thor	\N	1416543686	2002
2872	The Magician King	Lev Grossman	\N	043402080X	2011
2873	One Week Girlfriend	Monica  Murphy	\N	098836946X	2013
2874	The Queen	Kiera Cass	\N	62351206	2014
2875	The Bitter Kingdom	Rae Carson	\N	62026542	2013
2876	Lucky	Alice Sebold	\N	033041836X	1999
2877	Lucky	Jackie Collins	\N	743482867	1985
2878	Tiger's Quest	Colleen Houck	\N	140278404X	2011
2879	The Simple Truth	David Baldacci	\N	446607711	1998
2880	A Rogue by Any Other Name	Sarah MacLean	\N	62068520	2012
2881	End of Watch	Stephen King	\N	1501129740	2016
2882	La lenteur	Milan Kundera	 Linda Asher	60928417	1995
2883	The Colorado Kid	Stephen King	\N	843955848	2005
2884	The Fifth Season	N.K. Jemisin	\N	316229296	2015
2885	'Tis: A Memoir	Frank McCourt	\N	6551815	1999
2886	The Gold Coast	Nelson DeMille	\N	751531219	1990
2887	Cruel & Unusual	Patricia Cornwell	\N	380718340	1993
2888	X	Sue Grafton	\N	399163840	2015
2889	Valley of Silence	Nora Roberts	\N	786286806	2006
2890	Happy Ever After	Nora Roberts	\N	1423368991	2010
2891	The Faithful Spy	Alex Berenson	\N	345478991	2006
2892	Rules	Cynthia Lord	\N	439443822	2006
2893	Z for Zachariah	Robert C. O'Brien	\N	435122118	1974
2894	Chasing the Dime	Michael Connelly	\N	044661162X	2002
2895	Naked Heat	Richard Castle	\N	1401324029	2010
2896	The Flamethrowers	Rachel Kushner	\N	1439142009	2013
2897	Airport	Arthur Hailey	\N	425176088	1968
2898	The House at Tyneford	Natasha Solomons	\N	452297648	2011
2899	Howards End	E.M. Forster	\N	486424545	1910
2900	This Boy's Life: A Memoir	Tobias Wolff	\N	802136680	1989
2901	Dumplin'	Julie   Murphy	\N	62327186	2015
2902	Just One Look	Harlan Coben	\N	451213203	2004
2903	Temple	Matthew Reilly	\N	312981260	1999
2904	Plum Lucky 	Janet Evanovich	\N	312377630	2008
2905	The Gunslinger	Stephen King	\N	452284694	1982
2906	Back Spin	Harlan Coben	\N	440222702	1997
2907	Fallen	Karin Slaughter	\N	345528204	2011
2908	Zero Day	David Baldacci	\N	446573019	2011
2909	Revenge of the Spellmans	Lisa Lutz	\N	1416593381	2009
2910	Gaudy Night	Dorothy L. Sayers	\N	61043494	1935
2911	The Passage	Justin Cronin	\N	345504968	2010
2912	The Exiled Queen	Cinda Williams Chima	\N	1423118243	2010
2913	The Bookseller	Cynthia Swanson	\N	62333003	2015
2914	The Art of Fielding	Chad Harbach	\N	316126691	2011
2915	Le Roi Babar	Jean de Brunhoff	\N	1405204664	1933
2916	Angels Fall	Nora Roberts	\N	399153721	2006
2917	Means of Ascent 	Robert A. Caro	\N	067973371X	1990
2918	Shroud for a Nightingale	P.D. James	\N	743219600	1971
2919	The Wanderer	Robyn Carr	\N	778314472	2013
2920	The Last Full Measure	Jeff Shaara	\N	345434811	1991
2921	Unleash the Night	Sherrilyn Kenyon	\N	312934335	2005
2922	Sandstorm	James Rollins	\N	60580674	2004
2923	The 5th Wave	Rick Yancey	\N	399162410	2013
2924	Black 1. The Birth of Evil	Ted Dekker	\N	1595540210	2003
2925	Kill Alex Cross	James Patterson	\N	1846057647	2011
2926	The Rapture of Canaan	Sheri Reynolds	\N	425162443	1995
2927	The Client	John Grisham	\N	385339089	1993
2928	Pretties	Scott Westerfeld	\N	689865392	2005
2929	Outlander	Diana Gabaldon	\N	440242940	1991
2930	Sleepers	Lorenzo Carcaterra	\N	2266071289	1995
2931	Graduation Day	Joelle Charbonneau	\N	547959214	2014
2932	The Private Patient	P.D. James	\N	571242448	2008
2933	Rise of the Evening Star	Brandon Mull	\N	1590387422	2006
2934	The Power of Now	Eckhart Tolle	\N	1577314808	1997
2935	A Mango-Shaped Space	Wendy Mass	\N	316058254	2005
2936	The Viscount Who Loved Me	Julia Quinn	\N	380815575	2000
2937	Angel 	L.A. Weatherly	\N	1409521966	2010
2938	All Our Yesterdays	Cristin Terrill	\N	1423176375	2013
2939	The Robber Bride	Margaret Atwood	\N	385491034	1993
2940	Born to Run	Bruce Springsteen	\N	1501141511	2016
2941	Look Homeward, Angel	Thomas Wolfe	\N	743297318	1929
2942	Heartsick	Chelsea Cain	\N	312368461	2007
2943	My Life	Bill Clinton	\N	140003003X	2004
2944	Bee Season	Myla Goldberg	\N	385498802	2000
2945	Generation Kill	Evan Wright	\N	042520040X	2004
2946	Innocence	Dean Koontz	\N	553808036	2013
2947	The Peach Keeper 	Sarah Addison Allen	\N	553807226	2011
2948	Shopaholic Abroad	Sophie Kinsella	\N	440241812	2001
2949	The Last Policeman	Ben H. Winters	\N	1594745765	2012
2950	The Sword in the Stone	T.H. White	\N	000675399X	1938
2951	Red Dragon	Thomas Harris	\N	525945563	1981
2952	Tigers in Red Weather	Liza Klaussmann	\N	316211338	2012
2953	Mean Streak	Sandra Brown	\N	1455581127	2014
2954	Delicious!	Ruth Reichl	\N	1400069629	2014
2955	Lost in a Good Book	Jasper Fforde	\N	142004030	2002
2956	Magic Rises	Ilona Andrews	\N	1937007588	2013
2957	Daddy's Little Girl	Mary Higgins Clark	\N	743460529	2002
2958	Heir to the Empire	Timothy Zahn	\N	553296124	1991
2959	MacRieve	Kresley Cole	\N	1451649916	2013
2960	SantaLand Diaries	David Sedaris	\N	349119759	1998
2961	Where Rainbows End	Cecelia Ahern	\N	786891084	2004
2962	Ice Hunt	James Rollins	\N	60521600	2003
2963	Birdman	Mo Hayder	\N	440236169	1999
2964	Sweet Tooth	Ian McEwan	\N	224097377	2012
2965	Misguided Angel	Melissa de la Cruz	\N	1423121287	2010
2966	The Uplift War	David Brin	\N	553279718	1987
2967	Sir Thursday	Garth Nix	\N	439436575	2006
2968	Big Brother	Lionel Shriver	\N	61458570	2013
2969	The Diamond Throne	David Eddings	\N	345367693	1989
2970	Bright Lights, Big City	Jay McInerney	\N	394726413	1984
2971	The Dark Half	Stephen King	\N	045052468X	1989
2972	Everbound	Brodi Ashton	\N	62071165	2013
2973	Legally Blonde	Amanda Brown	\N	751534552	2001
2974	The Orenda	Joseph Boyden	\N	670064181	2013
2975	Silence	Natasha Preston	\N	1480118516	2012
2976	Howl's Moving Castle	Diana Wynne Jones	\N	006441034X	1986
2977	Reservation Blues	Sherman Alexie	\N	802141900	1995
2978	Elantris	Brandon Sanderson	\N	765350378	2005
2979	Cujo	Stephen King	\N	307348245	1981
2980	The Beast	J.R. Ward	\N	045147516X	2016
2981	The Dark Tower	Stephen King	\N	1416524525	2004
2982	The Monstrumologist	Rick Yancey	\N	1416984488	2009
2983	Remember Me?	Sophie Kinsella	\N	593053893	2008
2984	We Are Water	Wally Lamb	\N	61941026	2013
2985	Hope to Die	James Patterson	\N	178089015X	2014
2986	The Edge of Always	J.A. Redmerski	\N	1455549002	2013
2987	Black Dawn	Rachel Caine	\N	451236718	2012
2988	Die Traumdeutung	Sigmund Freud	\N	1566195764	1899
2989	Slade House	David Mitchell	\N	812998685	2015
2990	The Color Purple	Alice Walker	\N	671727796	1982
2991	Aftermath	Chuck Wendig	\N	080417766X	2015
2992	Starters	Lissa Price	\N	385742371	2012
2993	Assassin's Apprentice	Robin Hobb	\N	6480098	1995
2994	Annihilation	Jeff VanderMeer	\N	374104093	2014
2995	Green Mars	Kim Stanley Robinson	\N	553572393	1994
2996	Book of Shadows	Cate Tiernan	\N	142409863	2001
2997	Tai-Pan	James Clavell	\N	440184622	1966
2998	Succulent Wild Woman	S.A.R.K.	\N	068483376X	1997
2999	Shotgun Lovesongs	Nickolas Butler	\N	1250039819	2014
3000	Seven Up	Janet Evanovich	\N	312980140	2001
3001	Silken Prey	John Sandford	\N	399159312	2013
3002	Mutant Message Down Under	Marlo Morgan	\N	60723513	1990
3003	The Dark Highlander	Karen Marie Moning	\N	440237556	2002
3004	Five Go to Smuggler's Top	Enid Blyton	\N	340796189	1942
3005	The Joy Luck Club	Amy Tan	\N	143038095	1989
3006	The Matlock Paper	Robert Ludlum	\N	752858637	1973
3007	Feed	M.T. Anderson	\N	763622591	2002
3008	The Illearth War	Stephen R. Donaldson	\N	345348664	1977
3009	I Am Number Four	Pittacus Lore	\N	61969559	2010
3010	Not My Daughter	Barbara Delinsky	\N	385524986	2009
3011	Doctors	Erich Segal	\N	553278118	1988
3012	Panic	Lauren Oliver	\N	62014552	2014
3013	All He Ever Wanted	Anita Shreve	\N	316010367	2003
3014	Black List	Brad Thor	\N	1439192987	2012
3015	Story of a Girl	Sara Zarr	\N	316014532	2007
3016	Terrier	Tamora Pierce	\N	037581468X	2006
3017	Franny and Zooey	J.D. Salinger	\N	316769029	1961
3018	September	Rosamunde Pilcher	\N	340752459	1990
3019	Mister Pip	Lloyd Jones	\N	385341067	2006
3020	xxxHOLiC #1	CLAMP	 William Flanagan	345470583	2003
3021	Magic's Promise	Mercedes Lackey	\N	886774012	1990
3022	Hell's Angels	Hunter S. Thompson	\N	222109073X	1966
3023	Wizard at Large 	Terry Brooks	\N	1857231031	1987
3024	The Lions of Little Rock	Kristin Levine	\N	039925644X	2012
3025	Horus Rising	Dan Abnett	\N	184416294X	2006
3026	Hallucinations	Oliver Sacks	\N	307957241	1995
3027	The Castle of Llyr	Lloyd Alexander	\N	805080503	1966
3028	Dreamless	Josephine Angelini	\N	62012010	2012
3029	The Book of Life	Deborah Harkness	\N	670025593	2014
3030	Two-Way Street	Lauren Barnholdt	\N	1416913184	2007
3031	The Little Friend	Donna Tartt	\N	1400031699	2002
3032	The Sword of Summer	Rick Riordan	\N	1423160916	2015
3033	The Secret River	Kate Grenville	\N	1841959146	2005
3034	The Art of Travel	Alain de Botton	\N	375725342	2002
3035	The Invisible Library	Genevieve Cogman	\N	1447256239	2015
3036	The Blessing Way	Tony Hillerman	\N	61000019	1970
3037	Daring to Dream	Nora Roberts	\N	515142905	1996
3038	Laskar Pelangi	Andrea Hirata	\N	9793062797	2005
3039	Best Friends Forever	Jennifer Weiner	\N	743294297	2009
3040	Tower Lord	Anthony  Ryan	\N	425265625	2014
3041	Salvage the Bones	Jesmyn Ward	\N	1608195228	2010
3042	Don't Look Back	Jennifer L. Armentrout	\N	1423175123	2014
3043	The Gargoyle	Andrew Davidson	\N	385524943	2008
3044	Karin	Yuna Kagesaki	\N	1598163221	2003
3045	The Water-Method Man	John Irving	\N	034541800X	1972
3046	The Damnation Game	Clive Barker	\N	425188930	1985
3047	Shadow Puppets	Orson Scott Card	\N	765340054	2002
3048	Brida	Paulo Coelho	 Montserrat Mira	9504915248	1990
3049	Priestess of the White	Trudi Canavan	\N	60815701	2005
3050	Flawless	Sara Shepard	\N	60887338	2007
3051	How to Be Good	Nick Hornby	\N	3426615355	2001
3052	State Of The Union	Brad Thor	\N	1416543694	2004
3053	A Clockwork Orange	Anthony Burgess	\N	393312836	1962
3054	Last Orders	Graham Swift	\N	330489674	1996
3055	Sins & Needles	Karina Halle	\N	1479359084	2013
3056	The Dragon Heir	Cinda Williams Chima	\N	1423110706	2008
3057	Change of Heart	Jodi Picoult	\N	743496744	2008
3058	Hounded	Kevin Hearne	\N	345522478	2011
3059	The Pleasure of My Company	Steve Martin	\N	786888016	2003
3060	Magic Burns	Ilona Andrews	\N	441015832	2008
3061	Shards of Honor	Lois McMaster Bujold	\N	743468422	1986
3062	The Cold Dish	Craig Johnson	\N	143036424	2004
3063	Shadowland	Alyson Noel	\N	031259044X	2009
3064	Deep Fathom	James Rollins	\N	380818809	2001
3065	Hearts in Atlantis	Stephen King	\N	340818670	1999
3066	The Island	Victoria Hislop	\N	755309510	2005
3067	I, Elizabeth	Rosalind Miles	\N	609809105	1992
3068	Astonish Me	Maggie Shipstead	\N	307962903	2014
3069	Duck On A Bike	David Shannon	\N	439050235	2002
3070	Darkness, Be My Friend	John Marsden	\N	043985802X	1996
3071	Mattimeo	Brian Jacques	\N	441006108	1990
3072	Hark! A Vagrant	Kate Beaton	\N	1770460608	2011
3073	When You Reach Me	Rebecca Stead	\N	385737424	2009
3074	Bagombo Snuff Box	Kurt Vonnegut Jr.	\N	99282968	1999
3075	Leviathan	Scott Westerfeld	\N	1416971734	2009
3076	Crescendo	Becca Fitzpatrick	\N	1416989439	2010
3077	The Red Queen	Philippa Gregory	\N	1416563725	2010
3078	NOS4A2	Joe Hill	\N	62200577	2013
3079	Shadow of the Hegemon	Orson Scott Card	\N	812565959	2000
3080	Keep Quiet	Lisa Scottoline	\N	1250010098	2014
3081	Sisterhood Everlasting	Ann Brashares	\N	385521227	2011
3082	Leviathan	Paul Auster	\N	140178139	1992
3083	Pyramids	Terry Pratchett	\N	61020656	1989
3084	World After	Susan Ee	\N	1444778536	2013
3085	Time and Again	Jack Finney	\N	575073608	1970
3086	Something Blue	Emily Giffin	\N	312323867	2005
3087	Epic Fail	Claire LaZebnik	\N	61921262	2011
3088	The Gathering	Kelley Armstrong	\N	61797022	2011
3089	The Darkest Pleasure	Gena Showalter	\N	373773102	2008
3090	The Story of My Life	Helen Keller	\N	553213873	1902
3091	The Imperfectionists	Tom Rachman	\N	385343663	2010
3092	Shadowfever	Karen Marie Moning	\N	385341679	2011
3093	Very Valentine	Adriana Trigiani	\N	61257052	2009
3094	Why Not Me?	Mindy Kaling	\N	804138141	2015
3095	A Wrinkle in Time	Madeleine L'Engle	\N	440498058	1962
3096	The Revenant	Michael Punke	\N	125006662X	2002
3097	Strangers on a Train	Patricia Highsmith	\N	393321983	1950
3098	The Ice Queen	Alice Hoffman	\N	316154385	2005
3099	Faking It 	Jennifer Crusie	\N	312932782	2002
3100	The People of Sparks	Jeanne DuPrau	\N	375828257	2004
3101	Food Rules	Michael Pollan	\N	014311638X	2008
3102	Promises in Death	J.D. Robb	\N	399155481	2009
3103	Kane and Abel	Jeffrey Archer	\N	312995059	1979
3104	Dark Desires After Dusk	Kresley Cole	\N	1416576754	2008
3105	Wolf Hall	Hilary Mantel	\N	7230206	2009
3106	Real	Katy Evans	\N	1301347949	2013
3107	Euphoria	Lily King	\N	802122558	2014
3108	Indelible	Karin Slaughter	\N	60567112	2004
3109	Yu Yu Hakusho	Yoshihiro Togashi	\N	1569319049	1990
3110	Dreamfever	Karen Marie Moning	\N	385341652	2009
3111	Tigana	Guy Gavriel Kay	\N	451457765	1990
3112	The Burning Land	Bernard Cornwell	\N	000721975X	2009
3113	Storm Glass	Maria V. Snyder	\N	778325644	2009
3114	The Death Cure	James Dashner	\N	385738773	2011
3115	Rejoice	Karen Kingsbury	 Gary Smalley	84386874	2004
3116	Before I Die	Jenny Downham	\N	385613466	2007
3117	The Iron Daughter	Julie Kagawa	\N	373210132	2010
3118	W is for Wasted	Sue Grafton	\N	399158987	2013
3119	Dark Places	Gillian Flynn	\N	307341569	2009
3120	Strangers	Dean Koontz	\N	425181111	1986
3121	Ghost Town	Rachel Caine	\N	451231619	2010
3122	Brotherhood in Death	J.D. Robb	\N	399170898	2016
3123	Ash	Malinda Lo	\N	316040096	2009
3124	Firestar's Quest	Erin Hunter	\N	61131644	2007
3125	The Fifth Witness	Michael Connelly	\N	316069353	2011
3126	The Cider House Rules	John Irving	\N	786226749	1985
3127	Gabriel's redemption	Sylvain Reynard	\N	425266516	2013
3128	Prized	Caragh M. O'Brien	\N	1596435704	2011
3129	Buried Prey	John Sandford	\N	399157387	2011
3130	The Witching Hour	Anne Rice	\N	99471426	1990
3131	And the Shofar Blew	Francine Rivers	\N	842365834	2003
3132	Wicked Business	Janet Evanovich	\N	345527771	2012
3133	How We Are Hungry	Dave Eggers	\N	1400095565	2005
3134	The World Without Us	Alan Weisman	\N	312347294	2007
3135	Four to Score 	Janet Evanovich	\N	312966970	1998
3136	Field of Dishonor	David Weber	\N	743435745	1994
3137	Emotional Intelligence	Daniel Goleman	\N	055380491X	1995
3138	The Confessor	Daniel Silva	\N	014101587X	2003
3139	Off to Be the Wizard	Scott  Meyer	\N	1612184715	2013
3140	The Raw Shark Texts	Steven Hall	\N	1841959111	2007
3141	The Throne of Fire	Rick Riordan	\N	1423140567	2011
3142	The Snowman	Raymond Briggs	\N	394839730	1978
3143	Interpreter of Maladies	Jhumpa Lahiri	\N	618101365	1999
3144	Deep Storm	Lincoln Child	\N	385515502	2007
3145	The Grey King	Susan Cooper	\N	1416949674	1975
3146	Darker After Midnight	Lara Adrian	\N	1849013764	2012
3147	The Last Child	John Hart	\N	312359322	2009
3148	Edenbrooke	Julianne Donaldson	\N	1609089464	2012
3149	Grave Dance	Kalayna Price	\N	451464095	2011
3150	Women of the Silk	Gail Tsukiyama	\N	312099436	1991
3151	The Scarlet Thread 	Francine Rivers	\N	842342710	1995
3152	A Bridge Too Far	Cornelius Ryan	\N	450837319	1974
3153	Gone Tomorrow	Lee Child	\N	593057058	2009
3154	Blackout	Mira Grant	\N	1841499005	2012
3155	Island	Aldous Huxley	\N	60085495	1962
3156	Rendezvous with Rama	Arthur C. Clarke	\N	1857231589	1973
3157	Wallbanger	Alice Clayton	\N	1623420024	2012
3158	The Jesus I Never Knew	Philip Yancey	\N	031021923X	1995
3159	Blood Memory	Greg Iles	\N	743454154	2005
3160	Lonesome Dove	Larry McMurtry	\N	067168390X	1985
3161	Duma Key	Stephen King	\N	1416552510	2008
3162	The Virgin Blue	Tracy Chevalier	\N	452284449	1997
3163	Danny and the Dinosaur	Syd Hoff	\N	64440028	1958
3164	Paint It Black	Janet Fitch	\N	316182745	2006
3165	Paula	Isabel Allende	\N	849759388X	1994
3166	Seabiscuit	Laura Hillenbrand	\N	345465083	1999
3167	The Twits	Roald Dahl	 Quentin Blake	141318309	1980
3168	Eating the Dinosaur	Chuck Klosterman	\N	1416544208	2009
3169	Moonraker	Ian Fleming	\N	142002062	1955
3170	Destined	P.C. Cast	 Kristin Cast	1905654871	2011
3171	Saturday	Ian McEwan	\N	1400076196	2005
3172	Making Money	Terry Pratchett	\N	61161640	2007
3173	Me Talk Pretty One Day	David Sedaris	\N	349113912	2000
3174	More Than Human	Theodore Sturgeon	\N	375703713	1953
3175	Stone of Farewell	Tad Williams	\N	756402972	1990
3176	The Rosie Project	Graeme Simsion	\N	1476729085	2013
3177	The Confusion	Neal Stephenson	\N	60733357	2004
3178	Interview with the Vampire	Anne Rice	\N	345476875	1976
3179	Invisible Man	Ralph Ellison	\N	679732764	1952
3180	A Wanted Man	Lee Child	 Dick Hill	307749606	2012
3181	H.M.S. Surprise 	Patrick O'Brian	\N	393307611	1973
3182	Cane River	Lalita Tademy	\N	446678457	2001
3183	A Wolf at the Table	Augusten Burroughs	\N	312342020	2008
3184	The Magic Faraway Tree	Enid Blyton	\N	074974801X	1943
3185	Desert Solitaire	Edward Abbey	\N	345326490	1968
3186	Faking It	Cora Carmack	\N	62273264	2013
3187	Two Boys Kissing	David Levithan	\N	307931900	2013
3188	Annabel	Lauren Oliver	\N	62237381	2012
3189	The Emperor's Children	Claire Messud	\N	030726419X	2006
3190	The Dream Hunter	Sherrilyn Kenyon	\N	312938810	2007
3191	Castle Roogna	Piers Anthony	\N	345418514	1979
3192	Blood of the Fold	Terry Goodkind	\N	812551478	1996
3193	Goddess Interrupted	Aimee Carter	\N	373210450	2012
3194	Playing with Fire	Derek Landy	\N	61240885	2008
3195	United We Spy	Ally Carter	\N	1423165993	2013
3196	Native Son 	Richard Wright	\N	006083756X	1940
3197	The Monk	Matthew      Lewis	\N	140436030	1796
3198	At Bertram's Hotel	Agatha Christie	\N	2310015	1965
3199	Gang Leader for a Day	Sudhir Venkatesh	\N	1594201501	2008
3200	The Chamber	John Grisham	\N	385339666	1994
3201	Impulse	Ellen Hopkins	\N	1416903569	2007
3202	A Stranger in the Mirror	Sidney Sheldon	\N	6471250	1976
3203	Mostly Harmless	Douglas Adams	\N	345418778	1992
3204	Gabriel's Rapture	Sylvain Reynard	\N	1936305550	2012
3205	Robots and Empire	Isaac Asimov	\N	586062009	1985
3206	Pygmalion	George Bernard Shaw	\N	486282228	1912
3207	Clara and Mr. Tiffany	Susan Vreeland	\N	1400068169	2010
3208	The Girls	Emma Cline	\N	081299860X	2016
3209	The Farthest Shore	Ursula K. Le Guin	\N	141650964X	1972
3210	The Other Hand	Chris Cleave	\N	1416589643	2008
3211	The Winner's Crime	Marie Rutkoski	\N	374384711	2015
3212	Good Night, Gorilla	Peggy Rathmann	\N	399230033	1994
3213	The Crossing Places	Elly Griffiths	\N	547229895	2009
3214	The Vampire Lestat	Anne Rice	\N	345476883	1985
3215	Leaves of Grass	Walt Whitman	\N	1416523715	1855
3216	Easy	Tammara Webber	\N	425266745	2012
3217	If Tomorrow Comes	Sidney Sheldon	\N	6479677	1985
3218	Live To Tell	Lisa Gardner	\N	553807242	2010
3219	Travel Team	Mike Lupica	\N	142404624	2004
3220	The Calling	Kelley Armstrong	\N	61797057	2012
3221	Pandora	Anne Rice	\N	8466302948	1998
3222	The Keep	Jennifer Egan	\N	1400043921	2006
3223	Chronicles: Volume One	Bob Dylan	\N	743244583	2004
3224	Roller Girl	Victoria Jamieson	\N	803740166	2015
3225	Chapterhouse: Dune	Frank Herbert	\N	441102670	1985
3226	Mortality	Christopher Hitchens	\N	1455502758	2012
3227	At First Sight	Nicholas Sparks	\N	446698466	2004
3228	Caliban's War	James S.A. Corey	\N	1841499900	2012
3229	Awake at Dawn	C.C. Hunter	\N	312624689	2011
3230	Dexter Is Delicious	Jeff Lindsay	\N	385532350	2010
3231	A Lot Like Love	Julie James	\N	425240169	2011
3232	Huis clos	Jean-Paul Sartre	\N	573613052	1944
3233	Between Shades of Gray	Ruta Sepetys	\N	399254129	2011
3234	Bergdorf Blondes	Plum Sykes	\N	1401359604	2004
3235	The Forever War	Joe Haldeman	\N	60510862	1974
3236	Son of the Shadows	Juliet Marillier	\N	765343266	2000
3237	Birthmarked	Caragh M. O'Brien	\N	1596435690	2010
3238	Native Tongue	Carl Hiaasen	\N	044669570X	1991
3239	Reamde	Neal Stephenson	\N	61977969	2011
3240	Black Hole	Charles Burns	\N	037542380X	1995
3241	The Woods	Harlan Coben	\N	525950125	2007
3242	About a Boy	Nick Hornby	\N	140285679	1998
3243	The Time of My Life	Cecelia Ahern	\N	7350430	2011
3244	Maniac Magee	Jerry Spinelli	\N	590452037	1990
3245	Tehanu	Ursula K. Le Guin	\N	1416509631	1990
3246	Number the Stars	Lois Lowry	\N	440227534	1989
3247	Curious George Takes a Job	H.A. Rey	\N	1844285081	1947
3248	Falling Angels	Tracy Chevalier	\N	452283205	2001
3249	Demon From the Dark 	Kresley Cole	\N	1439123128	2010
3250	The One Plus One	Jojo Moyes	\N	525426582	2014
3251	One Tuesday Morning	Karen Kingsbury	\N	310247527	2003
3252	Pretty Baby	Mary Kubica	\N	778317706	2015
3253	Wizard's First Rule	Terry Goodkind	\N	765346524	1994
3254	Wit : A Play	Margaret Edson	\N	571198775	1995
3255	The Sense of an Ending	Julian Barnes	\N	224094157	2011
3256	The Eyre Affair	Jasper Fforde	\N	142001805	2001
3257	Where's Spot? 	Eric Hill	\N	140504206	1980
3258	Hour Game	David Baldacci	\N	446616494	2004
3259	Light	Michael  Grant	\N	61449180	2013
3260	Not My Father's Son	Alan Cumming	\N	62225073	2014
3261	The Tenth Justice	Brad Meltzer	\N	446606243	1997
3262	The Hat	Jan Brett	\N	750026049	1997
3263	Gone Girl	Gillian Flynn	\N	297859382	2012
3264	Radiant Angel	Nelson DeMille	\N	446580856	2015
3265	Live Wire	Harlan Coben	\N	525952063	2011
3266	River Secrets	Shannon Hale	\N	1582349010	2006
3267	Forrest Gump	Winston Groom	\N	743453255	1986
3898	Blue Moon	Alyson Noel	\N	312532768	2009
3268	Gardens of the Moon	Steven Erikson	\N	765348780	1999
3269	The Story of Philosophy	Will Durant	\N	671739166	1926
3270	Why Evolution Is True	Jerry A. Coyne	\N	670020532	2008
3271	Passion's Reign	Karen Harper	\N	307237907	1983
3272	First Term at Malory Towers	Enid Blyton	\N	749744812	1946
3273	Hyperion	Dan Simmons	\N	553283685	1989
3274	Zoe's Tale	John Scalzi	\N	765316986	2008
3275	Out of the Dust	Karen Hesse	\N	439771277	1997
3276	The Mime Order	Samantha Shannon	\N	1408857391	2015
3277	Guardians of the West	David Eddings	\N	345352661	1985
3278	Sellevision	Augusten Burroughs	\N	312422288	2000
3279	Anya's Ghost	Vera Brosgol	\N	1596437138	2011
3280	Shaman's Crossing	Robin Hobb	\N	60758287	2005
3281	The Mothers	Brit Bennett	\N	399184511	2016
3282	Friends and Lovers	Eric Jerome Dickey	\N	451201027	1997
3283	Rose in Bloom	Louisa May Alcott	\N	316030899	1876
3284	The Sun Is Also a Star	Nicola Yoon	\N	553496689	2016
3285	Hocus Pocus	Kurt Vonnegut Jr.	\N	425161293	1990
3286	Demonglass	Rachel Hawkins	\N	1423121317	2011
3287	His Majesty's Dragon	Naomi Novik	\N	345481283	2006
3288	The Legacy	R.A. Salvatore	\N	786939842	1992
3289	Infected	Scott Sigler	\N	307406105	2008
3290	The Book of Tomorrow	Cecelia Ahern	\N	7233701	2009
3291	Hell House	Richard Matheson	\N	727860992	1971
3292	Lord of Misrule	Rachel Caine	\N	451225724	2008
3293	Outcast of Redwall	Brian Jacques	\N	142401420	1995
3294	The Dead Zone	Stephen King	\N	451155750	1979
3295	See Jane Score	Rachel Gibson	\N	60009241	2003
3296	Fly Away	Kristin Hannah	\N	312577214	2013
3297	Big Red	Jim Kjelgaard	 Carl Pfeuffer	553154346	1945
3298	Serena	Ron Rash	\N	61470856	2008
3299	Flush	Carl Hiaasen	\N	375821821	2005
3300	Fugitive Pieces	Anne Michaels	\N	679776591	1996
3301	Blackwood Farm	Anne Rice	\N	99446723	2002
3302	Something Borrowed	Emily Giffin	\N	031232118X	2004
3303	The Book of Luke	Jenny O'Connell	\N	1416520406	2007
3304	The Tin Roof Blowdown	James Lee Burke	\N	1416548483	2007
3305	Sleeping Murder	Agatha Christie	\N	2317850	1976
3306	Cruel Beauty	Rosamund Hodge	\N	62224735	2014
3307	A Beautiful Dark 	Jocelyn Davies	\N	61990655	2011
3308	The Shadowy Horses	Susanna Kearsley	\N	515124648	1997
3309	All the Weyrs of Pern	Anne McCaffrey	\N	345419359	1991
3310	Beach Music	Pat Conroy	\N	553381539	1975
3311	In The Afterlight	Alexandra Bracken	\N	1423157524	2014
3312	Sea Glass	Maria V. Snyder	\N	778325806	2009
3313	The Inheritance of Loss	Kiran Desai	\N	802142818	2006
3314	Your Heart Belongs to Me	Dean Koontz	\N	553807137	2008
3315	A Redbird Christmas	Fannie Flagg	\N	345480260	2004
3316	House of Leaves	Mark Z. Danielewski	\N	038560310X	2000
3317	Unfamiliar Fishes	Sarah Vowell	\N	1594487871	2011
3318	The Baker's Daughter	Sarah McCoy	\N	307460207	2012
3319	Push	Sapphire	\N	679766758	1996
3320	The Garden of Eden	Ernest Hemingway	\N	684804522	1985
3321	City of Lost Souls	Cassandra Clare	\N	1442416866	2012
3322	The End of Mr. Y.	Scarlett Thomas	\N	156031612	2006
3323	Reached	Ally Condie	\N	525423664	2012
3324	Monster	Walter Dean Myers	\N	64407314	1999
3325	Assassin's Quest	Robin Hobb	\N	553565699	1997
3326	Snakehead	Anthony Horowitz	\N	1406309354	2007
3327	Emily of New Moon	L.M. Montgomery	\N	055323370X	1923
3328	Wanted	Sara Shepard	\N	61566179	2010
3329	Still Alice	Lisa Genova	\N	595440096	2007
3330	Suicide Notes	Michael Thomas Ford	\N	60737557	2008
3331	Jumanji	Chris Van Allsburg	\N	395304482	1981
3332	Caddie Woodlawn	Carol Ryrie Brink	\N	1416940286	1935
3333	A Separate Peace	John Knowles	\N	743253973	1959
3334	Beyond Reach	Karin Slaughter	\N	038533947X	2007
3335	Fragments	Dan Wells	\N	62071076	2013
3336	Scorpia Rising	Anthony Horowitz	\N	399250573	2011
3337	The Hate U Give	Angie Thomas	\N	62498533	2017
3338	Rise of Empire	Michael J. Sullivan	\N	316187704	2010
3339	Born in Fire 	Nora Roberts	\N	515114693	1994
3340	I'll Walk Alone	Mary Higgins Clark	\N	1439180962	2011
3341	Two for the Dough	Janet Evanovich	\N	140255559	1996
3342	The Wordy Shipmates	Sarah Vowell	\N	1594489998	2008
3343	Holiday in Death	J.D. Robb	\N	425163717	1998
3344	Stray	Rachel Vincent	\N	778324214	2007
3345	Stormy Weather	Carl Hiaasen	\N	446677167	1995
3346	More Than This	Patrick Ness	\N	1406350486	2013
3347	Evernight	Claudia Gray	\N	61284394	2008
3348	Domes of Fire	David Eddings	\N	345383273	1992
3349	A Kiss in Time	Alex Flinn	\N	60874198	2008
3350	Shoeless Joe	W.P. Kinsella	\N	078572902X	1982
3351	Boy's Life	Robert McCammon	\N	671743058	1991
3352	Disclosure	Michael Crichton	\N	99303744	1994
3353	Twisted	Laurie Halse Anderson	\N	670061018	2007
3354	Count Zero	William Gibson	\N	441013678	1986
3355	The Puppet Masters	Robert A. Heinlein	\N	143913376X	1951
3356	The Wave	Morton Rhue	 Todd Strasser	440993717	1981
3357	The Stars Shine Down	Sidney Sheldon	\N	6178715	1992
3358	Silver Shadows	Richelle Mead	\N	1595143211	2014
3359	The End of Eternity	Isaac Asimov	\N	449016196	1955
3360	Doubt: A Parable	John Patrick Shanley	\N	1559362766	2005
3361	Ready or Not	Meg Cabot	\N	60724501	2005
3362	Let the Great World Spin	Colum McCann	\N	1400063736	2009
3363	Empire Falls	Richard Russo	\N	375726403	2001
3364	Linger	Maggie Stiefvater	\N	545123283	2010
3365	The Last Oracle	James Rollins	\N	61230944	2008
3366	The Twelve	Justin Cronin	\N	345504984	2012
3367	A Perfect Blood	Kim Harrison	\N	61957895	2012
3368	Summer House	Nancy Thayer	\N	345498208	2009
3369	The Bellmaker	Brian Jacques	\N	142400300	1994
3370	Luna	Julie Anne Peters	\N	316011274	2004
3371	Appointment with Death	Agatha Christie	\N	7119356	1938
3372	Perelandra	C.S. Lewis	\N	7157169	1943
3373	Fragile Eternity	Melissa Marr	\N	006121471X	2009
3374	A Vintage Affair	Isabel Wolff	\N	7245823	2009
3375	The Hunger Games	Suzanne Collins	\N	439023483	2008
3376	The Poet	Michael Connelly	\N	446690457	1996
3377	The First Confessor	Terry Goodkind	\N	615651011	2012
3378	The Hour I First Believed	Wally Lamb	\N	60393491	2007
3379	A Thousand Acres	Jane Smiley	\N	1400033837	1991
3380	Pleasure Unbound	Larissa Ione	\N	044640103X	2008
3381	Hard Luck	Jeff Kinney	\N	1419711326	2013
3382	Darkest Mercy	Melissa Marr	\N	61659258	2011
3383	Rubinrot	Kerstin Gier	 Anthea Bell	805092528	2009
3384	Kisscut	Karin Slaughter	\N	60534044	2002
3385	The Closers	Michael Connelly	\N	446699551	2005
3386	High Five	Janet Evanovich	\N	330371231	1999
3387	The God of Small Things	Arundhati Roy	\N	679457313	1997
3388	City of Fallen Angels	Cassandra Clare	\N	1442403543	2011
3389	Identical	Ellen Hopkins	\N	1416950052	2008
3390	City of Masks	Mary Hoffman	\N	1582349177	2002
3391	Journals	Kurt Cobain	\N	157322359X	2002
3392	Until Friday Night	Abbi Glines	\N	1481438867	2015
3393	The Drawing of the Three	Stephen King	\N	451210859	1987
3394	Wreck This Journal	Keri Smith	\N	039953346X	2007
3395	The Satanic Verses	Salman Rushdie	\N	312270828	1988
3396	The Madonnas of Leningrad	Debra Dean	\N	60825316	2006
3397	The Prince of Tides	Pat Conroy	\N	553381547	1986
3398	Orphan X	Gregg Hurwitz	\N	1250067847	2016
3399	Life Expectancy	Dean Koontz	\N	553588249	2004
3400	From Dead to Worse	Charlaine Harris	\N	441015891	2008
3401	Fool's Assassin	Robin Hobb	\N	553392425	2014
3402	Talon	Julie Kagawa	\N	373211392	2014
3403	London: The Novel	Edward Rutherfurd	\N	345455681	1997
3404	Explosive Eighteen	Janet Evanovich	\N	345527712	2011
3405	Fine Things	Danielle Steel	\N	440244056	1987
3406	Obsession in Death	J.D. Robb	\N	399170871	2015
3407	The Lottery	Shirley Jackson	\N	1563127873	1948
3408	The Great Divorce	C.S. Lewis	\N	6280560	1945
3409	The Pagan Lord	Bernard Cornwell	\N	7331908	2013
3410	Dear Daughter	Elizabeth Little	\N	670016381	2014
3411	Glimmerglass	Jenna Black	\N	312575939	2010
3412	Rescue	Anita Shreve	\N	316020729	2010
3413	The Replacement	Brenna Yovanoff	\N	1595143378	2010
3414	Winter	Marissa Meyer	\N	312642989	2015
3415	Goddess	Josephine Angelini	\N	62012037	2013
3416	The Hungry Tide	Amitav Ghosh	\N	061871166X	2004
3417	To Challenge a Dragon	G.A. Aiken	\N	1420103733	2004
3418	Effortless	S.C. Stephens	\N	1476717486	2011
3419	Northern Lights	Nora Roberts	\N	515139742	2004
3420	The Watchman	Robert Crais	\N	743281632	2007
3421	The Paris Wife	Paula McLain	\N	345521307	2011
3422	Half a King	Joe Abercrombie	\N	804178321	2014
3423	The King of Torts	John Grisham	\N	385339658	2003
3424	The Terror	Dan Simmons	\N	316017442	2007
3425	Mad Dogs	Robert Muchamore	\N	340911719	2007
3426	Haunted	Kelley Armstrong	\N	553587080	2005
3427	Unaccustomed Earth	Jhumpa Lahiri	\N	676979343	2008
3428	Freedom	Jonathan Franzen	\N	374158460	2010
3429	Sorceress of Darshiva	David Eddings	\N	345369351	1989
3430	Boundless	Cynthia Hand	\N	61996203	2013
3431	So B. It	Sarah Weeks	\N	64410471	2004
3432	Lords and Ladies	Terry Pratchett	\N	055215315X	1992
3433	Sometimes a Great Notion	Ken Kesey	\N	140045295	1964
3434	Whiskey Beach	Nora Roberts	\N	399159894	2013
3435	Under The Net	Iris Murdoch	\N	140014454	1954
3436	Big Nate on a Roll	Lincoln Peirce	\N	61944394	2009
3437	The Missing Piece	Shel Silverstein	\N	60256710	1976
3438	The Lovely Bones	Alice Sebold	\N	316166685	2002
3439	Girlfriend in a Coma	Douglas Coupland	\N	60987324	1998
3440	Hornet Flight	Ken Follett	\N	451210743	2002
3441	The Rose Garden	Susanna Kearsley	\N	749009519	2011
3442	The Black house	Peter  May	\N	1849163847	2009
3443	Dead as a Doornail 	Charlaine Harris	\N	441013333	2005
3444	The Illustrated Man	Ray Bradbury	\N	000712774X	1951
3445	The Defector	Daniel Silva	\N	399155686	2009
3446	Eating Animals	Jonathan Safran Foer	\N	316069906	2009
3447	The Paying Guests	Sarah Waters	\N	1594633118	2014
3448	Blood Rites	Jim Butcher	\N	451459873	2004
3449	Fear	Michael  Grant	\N	61449156	2012
3450	I Hunt Killers	Barry Lyga	\N	316125849	2012
3451	Sunset	Erin Hunter	\N	60827696	2006
3452	A Drink Before the War	Dennis Lehane	\N	156029022	1994
3453	Green Rider	Kristen Britain	\N	886778581	1998
3454	The Atonement Child	Francine Rivers	\N	084230052X	1997
3455	Anne of Avonlea	L.M. Montgomery	\N	553213148	1909
3456	Runaway	Alice Munro	\N	1400077915	2004
3457	Annie on My Mind	Nancy Garden	\N	374404143	1982
3458	Love in the Afternoon	Lisa Kleypas	\N	312605390	2010
3459	Women	Charles Bukowski	\N	61177598	1978
3460	Doctor Sleep	Stephen King	\N	1476727651	2013
3461	Magic Hour	Kristin Hannah	\N	345467531	2006
3462	Feet of Clay	Terry Pratchett	\N	552153257	1996
3463	Incarnate	Jodi Meadows	\N	62060759	2012
3464	The Sands of Time	Sidney Sheldon	\N	6174434	1988
3465	Gods in Alabama	Joshilyn Jackson	\N	446694533	2005
3466	Gentle Rogue	Johanna Lindsey	\N	380753022	1990
3467	One True Thing	Anna Quindlen	\N	812976185	1994
3468	Chasing Perfect	Susan Mallery	\N	373774524	2010
3469	Dark Reunion	L.J. Smith	\N	1847386823	1991
3470	White	Ted Dekker	\N	1595540350	2004
3471	Less Than Zero	Bret Easton Ellis	\N	679781498	1985
3472	Trickster's Queen	Tamora Pierce	\N	375828788	2004
3473	Hotel du Lac	Anita Brookner	\N	679759328	1984
3474	Forbidden	Tabitha Suzuma	\N	1862308160	2010
3475	Eileen	Ottessa Moshfegh	\N	1594206627	2015
3476	Skippyjon Jones	Judy Schachner	\N	525471340	2003
3477	Spindle's End	Robin McKinley	\N	441008658	2000
3478	Dust	Hugh Howey	\N	1490904387	2013
3479	The Killing Hour	Lisa Gardner	\N	553584529	2003
3480	The Tempest	William Shakespeare	\N	743482832	1623
3481	Pigs in Heaven	Barbara Kingsolver	\N	571171788	1993
3482	What the Night Knows	Dean Koontz	\N	553807722	2010
3483	The Boys from Brazil	Ira Levin	\N	394402677	1976
3484	The Lying Game	Sara Shepard	\N	61869708	2010
3485	Ramona Forever	Beverly Cleary	\N	038072801X	1984
3486	The Siren	Kiera Cass	\N	1440154236	2009
3487	Spider Bones	Kathy Reichs	\N	1439102392	2010
3488	Beautiful Secret	Christina Lauren	\N	1476778019	2015
3489	The Forbidden Game	L.J. Smith	\N	1416989404	1997
3490	Heretics of Dune	Frank Herbert	\N	441328008	1984
3491	Rosemary's Baby	Ira Levin	\N	451194004	1967
3492	Legion	Brandon Sanderson	\N	1596064854	2012
3493	Uncommon Criminals	Ally Carter	\N	1423147952	2011
3494	The Last Colony	John Scalzi	\N	765316978	2007
3495	The Truth About Forever	Sarah Dessen	\N	142406252	2004
3496	The Gathering	Anne Enright	\N	802170390	2007
3497	An Abundance of Katherines	John Green	\N	525476881	2006
3498	Wildwood Dancing	Juliet Marillier	\N	375833641	2007
3499	The Moviegoer	Walker Percy	\N	375701966	1961
3500	The Things They Carried	Tim O'Brien	\N	767902890	1990
3501	Ungifted	Gordon Korman	\N	006174266X	2012
3502	Replay	Ken Grimwood	\N	068816112X	1986
3503	Seeing Redd	Frank Beddor	\N	803731558	2007
3504	A Mercy	Toni Morrison	\N	307264238	2008
3505	Breathe	Sarah Crossan	\N	62118692	2012
3506	Habibi	Craig Thompson	\N	375424148	2011
3507	Animalia	Graeme Base	\N	810918684	1986
3508	Three Day Road	Joseph Boyden	\N	143017861	2005
3509	Nights in Rodanthe	Nicholas Sparks	\N	446612707	2002
3510	Hiroshima	John Hersey	\N	679721037	1946
3511	Perfect Scoundrels	Ally Carter	\N	1423166000	2013
3512	Anna Dressed in Blood	Kendare Blake	\N	765328658	2011
3513	Half-Blood	Jennifer L. Armentrout	\N	983157200	2011
3514	Blood Magick	Nora Roberts	\N	425259870	2014
3515	Girl Waits with Gun	Amy  Stewart	\N	544409914	2015
3516	Games People Play	Eric Berne	\N	345032799	1964
3517	These things hidden	Heather Gudenkauf	\N	778328791	2011
3518	Before we met	Lucie Whitehouse	\N	1620402750	2014
3519	Pathfinder	Orson Scott Card	\N	141699176X	2010
3520	Dances with Wolves	Michael Blake	\N	449000753	1988
3521	A Modest Proposal	Jonathan Swift	\N	1605977276	1729
3522	Deadlocked	Charlaine Harris	\N	575096578	2012
3523	I Will Teach You To Be Rich	Ramit Sethi	\N	761147489	2009
3524	One Hundred Names	Cecelia Ahern	\N	7350481	2012
3525	The Diamond Age	Neal Stephenson	\N	553380966	1995
3526	Cabin Fever	Jeff Kinney	\N	1419702238	2010
3527	Pushing the Limits	Katie McGarry	\N	373210493	2012
3528	A Countess Below Stairs	Eva Ibbotson	\N	142408654	1981
3529	All Around the Town	Mary Higgins Clark	\N	1416516727	1992
3530	Those Who Save Us	Jenna Blum	\N	156031663	2004
3531	Perfect Match	Jodi Picoult	\N	743418735	2002
3532	The Bourbon Kings	J.R. Ward	\N	698193032	2015
3533	Freckle Juice	Judy Blume	\N	9991373764	1978
3534	La tregua	Mario Benedetti	\N	9707311169	1960
3535	The Night Angel Trilogy	Brent Weeks	\N	160751351X	2009
3536	The Last Kingdom	Bernard Cornwell	\N	60887184	2004
3537	The Andromeda Strain	Michael Crichton	\N	60541814	1969
3538	Wait for Me	Elisabeth Naughton	\N	1468139339	2011
3539	Promise of Blood	Brian  McClellan	\N	316219037	2013
3540	To Kill a Mockingbird	Harper Lee	\N	61120081	1960
3541	Be Here Now	Ram Dass	 Richard Alpert	517543052	1971
3542	The Lion	Nelson DeMille	\N	044658083X	2010
3543	Ironweed	William  Kennedy	\N	743263065	1983
3544	The Lollipop Shoes	Joanne Harris	\N	61431621	2007
3545	What The Dead Know	Laura Lippman	\N	61128856	2007
3546	The Rise of Nine	Pittacus Lore	\N	61974587	2012
3547	Prince Lestat	Anne Rice	\N	307962520	2014
3548	The Farm	Tom Rob Smith	\N	1471110672	2014
3549	City of Ashes	Cassandra Clare	\N	1416914293	2008
3550	The Shock of the New	Robert Hughes	\N	500275823	1980
3551	The River	Gary Paulsen	\N	044022750X	1991
3552	Royal Assassin	Robin Hobb	\N	6480101	1996
3553	Sea Glass	Anita Shreve	\N	316013838	2002
3554	Eyes of the Dragon	Stephen King	\N	751504572	1987
3555	The Marriage Plot	Jeffrey Eugenides	\N	374203059	2011
3556	Steelheart	Brandon Sanderson	\N	385743564	2013
3557	The Reversal	Michael Connelly	\N	316069485	2010
3558	Just Ella	Margaret Peterson Haddix	\N	1416936491	1999
3559	Defiance	C.J. Redwine	\N	62117181	2012
3560	The Witch with No Name	Kim Harrison	\N	006195795X	2014
3561	Meant to Be	Lauren Morrill	\N	385741774	2012
3562	Carry On	Rainbow Rowell	\N	1250049555	2015
3563	A Land More Kind Than Home	Wiley Cash	\N	62088149	2012
3564	Aurora	Kim Stanley Robinson	\N	316098108	2015
3565	Magic Strikes	Ilona Andrews	\N	441017029	2009
3566	Amphigorey	Edward Gorey	\N	399504338	1972
3567	Ariel	Sylvia Plath	\N	60931728	1965
3568	Blue Nights	Joan Didion	\N	307267679	2011
3569	Days of Blood & Starlight	Laini Taylor	\N	316133973	2012
3570	A Bend in the Road	Nicholas Sparks	\N	446696137	2001
3571	The Murder on the Links	Agatha Christie	\N	425067947	1923
3572	The Red Knight	Miles  Cameron	\N	575113294	2012
3573	Grass for His Pillow 	Lian Hearn	\N	1594480036	2003
3574	Girls in Love	Jacqueline Wilson	\N	552551317	1997
3575	The Holiness of God	R.C. Sproul	\N	842339655	1984
3576	Vampires are Forever	Lynsay Sands	\N	61229695	2008
3577	Girl, Stolen	April Henry	\N	805090053	2010
3578	Then We Came to the End	Joshua Ferris	\N	316016381	2007
3579	Cut	Patricia McCormick	\N	439324599	2000
3580	Brain on Fire	Susannah Cahalan	\N	145162137X	2012
3581	Onyx	Jennifer L. Armentrout	\N	1620610116	2012
3582	The House of Hades	Rick Riordan	\N	1423146727	2013
3583	The Daylight War	Peter V. Brett	\N	345503821	2013
3584	The Dogs of War	Frederick Forsyth	\N	553268465	1974
3585	Monsters of Men	Patrick Ness	\N	1406310271	2010
3586	Downtown Owl	Chuck Klosterman	\N	1416544186	2008
3587	The Husband's Secret 	Liane Moriarty	\N	399159347	2013
3588	Cell	Stephen King	\N	1416524517	2006
3589	Sullivan's Island	Dorothea Benton Frank	\N	425193942	1999
3590	A Tale Dark and Grimm	Adam Gidwitz	\N	525423346	2010
3591	The Sword of Shannara	Terry Brooks	\N	1857231511	1977
3592	Seta	Alessandro Baricco	\N	375703829	1996
3593	Foundation and Earth	Isaac Asimov	\N	553587579	1986
3594	The Goose Girl	Shannon Hale	\N	1582349908	2003
3595	The Penelopiad	Margaret Atwood	\N	1841957178	2005
3596	This Body of Death	Elizabeth  George	\N	61160881	2010
3597	Stone Butch Blues	Leslie Feinberg	\N	1555838537	1993
3598	All But My Life	Gerda Weissmann Klein	\N	809015803	1959
3599	Tenth of December	George Saunders	\N	812993802	2013
3600	Broken Harbor	Tana French	\N	1444705105	2012
3601	Giovanni's Room	James     Baldwin	\N	141186356	1956
3602	Heartless	Sara Shepard	\N	61566152	2010
3603	My Last Duchess	Daisy Goodwin	\N	312658656	2010
3604	Kitten's First Full Moon	Kevin Henkes	\N	60588284	2004
3605	A Deepness in the Sky	Vernor Vinge	\N	812536355	1998
3606	Personal History	Katharine Graham	\N	375701044	1997
3607	U Is for Undertow	Sue Grafton	\N	039915597X	2009
3608	Interesting Times	Terry Pratchett	\N	61056901	1994
3609	The Supernaturalist	Eoin Colfer	\N	078685149X	2004
3610	Our Mutual Friend	Charles Dickens	\N	375761144	1865
3611	Tropic of Cancer	Henry Miller	\N	802131786	1934
3612	The Perfume Collector	Kathleen Tessaro	\N	62257838	2013
3613	Excalibur	Bernard Cornwell	\N	312206488	1997
3614	The Remains of the Day	Kazuo Ishiguro	\N	571225381	1989
3615	A Dangerous Path	Erin Hunter	\N	60525657	2004
3616	Alienated	Melissa Landers	\N	1423170288	2014
3617	Rogue Squadron	Michael A. Stackpole	\N	553568019	1996
3618	The Sportswriter	Richard Ford	\N	394743253	1986
3619	Afterlife	Claudia Gray	\N	61284424	2011
3620	Palace of Stone	Shannon Hale	\N	1599908735	2012
3621	The Lewis Man	Peter  May	\N	857382209	2011
3622	Tiger's Destiny	Colleen Houck	\N	1402798431	2012
3623	Shut Out	Kody Keplinger	\N	316175560	2011
3624	Scruples	Judith Krantz	\N	297775340	1978
3625	Brisingr	Christopher Paolini	\N	375826726	2008
3626	Beatrice and Virgil	Yann Martel	\N	1400069262	2010
3627	The Christmas Sweater	Glenn Beck	\N	141659485X	2008
3628	milk and honey	Rupi Kaur	\N	1502784270	2014
3629	Night Broken	Patricia Briggs	\N	042525674X	2014
3630	The Pigman	Paul Zindel	\N	60757353	1968
3631	Toujours Provence	Peter Mayle	\N	679736042	1991
3632	The Buddha of Suburbia	Hanif Kureishi	\N	014013168X	1990
3633	Wise Blood	Flannery O'Connor	\N	374530637	1952
3634	The Naked Sun	Isaac Asimov	\N	586010165	1957
3635	What Do You Do?	Gillian Flynn	\N	804188971	2014
3636	The Night Circus	Erin Morgenstern	\N	385534639	2011
3637	Breakable	Tammara Webber	\N	425266869	2014
3638	Bridge to Terabithia	Katherine Paterson	\N	439366771	1977
3639	Queen of the Darkness	Anne Bishop	\N	451456734	2000
3640	After We Collided	Anna Todd	\N	1476792496	2013
3641	The Happiness Project	Gretchen Rubin	\N	61583251	2009
3642	Pilgrim at Tinker Creek	Annie Dillard	\N	72434171	1974
3643	Swing Time	Zadie Smith	\N	241144159	2016
3644	Brave New World	Aldous Huxley	\N	60929871	1932
3645	Capital	John Lanchester	\N	571234607	2012
3646	Schindler's Ark	Thomas Keneally	\N	340606517	1982
3647	Renegade's Magic	Robin Hobb	\N	006147312X	2007
3648	Flight Behavior	Barbara Kingsolver	\N	62124269	2012
3649	Jamaica Inn	Daphne du Maurier	\N	316252905	1935
3650	Of Mice and Men 	John Steinbeck	\N	142000671	1937
3651	Jingo	Terry Pratchett	\N	552154164	1997
3652	Reasons To Stay Alive 	Matt Haig	\N	1782115080	2015
3653	The Runaway King	Jennifer A. Nielsen	\N	545284155	2013
3654	Fallout (Crank, #3)	Ellen Hopkins	\N	1416950095	2010
3655	The Great Dune Trilogy	Frank Herbert	\N	575070706	1977
3656	A Spool of Blue Thread	Anne Tyler	\N	385683421	2015
3657	Mr. Brown Can Moo! Can You?	Dr. Seuss	\N	7169914	1970
3658	The Red Pyramid	Rick Riordan	\N	1423113381	2010
3659	The Haunted	Jessica Verday	\N	141697895X	2010
3660	Double Time	Olivia Cunning	\N	1402271514	2012
3661	The Golden Notebook	Doris Lessing	\N	006093140X	1962
3662	Ser Como o Rio que Flui	Paulo Coelho	\N	7235801	2000
3663	Things Not Seen	Andrew Clements	\N	142400769	2002
3664	Nights of Rain and Stars	Maeve Binchy	\N	752865366	2004
3665	The Robots of Dawn	Isaac Asimov	\N	553299492	1983
3666	Just One Night	Gayle Forman	\N	698184890	2014
3667	North of Beautiful	Justina Chen	\N	316025054	2009
3668	Beautiful Day	Elin Hilderbrand	\N	316099783	2013
3669	On Beauty	Zadie Smith	\N	143037749	2005
3670	F is for Fugitive	Sue Grafton	\N	312939043	1988
3671	Graceling	Kristin Cashore	\N	015206396X	2008
3672	Thirst No. 1	Christopher Pike	\N	1416983082	1998
3673	Child 44	Tom Rob Smith	\N	446402397	2008
3674	One Foot in the Grave	Jeaniene Frost	\N	61245097	2008
3675	Forever Princess	Meg Cabot	\N	61232920	2008
3676	Dust & Decay	Jonathan Maberry	\N	1442402350	2011
3677	The Fourth Bear	Jasper Fforde	\N	670037729	2006
3678	All Fall Down	Ally Carter	\N	545654742	2015
3679	Radiant Shadows	Melissa Marr	\N	61659223	2010
3680	Prophet	Frank E. Peretti	\N	1581345267	1992
3681	Bloodsucking Fiends	Christopher Moore	\N	60735414	1995
3682	Black Hawk Down	Mark Bowden	\N	871137380	1999
3683	Queen of Babble	Meg Cabot	\N	60851988	2006
3684	Personal Demon	Kelley Armstrong	\N	553806610	2008
3685	Prozac Nation	Elizabeth Wurtzel	\N	1573225126	1994
3686	I Am Half-Sick of Shadows 	Alan Bradley	\N	385344015	2011
3687	Magic's Pawn	Mercedes Lackey	\N	886773520	1989
3688	A Bite to Remember	Lynsay Sands	\N	006077407X	2006
3689	Messenger 	Lois Lowry	\N	385732538	2004
3690	Under the Never Sky	Veronica Rossi	\N	1907411054	2011
3691	Deeper than the Dead	Tami Hoag	\N	752891634	2008
3692	Beauty Queens	Libba Bray	\N	439895979	2011
3693	The Devil Wears Prada	Lauren Weisberger	\N	307275558	2003
3694	The Silent Wife	A.S.A. Harrison	\N	143123238	2013
3695	Heist Society	Ally Carter	\N	1423116399	2010
3696	True Evil	Greg Iles	\N	743292499	2006
3697	The Lost Prince	Julie Kagawa	\N	373210574	2012
3698	Odd Thomas	Dean Koontz	\N	553384287	2003
3699	The Killer Inside Me	Jim Thompson	\N	679733973	1952
3700	Wintergirls	Laurie Halse Anderson	\N	067001110X	2009
3701	Falling Under	Gwen Hayes	\N	451232682	2011
3702	Jesus' Son: Stories	Denis Johnson	\N	60975776	1992
3703	Executive Orders	Tom Clancy	\N	6479758	1996
3704	The Book Thief	Markus Zusak	\N	375831002	2005
3705	Grip of the Shadow Plague	Brandon Mull	\N	1590388984	2008
3706	The Outsiders	S.E. Hinton	\N	014038572X	1967
3707	Passage to Dawn	R.A. Salvatore	\N	786907509	1993
3708	The Fury	L.J. Smith	\N	61059919	1991
3709	The Whole Truth	David Baldacci	\N	446195979	2008
3710	Endymion	Dan Simmons	\N	553572946	1996
3711	Dodger	Terry Pratchett	\N	62009494	2012
3712	Wonderstruck	Brian Selznick	\N	545027896	2011
3713	The City of Mirrors	Justin Cronin	\N	034550500X	2016
3714	Happily Ever After	Kiera Cass	\N	8143676	2015
3715	The Archived	Victoria Schwab	\N	1423157311	2013
3716	The Perfect Husband	Lisa Gardner	\N	553587692	1997
3717	After the Funeral 	Agatha Christie	\N	425173909	1953
3718	Llama Llama Mad at Mama	Anna Dewdney	\N	670062405	2007
3719	Greg Heffley's Journal	Jeff Kinney	\N	810993139	2004
3720	Strange Candy	Laurell K. Hamilton	\N	425212017	2006
3721	Going Bovine	Libba Bray	\N	385733976	2009
3722	Cross Justice	James Patterson	\N	316407135	2015
3723	Assassination Vacation	Sarah Vowell	\N	074326004X	2005
3724	The Seeress of Kell	David Eddings	\N	552148067	1991
3725	The Lowland	Jhumpa Lahiri	\N	307265749	2013
3726	A Widow for One Year	John Irving	\N	345469011	1998
3727	The Kite Runner 	Khaled Hosseini	\N	1594480001	2003
3728	Snuff	Chuck Palahniuk	\N	385517882	2008
3729	Rodrick Rules	Jeff Kinney	\N	810994739	2008
3730	Predator	Patricia Cornwell	\N	425210278	2005
3731	Death Without Company	Craig Johnson	\N	143038389	2006
3732	Tempted	P.C. Cast	 Kristin Cast	1905654588	2008
3733	The Longest Ride	Nicholas Sparks	\N	1455520659	2012
3734	Skin Tight	Carl Hiaasen	\N	446695696	1989
3735	Intet	Janne Teller	 Martin Aitken	1416985794	2000
3736	Breaking Free	Beth Moore	\N	805445528	1999
3737	Raven's Gate	Anthony Horowitz	\N	439680093	2005
3738	Lexicon	Max Barry	\N	1594205388	2013
3739	Crossing to Safety	Wallace Stegner	\N	037575931X	1987
3740	Every Which Way But Dead	Kim Harrison	\N	006057299X	2005
3741	The Amityville Horror	Jay Anson	\N	553116606	1977
3742	Blood Canticle	Anne Rice	\N	99460173	2003
3743	Marked in Flesh	Anne Bishop	\N	451474473	2016
3744	Beneath a Marble Sky	John Shors	\N	451218469	2004
3745	The Far Side Gallery 3	Gary Larson	\N	836218310	1984
3746	Equal Rites	Terry Pratchett	\N	60855908	1987
3747	Thinner	Richard Bachman	 Stephen King	451190750	1984
3748	Prince of Fools	Mark  Lawrence	\N	425268780	2014
3749	The Empty Chair 	Jeffery Deaver	\N	684855631	2000
3750	Blink	Ted Dekker	\N	849945119	2002
3751	Track of the Cat	Nevada Barr	\N	380721643	1993
3752	The Name of the Wind	Patrick Rothfuss	\N	075640407X	2007
3753	Afterworlds	Scott Westerfeld	\N	1481422340	2014
3754	Mistral's Kiss	Laurell K. Hamilton	\N	345443586	2006
3755	The Weight of Water	Anita Shreve	\N	316780375	1997
3756	Witches Abroad	Terry Pratchett	\N	61020613	1991
3757	Mr. Mercedes	Stephen King	\N	1476754454	2014
3758	The Corrections	Jonathan Franzen	\N	1841156736	2001
3759	The Litigators	John Grisham	\N	1444729705	2011
3760	Anne of Ingleside	L.M. Montgomery	\N	553213156	1939
3761	Odd Hours	Dean Koontz	\N	553807056	2008
3762	The Pilot's Wife	Anita Shreve	\N	316601950	1998
3763	Seeds of Yesterday	V.C. Andrews	\N	671729489	1984
3764	The Julian chapter	R.J. Palacio	\N	553499084	2014
3765	The Rise of Endymion	Dan Simmons	\N	553572989	1997
3766	The Yellow Birds	Kevin Powers	\N	316219363	2012
3767	Steal Like an Artist	Austin Kleon	\N	761169253	2010
3768	The Christmas Train	David Baldacci	\N	446615757	2001
3769	Skeleton Key	Anthony Horowitz	\N	142406147	2002
3770	The Last Mile	David Baldacci	\N	1455566020	2016
3771	Drama	Raina Telgemeier	 Gurihiru	545326990	2012
3772	Entwined with You	Sylvia Day	\N	425263924	2013
3773	Great North Road	Peter F. Hamilton	\N	034552666X	2012
3774	Bad Blood	John Sandford	\N	399156909	2010
3775	Suttree	Cormac McCarthy	\N	679736328	1979
3776	The Last Juror	John Grisham	\N	385339682	2004
3777	Flight Of The Old Dog	Dale Brown	\N	042519518X	1987
3778	Gone	Michael  Grant	\N	61448761	2008
3779	The Declaration	Gemma Malley	\N	1599901196	2007
3780	The Red House	Mark Haddon	\N	385535775	2012
3781	Inferno	Dan Brown	\N	385537859	2013
3782	Friday	Robert A. Heinlein	\N	345414004	1982
3783	Drop Shot	Harlan Coben	\N	440220459	1996
3784	Foreign Influence	Brad Thor	\N	1416586598	2010
3785	The Fireman	Joe Hill	\N	62200631	2016
3786	The Prestige	Christopher Priest	\N	312858868	1995
3787	The Spellman Files	Lisa Lutz	\N	743571355	2007
3788	Voyager	Diana Gabaldon	\N	385335997	1993
3789	The Queen's Fool	Philippa Gregory	\N	743246071	2003
3790	The Associate	John Grisham	\N	385517831	2009
3791	Salt to the Sea	Ruta Sepetys	\N	399160302	2016
3792	Indulgence in Death	J.D. Robb	\N	399156879	2010
3793	The Reality Bug	D.J. MacHale	\N	743437349	2003
3794	Kiss of the Night	Sherrilyn Kenyon	\N	074990741X	2004
3795	Back When We Were Grownups	Anne Tyler	\N	345477243	2001
3796	The Persuader	Lee Child	\N	440241006	2003
3797	The Bone Tree	Greg Iles	\N	62311115	2015
3798	Wintersmith	Terry Pratchett	\N	60890312	2006
3799	The Lost City of Faar	D.J. MacHale	\N	743437322	2003
3800	Revolution	Jennifer Donnelly	\N	385737637	2010
3801	Dark Needs at Night's Edge	Kresley Cole	\N	141654707X	2008
3802	The Sands of Time	Sidney Sheldon	\N	7165161	1985
3803	Sick Puppy	Carl Hiaasen	\N	446695688	2000
3804	Anatomy for the Artist	Sarah Simblet	\N	078948045X	2001
3805	In the Unlikely Event	Judy Blume	\N	1101875046	2015
3806	The Last Guardian	Eoin Colfer	\N	1423161610	2012
3807	Maktub	Paulo Coelho	\N	8408057235	1994
3808	Bite Me	Christopher Moore	\N	61779725	2010
3809	Modern Lovers	Emma Straub	\N	159463467X	2016
3810	Safe Haven	Nicholas Sparks	\N	044654759X	2010
3811	Gods and Generals	Jeff Shaara	\N	1841580651	1996
3812	King Rat	James Clavell	\N	385333765	1962
3813	Salem Falls	Jodi Picoult	\N	743418719	2001
3814	Eaters of the Dead	Michael Crichton	\N	60891564	1976
3815	The Invisible Man	H.G. Wells	\N	451528522	1897
3816	The Raven Boys	Maggie Stiefvater	\N	545424925	2012
3817	The Cartel	Don Winslow	\N	1101874996	2015
3818	A Northern Light	Jennifer Donnelly	\N	152053107	2003
3819	Common Sense	Thomas Paine	\N	143036254	1776
3820	Shadows	Jennifer L. Armentrout	\N	1620610086	2012
3821	Hissy Fit	Mary Kay Andrews	\N	60564652	2004
3822	Pay It Forward	Catherine Ryan Hyde	\N	743412028	1999
3823	The Bone Garden	Tess Gerritsen	\N	593057775	2007
3824	Lost Lake	Sarah Addison Allen	\N	125001980X	2014
3825	Tithe: A Modern Faerie Tale	Holly Black	\N	689867042	2002
3826	Heaven	V.C. Andrews	\N	671729446	1985
3827	The Beach House	Jane Green	\N	670018856	2008
3828	Midnight	Dean Koontz	\N	425194515	1989
3829	American Tabloid	James Ellroy	\N	037572737X	1995
3830	The Sheltering Sky	Paul Bowles	\N	141023422	1949
3831	Mr. Darcy's Diary	Amanda Grange	\N	1402208766	2005
3832	The Messenger	Markus Zusak	\N	375836675	2002
3833	The Right Stuff	Tom Wolfe	\N	553381350	1979
3834	Blindsight	Peter Watts	\N	765312182	2006
3835	Strength in What Remains	Tracy Kidder	\N	1400066212	2000
3836	Financial Peace Revisited	Dave Ramsey	\N	670032085	1992
3837	Save Me	Lisa Scottoline	\N	031238078X	2011
3838	Second Glance	Jodi Picoult	\N	743454510	2003
3839	The Witches	Roald Dahl	 Quentin Blake	590032496	1983
3840	A Thousand Pieces of You	Claudia Gray	\N	62278967	2014
3841	Absolute Fear	Lisa Jackson	\N	758211821	2007
3842	Ender's Shadow	Orson Scott Card	\N	765342405	1998
3843	The View from Saturday	E.L. Konigsburg	\N	689862210	1996
3844	Blubber	Judy Blume	\N	330398059	1974
3845	Sword Song	Bernard Cornwell	\N	60888644	2007
3846	Heartless	Gail Carriger	\N	316127191	2011
3847	The Middlesteins	Jami Attenberg	\N	1455507199	2012
3848	Once and Always	Judith McNaught	\N	1416530738	1987
3849	Second Life	S.J. Watson	\N	857520199	2015
3850	Ruby Holler	Sharon Creech	\N	60560150	2002
3851	The Liar	Nora Roberts	\N	399170863	2014
3852	Dairy Queen	Catherine Gilbert Murdock	\N	618683070	2006
3853	Unbelievable	Sara Shepard	\N	60887397	2008
3854	The MasterHarper of Pern	Anne McCaffrey	\N	552142743	1998
3855	Regeneration	Pat Barker	\N	140236236	1991
3856	Bad Luck and Trouble	Lee Child	\N	385340559	2007
3857	Princess in Pink	Meg Cabot	\N	60096128	2003
3858	The Alloy of Law	Brandon Sanderson	\N	765330423	2011
3859	Letter to a Christian Nation	Sam Harris	\N	307265773	2006
3860	A Walk Across the Sun	Corban Addison	\N	1402792808	2011
3861	No Country for Old Men	Cormac McCarthy	\N	375706674	2005
3862	Sang Pemimpi	Andrea Hirata	\N	9793062924	2006
3863	The System of the World	Neal Stephenson	\N	60750863	2004
3864	Flight: A Novel	Sherman Alexie	\N	802170374	2007
3865	Born in Shame	Nora Roberts	\N	051511779X	1996
3866	Absolution Gap	Alastair Reynolds	\N	441012914	2003
3867	The Judas Strain	James Rollins	\N	60763892	2007
3868	Cards on the Table	Agatha Christie	\N	425205959	1936
3869	Jackdaws	Ken Follett	\N	451219597	2001
3870	Without Fail 	Lee Child	 Dick Hill	1590860624	2002
3871	The Siren	Tiffany Reisz	\N	373605692	2012
3872	Little Children	Tom Perrotta	\N	312315732	2004
3873	Art of Seduction	Robert Greene	\N	1861977697	2001
3874	The Known World	Edward P. Jones	\N	61159174	2003
3875	Swallowing Darkness	Laurell K. Hamilton	\N	345495934	2008
3876	Night Pleasures	Sherrilyn Kenyon	\N	312593554	2002
3877	The Girl on the Train	Paula Hawkins	\N	1594633665	2015
3878	Darkfever	Karen Marie Moning	\N	385339151	2006
3879	Crave	J.R. Ward	\N	451229444	2010
3880	Ten Little Niggers	Agatha Christie	\N	312330871	1939
3881	Masquerade	Melissa de la Cruz	\N	786838930	2007
3882	Holidays on Ice	David Sedaris	\N	316191299	1997
3883	Put Me in the Zoo	Robert Lopshire	\N	067984483X	1960
3884	Autobiography of a Face	Lucy Grealy	\N	60569662	1994
3885	Rivers of London	Ben Aaronovitch	\N	034552425X	2011
3886	The Black Cauldron	Lloyd Alexander	\N	080508049X	1965
3887	Bloodrose	Andrea Cremer	\N	399256121	2012
3888	Chomp!	Carl Hiaasen	\N	375868429	2012
3889	The Windup Girl	Paolo Bacigalupi	\N	1597801577	2009
3890	Magic Study	Maria V. Snyder	\N	373802498	2006
3891	As You Like It	William Shakespeare	\N	074348486X	1599
3892	Vision in White	Nora Roberts	\N	425227510	2009
3893	City of Glass	Paul Auster	\N	140097317	1985
3894	The Longest Day	Cornelius Ryan	\N	671890913	1959
3895	The Polar Express	Chris Van Allsburg	\N	395389496	1985
3896	Rabbit at Rest	John Updike	\N	449911942	1990
3897	American Psycho	Bret Easton Ellis	\N	679735771	1991
3899	The Darkest Hour	Maya Banks	\N	425227944	2010
3900	Stepbrother Dearest	Penelope Ward	\N	1502446936	2014
3901	Wishful Drinking	Carrie Fisher	\N	1439102252	2008
3902	The Cat in the Hat Comes Back	Dr. Seuss	\N	394800028	1958
3903	The Sirens of Titan	Kurt Vonnegut Jr.	\N	1857988841	1959
3904	Valis	Philip K. Dick	\N	679734465	1981
3905	The 20th Century Art Book	Phaidon Press	\N	714847984	1996
3906	The Bird and the Sword	Amy Harmon	\N	1533134138	2016
3907	Before the Fall	Noah Hawley	\N	1455561789	2016
3908	The Queen of the Damned	Anne Rice	\N	345419626	1988
3909	Toll the Hounds	Steven Erikson	\N	765310082	2008
3910	The Atrocity Archives	Charles Stross	\N	441013651	2004
3911	The Chocolate War	Robert Cormier	\N	375829873	1974
3912	The Last Dragonslayer	Jasper Fforde	\N	547738471	2010
3913	Willow	Julia Hoban	\N	803733569	2009
3914	Velocity	Dean Koontz	\N	553588257	2005
3915	Nexus	Ramez Naam	\N	857662937	2012
3916	All-of-a-Kind Family	Sydney Taylor	\N	385732953	1951
3917	Devil's Game	Joanna Wylde	\N	425272354	2014
3918	The Dive From Clausen's Pier	Ann Packer	\N	375727132	2002
3919	Path of the Assassin	Brad Thor	\N	141651631X	2003
3920	Pursuit of God	A.W. Tozer	\N	875093663	1948
3921	How We Decide	Jonah Lehrer	\N	618620117	2009
3922	Mockingbird	Kathryn Erskine	\N	399252649	2010
3923	The Wretched of Muirwood	Jeff Wheeler	\N	1612187005	2011
3924	Raise the Titanic!	Clive Cussler	\N	425194523	1976
3925	On Chesil Beach	Ian McEwan	\N	224081187	2007
3926	Shadow Kiss	Richelle Mead	\N	1595141979	2008
3927	Reunion	Karen Kingsbury	 Gary Smalley	842386882	2004
3928	The Paper Magician	Charlie N. Holmberg	\N	1477823832	2014
3929	Fatal Voyage	Kathy Reichs	\N	1416510567	2001
3930	The Concrete Blonde	Michael Connelly	\N	044661758X	1994
3931	Hold Still	Nina LaCour	\N	525421556	2009
3932	Sleeping Arrangements	Madeleine Wickham	\N	552772291	2001
3933	The Blue Castle	L.M. Montgomery	\N	553280511	1926
3934	Tintentod	Cornelia Funke	\N	1905294719	2007
3935	Killing Floor	Lee Child	\N	515141429	1997
3936	Red Lily	Nora Roberts	\N	515139408	2005
3937	Harriet the Spy	Louise Fitzhugh	\N	440416795	1964
3938	Drinking: A Love Story	Caroline Knapp	\N	385315546	1996
3939	Supernaturally	Kiersten White	\N	61985864	2011
3940	Full Dark, No Stars	Stephen King	\N	1439192561	2010
3941	The Android's Dream	John Scalzi	\N	765309416	2006
3942	Delusion in Death	J.D. Robb	\N	399158812	2012
3943	Birdsong	Sebastian Faulks	\N	679776818	1993
3944	Ice Station	Matthew Reilly	\N	312971230	1998
3945	Saving June	Hannah Harrington	\N	1921794097	2011
3946	Last Argument of Kings	Joe Abercrombie	\N	575077905	2008
3947	Midnight Awakening 	Lara Adrian	\N	553589393	2007
3948	Redshirts	John Scalzi	\N	765316994	2012
3949	The Water Knife	Paolo Bacigalupi	\N	385352875	2015
3950	Rainbow Six	Tom Clancy	\N	425170349	1998
3951	The Six Sacred Stones	Matthew Reilly	\N	1405038160	2007
3952	The Secret Chord	Geraldine Brooks	\N	670025771	2015
3953	The Dreaming Void	Peter F. Hamilton	\N	345496531	2007
3954	The Matarese Circle	Robert Ludlum	\N	752858556	1979
3955	Never Seduce a Scot	Maya Banks	\N	345533232	2012
3956	The summer I turned pretty	Jenny Han	\N	144244228X	2009
3957	Lake in the Clouds	Sara Donati	\N	553582798	2002
3958	Double Cross	James Patterson	\N	316015059	2007
3959	Brian's Winter	Gary Paulsen	\N	440227194	1996
3960	The Wedding Girl	Madeleine Wickham	\N	552772275	1999
3961	Orphan Train	Christina Baker Kline	\N	61950726	2013
3962	Bag of Bones	Stephen King	\N	067102423X	1998
3963	As The Crow Flies	Jeffrey Archer	\N	312997116	1990
3964	Double Indemnity	James M. Cain	\N	679723226	1936
3965	Dark Flame	Alyson Noel	\N	312590970	2010
3966	Locked On	Tom Clancy	 Mark Greaney	039915731X	2011
3967	The Rogue	Trudi Canavan	\N	184149593X	2011
3968	Lucia, Lucia	Adriana Trigiani	\N	345472446	2003
3969	A Bend in the River	V.S. Naipaul	\N	330487140	1979
3970	The Scarlet Feather	Maeve Binchy	\N	451203771	2000
3971	Ordinary People	Judith Guest	\N	140065172	1976
3972	The Big Over Easy	Jasper Fforde	\N	143037234	2005
3973	Cryptonomicon	Neal Stephenson	\N	60512806	1999
3974	The Amber Spyglass	Philip Pullman	\N	440238153	2000
3975	Handle with Care	Jodi Picoult	\N	743296419	2009
3976	The Innocent Man	John Grisham	\N	385517238	2006
3977	Dad Is Fat	Jim Gaffigan	\N	385349068	2013
3978	Patient Zero	Jonathan Maberry	\N	312382855	2009
3979	The Book of Joe	Jonathan Tropper	\N	385338104	2003
3980	Zeitoun	Dave Eggers	\N	1934781630	2008
3981	Sex and the City	Candace Bushnell	\N	446617687	1996
3982	Corduroy	Don Freeman	\N	670241334	1948
3983	The Miracle Worker	William  Gibson	\N	743457587	1956
3984	A Prisoner of Birth	Jeffrey Archer	\N	312379293	2008
3985	First Family	David Baldacci	\N	446539759	2009
3986	Motherless Brooklyn	Jonathan Lethem	\N	375724834	1999
3987	Pnin	Vladimir Nabokov	 David Lodge	1400041988	1953
3988	We Are Called to Rise	Laura  McBride	\N	1476738963	2014
3989	Child of the Prophecy 	Juliet Marillier	\N	765345013	2001
3990	The Westing Game	Ellen Raskin	\N	014240120X	1978
3991	Silver on the Tree	Susan Cooper	\N	689840330	1977
3992	Eight Cousins	Louisa May Alcott	\N	486455599	1874
3993	The Sight	Erin Hunter	\N	60892013	2007
3994	Every Day	David Levithan	\N	307931889	2012
3995	The Aviator's Wife	Melanie Benjamin	\N	345528670	2013
3996	Gerald's Game	Stephen King	\N	831727527	1992
3997	Black Like Me	John Howard Griffin	\N	451208641	1960
3998	Mr. Murder	Dean Koontz	\N	425210758	1993
3999	A Million Little Pieces	James Frey	\N	307276902	2003
4000	Pretty Little Liars	Sara Shepard	\N	60887303	2006
4001	Danse Macabre	Stephen King	\N	042518160X	1981
4002	A is for Alibi	Sue Grafton	\N	312938993	1982
4003	Lie Down With Lions	Ken Follett	\N	451210468	1985
4004	Summer Island	Kristin Hannah	\N	345483448	2001
4005	The Silent Girl	Tess Gerritsen	\N	345515501	2011
4006	Memory in Death 	J.D. Robb	\N	425210731	2006
4007	Anthem	Ayn Rand	\N	452281253	1938
4008	A Virtuous Woman 	Kaye Gibbons	\N	375703063	1989
4009	A Year Down Yonder	Richard Peck	\N	142300705	2000
4010	The Middle Place	Kelly Corrigan	\N	1401303366	2005
4011	The Third Twin	Ken Follett	\N	033034837X	1996
4012	The Sea	John Banville	\N	1400097029	2005
4013	The Thief of Always	Clive Barker	\N	60177241	1992
4014	Escape	Carolyn Jessop	 Laura Palmer	767927567	2007
4015	The Summoning	Kelley Armstrong	\N	61662690	2008
4016	Sisters	Danielle Steel	\N	385340222	2007
4017	Caleb's Crossing	Geraldine Brooks	\N	670021040	2011
4018	The Leftovers	Tom Perrotta	\N	312358342	2011
4019	Violin	Anne Rice	\N	8466302204	1997
4020	The Magic (The Secret #3)	Rhonda Byrne	\N	1451673442	2012
4021	The Glass Menagerie	Tennessee Williams	\N	811214044	1945
4022	Paris	Edward Rutherfurd	\N	385535309	2013
4023	Inside Out & Back Again	Thanhha Lai	\N	61962783	2011
4024	The Winter People	Jennifer McMahon	\N	385538499	2014
4025	Breakfast with Buddha	Roland Merullo	\N	1565125525	2007
4026	Gold	Chris Cleave	\N	1451672721	2012
4027	Sons of Fortune	Jeffrey Archer	\N	033041335X	2002
4028	Dead Ever After	Charlaine Harris	\N	193700788X	2013
4029	A Light in the Attic	Shel Silverstein	\N	60513063	1981
4030	Plainsong	Kent Haruf	\N	375705856	1999
4031	Home Again	Kristin Hannah	\N	449226352	1996
4032	The Enchantress	Michael Scott	\N	385735359	2012
4033	The Night Sister	Jennifer McMahon	\N	385538510	2015
4034	Invisible Prey	John Sandford	\N	399154213	2007
4035	The Little House	Virginia Lee Burton	\N	395181569	1942
4036	Dark Matter	Blake Crouch	\N	1101904224	2016
4037	Virals	Kathy Reichs	 Brendan Reichs	1595143424	2010
4038	Bridge of Sighs	Richard Russo	\N	375414959	2007
4039	The Scarpetta Factor 	Patricia Cornwell	\N	399156399	2009
4040	Baby Proof	Emily Giffin	\N	312348649	2006
4041	Fever Pitch	Nick Hornby	\N	1573226882	1992
4042	Mossflower	Brian Jacques	\N	441005764	1988
4043	Angela's Ashes: A Memoir	Frank McCourt	\N	7205236	1996
4044	The Folk of Faraway Tree	Enid Blyton	\N	749732105	1946
4045	Congo	Michael Crichton	\N	60541830	1980
4046	Eleven on Top	Janet Evanovich	\N	312985347	2005
4047	Honor's Splendour	Julie Garwood	\N	671737821	1987
4048	The Neighbor	Lisa Gardner	\N	553807234	2009
4049	Rainbow Valley	L.M. Montgomery	\N	553213180	1917
4050	The Moon Is Down	John Steinbeck	\N	141185538	1942
4051	Girl in Hyacinth Blue	Susan Vreeland	\N	014029628X	1999
4052	The Outlaw Demon Wails 	Kim Harrison	\N	60788704	2008
4053	Iron Kissed	Patricia Briggs	\N	441015662	2008
4054	The Orchardist	Amanda Coplin	\N	006218850X	2012
4055	Affliction	Laurell K. Hamilton	\N	425255700	2013
4056	The Chase	Clive Cussler	\N	399154388	2007
4057	Sweet Filthy Boy 	Christina Lauren	\N	1476751803	2014
4058	The Killer Angels	Michael Shaara	\N	345348109	1974
4059	Angels Flight	Michael Connelly	\N	446607274	1999
4060	Someone	Alice McDermott	\N	374281092	2013
4061	Love Story	Erich Segal	\N	380017601	1970
4062	Shadow of the Giant	Orson Scott Card	\N	1841492051	2005
4063	A Dirty Job	Christopher Moore	\N	60590270	2006
4064	Captains and the Kings	Taylor Caldwell	\N	449205622	1972
4065	The Wishsong of Shannara 	Terry Brooks	\N	1857231325	1985
4066	First Frost	Sarah Addison Allen	\N	1250019834	2015
4067	Runaway Ralph	Beverly Cleary	\N	590664875	1970
4068	Woken Furies	Richard K. Morgan	\N	345479718	2005
4069	The Hard Way	Lee Child	\N	385336691	2006
4070	Unwind	Neal Shusterman	\N	1416912045	2007
4071	Eats, Shoots and Leaves	Lynne Truss	\N	1592402038	2003
4072	Lord Jim	Joseph Conrad	\N	1551111721	1900
4073	Dexter in the Dark	Jeff Lindsay	\N	385518331	2006
4074	Anansi Boys	Neil Gaiman	\N	60515198	2005
4075	Clockwork Angel	Cassandra Clare	\N	1416975861	2010
4076	Motor Mouth	Janet Evanovich	\N	60584033	2006
4077	Good Wives	Louisa May Alcott	\N	1419122126	1868
4078	Forever Peace 	Joe Haldeman	\N	441005667	1997
4079	Hidden	P.C. Cast	 Kristin Cast	312594429	2012
4080	Boundaries	Henry Cloud	 John Townsend	310247454	1992
4081	The Silence of the Lambs	Thomas Harris	\N	99446782	1988
4082	First Among Sequels 	Jasper Fforde	\N	670038717	2007
4083	Black Water	D.J. MacHale	\N	689869118	2004
4084	Kar	Orhan Pamuk	 Maureen Freely	375706860	2002
4085	The Greatest Generation	Tom Brokaw	\N	812975294	1998
4086	Club Dead	Charlaine Harris	\N	1841493015	2003
4087	The Jungle Book	Rudyard Kipling	\N	812504690	1894
4088	Rainbows End	Vernor Vinge	\N	812536363	2006
4089	Books of Blood: Volume One	Clive Barker	\N	425083896	1984
4090	Candide	Voltaire	\N	486266893	1759
4091	The Family Fang	Kevin    Wilson	\N	61579033	2011
4092	The Sweet Far Thing	Libba Bray	\N	385730306	2007
4093	A Crown of Swords	Robert Jordan	\N	812550285	1996
4094	The List	Siobhan Vivian	\N	545169178	2012
4095	The Drop	Michael Connelly	\N	316069418	2011
4096	Abhorsen	Garth Nix	\N	60278250	2003
4097	Boy, Snow, Bird	Helen Oyeyemi	\N	1594631395	2013
4098	Bone Crossed	Patricia Briggs	\N	1841496863	2009
4099	Survivor	Chuck Palahniuk	\N	009928264X	1999
4100	The Swan Thieves	Elizabeth Kostova	\N	1847442404	2010
4101	Light A Penny Candle	Maeve Binchy	\N	009949857X	1982
4102	Breathing Lessons	Anne Tyler	\N	345485599	1988
4103	The Covenant	Beverly  Lewis	\N	764223305	2002
4104	Snow Crash	Neal Stephenson	\N	553380958	1992
4105	House of Sand and Fog	Andre Dubus III	\N	375727345	1999
4106	The Ghost Map	Steven Johnson	\N	1594489254	2006
4107	The Fires of Heaven	Robert Jordan	\N	1857232097	1993
4740	Saint Maybe	Anne Tyler	\N	449911608	1991
4108	Five Children and It 	E. Nesbit	\N	140367357	1902
4109	The Other Queen	Philippa Gregory	\N	1416549129	2008
4110	Fourth of July Creek	Smith Henderson	\N	62286447	2014
4111	Ever After	Karen Kingsbury	\N	031024756X	2006
4112	The King's Buccaneer	Raymond E. Feist	\N	553563734	1992
4113	Cook with Jamie	Jamie Oliver	\N	718147715	2006
4114	The Third Policeman	Flann O'Brien	\N	156478214X	1967
4115	The Lost Gate	Orson Scott Card	\N	765326574	2011
4116	Pollyanna	Eleanor H. Porter	\N	689849109	1912
4117	The Hidden Oracle	Rick Riordan	\N	148473274X	2016
4118	Pines	Blake Crouch	\N	1469216000	2012
4119	Bittersweet	Miranda Beverly-Whittemore	\N	804138567	2014
4120	The Scarlatti Inheritance	Robert Ludlum	\N	752858653	1971
4121	Fall of Giants	Ken Follett	\N	525951652	2010
4122	Hunting Ground	Patricia Briggs	\N	044101738X	2009
4123	The Scar of David	Susan Abulhawa	\N	1608190463	2006
4124	Holes	Louis Sachar	 Louis Sachar	439244196	1998
4125	The Candy Shop War	Brandon Mull	\N	159038783X	2007
4126	My Best Friend's Girl	Dorothy Koomson	\N	385341326	2006
4127	Rilla of Ingleside	L.M. Montgomery	\N	553269224	1921
4128	Gorillas in the Mist	Dian Fossey	\N	061808360X	1983
4129	H is for Homicide	Sue Grafton	\N	044900063X	1991
4130	Everything Leads to You	Nina LaCour	\N	525425888	2014
4131	The Troop	Nick Cutter	\N	1476717710	2014
4132	Styxx	Sherrilyn Kenyon	\N	1250029880	2013
4133	Homeland	R.A. Salvatore	\N	786939532	1990
4134	Theodore Rex	Edmund Morris	\N	812966007	2001
4135	An Ice Cold Grave	Charlaine Harris	\N	425217299	2007
4136	Hidden Riches	Nora Roberts	\N	425197220	1994
4137	The Testing	Joelle Charbonneau	\N	547959109	2013
4138	Darkfall	Dean Koontz	\N	425214591	1984
4139	Kitty Goes to Washington	Carrie Vaughn	\N	446616427	2006
4140	Welcome to the Jungle	Jim Butcher	\N	345507460	2008
4141	By the Sword	Mercedes Lackey	\N	886774632	1991
4142	Death Comes to Pemberley	P.D. James	\N	307959856	2012
4143	Love Anthony	Lisa Genova	\N	1439164681	2012
4144	Authority 	Jeff VanderMeer	\N	374104107	2014
4145	The Beatles: The Biography	Bob Spitz	\N	316013315	2005
4146	The Rum Diary	Hunter S. Thompson	\N	684856476	1998
4147	Stargazer	Claudia Gray	\N	61284408	2009
4148	Twilight	Leigh Nichols	 Dean Koontz	747236380	1984
4149	Where the Red Fern Grows	Wilson Rawls	\N	375806814	1961
4150	R is for Ricochet	Sue Grafton	\N	425203867	2004
4151	The Buried Giant	Kazuo Ishiguro	\N	030727103X	2015
4152	Frostbite	Richelle Mead	\N	1595141758	2008
4153	Finale	Becca Fitzpatrick	\N	1442426675	2012
4154	Abaddon's Gate	James S.A. Corey	\N	316129070	2013
4155	The Midwich Cuckoos	John Wyndham	\N	345299116	1957
4156	The Cay	Theodore Taylor	\N	044022912X	1969
4157	The City of Falling Angels	John Berendt	\N	143036939	2005
4158	The Stonekeeper's Curse	Kazu Kibuishi	\N	439846838	2009
4159	Golden Son	Pierce Brown	\N	345539826	2015
4160	Out of the Easy	Ruta Sepetys	\N	039925692X	2013
4161	The Earthsea Trilogy	Ursula K. Le Guin	\N	140050930	1975
4162	Cutting for Stone	Abraham Verghese	\N	375414495	2009
4163	The Egypt Game	Zilpha Keatley Snyder	\N	808553038	1967
4164	The Book with No Pictures	B.J. Novak	\N	803741715	2014
4165	Angels & Demons 	Dan Brown	\N	1416524797	2000
4166	Airman	Eoin Colfer	\N	141383356	2007
4167	Memorial Day	Vince Flynn	\N	1416548009	2004
4168	Beloved	Toni Morrison	\N	1400033411	1987
4169	Burial Rites	Hannah Kent	\N	316243914	2013
4170	A Good Yarn	Debbie Macomber	\N	778322955	2005
4171	In This Mountain (Mitford)	Jan Karon	\N	143035088	2002
4172	The Postman	David Brin	\N	553278746	1985
4173	The Girl with All the Gifts	M.R. Carey	\N	356500152	2014
4174	The Nightingale	Kristin Hannah	\N	312577222	2015
4175	Perfect You	Elizabeth Scott	\N	1416953558	2008
4176	Salvation in Death	J.D. Robb	\N	749908904	2008
4177	Glue	Irvine Welsh	\N	99436922	2001
4178	Cuentos de Eva Luna	Isabel Allende	\N	743217187	1988
4179	A Hat Full of Sky	Terry Pratchett	\N	055255264X	2004
4180	The Eagle Has Landed	Jack Higgins	\N	140273344	1975
4181	Sharpe's Rifles	Bernard Cornwell	\N	140294295	1988
4182	The Little Lady Agency	Hester Browne	\N	1416527265	2005
4183	The Burning Bridge	John Flanagan	\N	399244557	2005
4184	The Mist	Stephen King	\N	451223292	1980
4185	The Prodigal Daughter	Jeffrey Archer	\N	312997140	1982
4186	Half Girlfriend	Chetan Bhagat	\N	8129135728	2014
4187	Fallen	Lauren Kate	\N	385738935	2009
4188	Stardust	Neil Gaiman	\N	61142026	1999
4189	Storm	Brigid Kemmerer	\N	758272812	2012
4190	The Three	Sarah Lotz	\N	031624290X	2014
4191	Animal Dreams	Barbara Kingsolver	\N	60921145	1990
4192	American Born Chinese	Gene Luen Yang	\N	1596431520	2006
4193	The Black Box	Michael Connelly	\N	316069434	2012
4194	The Short Victorious War	David Weber	\N	671875965	1994
4195	The Inn At Rose Harbor	Debbie Macomber	\N	345528921	2012
4196	The Crippled God	Steven Erikson	\N	593046358	2011
4197	The Day of the Triffids	John Wyndham	\N	812967127	1951
4198	Paranormalcy	Kiersten White	\N	61985848	2010
4199	Think and Grow Rich	Napoleon Hill	\N	1585424331	1937
4200	The Forge of God	Greg Bear	\N	765301075	1987
4201	Uganda Be Kidding Me	Chelsea Handler	\N	1455599735	2014
4202	Words of Radiance	Brandon Sanderson	\N	765326361	2014
4203	Whispers at Moonrise 	C.C. Hunter	\N	1250011914	2012
4204	The Rook	Daniel O'Malley	\N	316098795	2012
4205	Lirael	Garth Nix	\N	60590165	2001
4206	Horns	Joe Hill	\N	61147958	2009
4207	Heir of Fire	Sarah J. Maas	\N	1619630656	2014
4208	Magic Bleeds	Ilona Andrews	\N	441018521	2010
4209	Ya-Yas in Bloom	Rebecca Wells	\N	7201095	2005
4210	Rama II	Arthur C. Clarke	 Gentry Lee	2290032042	1989
4211	Cursor's Fury	Jim Butcher	\N	441014348	2006
4212	Daughter of the Blood	Anne Bishop	\N	451456718	1998
4213	Blood Bound	Patricia Briggs	\N	441014739	2007
4214	Five Run Away Together	Enid Blyton	\N	340796170	1944
4215	The Lord of the Rings	J.R.R. Tolkien	\N	618640150	1955
4216	The First Part Last	Angela Johnson	\N	689849230	2003
4217	The Winner	David Baldacci	\N	446522597	1997
4218	Mind Prey	John Sandford	\N	425152898	1995
4219	Taran Wanderer	Lloyd Alexander	\N	805080511	1967
4220	The Prince	Kiera Cass	\N	62248162	2013
4221	Lord Loss	Darren Shan	\N	316012335	2005
4222	A Girl Like You	Gemma Burgess	\N	184756190X	2011
4223	Smile	Raina Telgemeier	\N	545132053	2009
4224	Princess in Training	Meg Cabot	\N	60096152	2006
4225	Rot & Ruin	Jonathan Maberry	\N	1442402326	2010
4226	Flaskepost fra P	Jussi Adler-Olsen	\N	8756787650	2009
4227	Fudge-a-Mania	Judy Blume	\N	425193829	1990
4228	Intertwined	Gena Showalter	\N	373210027	2009
4229	Cat's Cradle	Kurt Vonnegut Jr.	\N	140285601	1963
4230	The Ship Who Sang	Anne McCaffrey	\N	345334310	1969
4231	Grasshopper Jungle	Andrew  Smith	\N	525426035	2014
4232	The Uncommon Reader 	Alan Bennett	\N	374280967	2007
4233	Never Have I Ever 	Sara Shepard	\N	61869724	2011
4234	The Very Quiet Cricket	Eric Carle	\N	399218858	1990
4235	The Looking Glass Wars	Frank Beddor	\N	803731531	2004
4236	Unnatural Death	Dorothy L. Sayers	\N	61043583	1927
4237	The Duke and I	Julia Quinn	\N	380800829	2000
4238	The Haunted Mask	R.L. Stine	\N	439568331	1993
4239	Girl in a Band	Kim Gordon	\N	62295896	2015
4240	Turn Coat	Jim Butcher	\N	451462564	2009
4241	Surfacing	Margaret Atwood	\N	385491050	1972
4242	Glamorama	Bret Easton Ellis	\N	375703845	1998
4243	Influx	Daniel Suarez	\N	525953183	2014
4244	The Beet Queen	Louise Erdrich	\N	60835273	1985
4245	Dreaming of You 	Lisa Kleypas	\N	038077352X	1994
4246	Lover Enshrined, part two	J.R. Ward	\N	451225856	2009
4247	The Power of Habit	Charles Duhigg	\N	1400069289	2011
4248	A Morbid Taste for Bones	Ellis Peters	\N	446400157	1977
4249	The Emperor's Tomb	Steve Berry	\N	345505492	2010
4250	Blackberry Wine	Joanne Harris	\N	380815923	1999
4251	A Son of the Circus	John Irving	\N	345915623	1994
4252	Article 5	Kristen Simmons	\N	765329581	2012
4253	Natchez Burning	Greg Iles	\N	62311077	2014
4254	The Apprentice	Tess Gerritsen	\N	345447867	2002
4255	Hold Tight	Harlan Coben	\N	525950608	2008
4256	Stoner	John  Williams	 John McGahern	1590171993	1965
4257	The Mad Ship	Robin Hobb	\N	6498868	1999
4258	Broken	Karin Slaughter	\N	385341970	2010
4259	The Broker	John Grisham	\N	385340540	2005
4260	Halo	Alexandra Adornetto	\N	312656262	2010
4261	Envy	Sandra Brown	\N	749932945	1999
4262	The Bean Trees	Barbara Kingsolver	\N	812474945	1988
4263	The Program	Suzanne Young	\N	1442445807	2013
4264	A Room with a View	E.M. Forster	\N	1420925431	1908
4265	The Two Towers	J.R.R. Tolkien	\N	618346260	1954
4266	Futures and Frosting	Tara Sivec	\N	1478314605	2012
4267	The Inner Circle	Brad Meltzer	\N	446577898	2011
4268	The Sum of All Fears	Tom Clancy	\N	425184226	1991
4269	Austerlitz	W.G. Sebald	 Anthea Bell	140297995	2001
4270	Palestine	Joe Sacco	 Edward Said	156097432X	1996
4271	The Sandcastle Girls	Chris Bohjalian	\N	385534795	2012
4272	Xenocide	Orson Scott Card	\N	312861877	1991
4273	The Pillars of Creation	Terry Goodkind	\N	765340747	2001
4274	The Inimitable Jeeves 	P.G. Wodehouse	\N	140284125	1923
4275	Sacajawea	Anna Lee Waldo	\N	380842939	1978
4276	The Obelisk Gate	N.K. Jemisin	\N	356508366	2016
4277	Circling the Sun	Paula McLain	\N	345534182	2015
4278	Shadow of Night	Deborah Harkness	\N	670023485	2012
4279	Teacher Man	Frank McCourt	\N	743243781	2005
4280	Don't Waste Your Life	John Piper	\N	1581344988	2003
4281	Cosmos	Carl Sagan	\N	375508325	1980
4282	Hannibal	Thomas Harris	\N	99297701	1999
4283	Changes	Jim Butcher	\N	045146317X	2010
4284	Kim	Rudyard Kipling	 Edward Said	140183523	1901
4285	Black Rose	Nora Roberts	\N	739453823	2005
4286	Promised	Caragh M. O'Brien	\N	1596435712	2012
4287	Memnoch The Devil	Anne Rice	\N	096319254X	1995
4288	Full Moon Rising	Keri Arthur	\N	553588451	2006
4289	Everything I Never Told You	Celeste Ng	\N	159420571X	2014
4290	Piercing the Darkness	Frank E. Peretti	\N	1581345275	1989
4291	Across the Universe	Beth Revis	\N	1595143971	2011
4292	Nature Girl	Carl Hiaasen	\N	307262995	2006
4293	Scandal in Spring	Lisa Kleypas	\N	60562536	2006
4294	Cress	Marissa Meyer	\N	312642970	2014
4295	Assholes Finish First	Tucker Max	\N	1416938745	2008
4296	Good in Bed	Jennifer Weiner	\N	743418174	2001
4297	Carpe Corpus	Rachel Caine	\N	451227190	2009
4298	Tears of a Tiger	Sharon M. Draper	\N	689806981	1994
4299	Eloise	Kay Thompson	 Hilary Knight	067122350X	1955
4300	Rage	Richard Bachman	 Stephen King	451076451	1977
4301	Amsterdam	Ian McEwan	\N	385494246	1998
4302	The Story of Art	E.H. Gombrich	\N	071483355X	1950
4303	Hell's Corner 	David Baldacci	\N	230706150	2010
4304	I Too Had A Love Story	Ravinder Singh	\N	8188575704	2007
4305	Pale Fire	Vladimir Nabokov	\N	141185260	1962
4306	Orthodoxy	G.K. Chesterton	\N	160096527X	1908
4307	One Day at Horrorland	R.L. Stine	\N	439568412	1994
4308	The House of Silk	Anthony Horowitz	\N	316196991	2011
4309	Staked	Kevin Hearne	\N	345548515	2016
4310	Kiss of Crimson 	Lara Adrian	\N	553589385	2007
4311	The Cold Moon	Jeffery Deaver	\N	743296788	2006
4312	The Spectacular Now	Tim Tharp	\N	375851798	2008
4313	A Beautiful Mind	Sylvia Nasar	\N	571212921	1998
4314	In the Night Kitchen	Maurice Sendak	\N	99417472	1970
4315	The Autograph Man	Zadie Smith	\N	037570387X	2002
4316	The Aeronaut's Windlass 	Jim Butcher	\N	451466802	2015
4317	The Wonder	Emma Donoghue	\N	316393878	2016
4318	Grave Mercy	Robin LaFevers	\N	054762834X	2012
4319	Truce	R.L. Mathewson	\N	988573229	2013
4320	Eldest	Christopher Paolini	\N	375840400	2005
4321	Tampa	Alissa Nutting	\N	62280562	2013
4322	Cry to Heaven	Anne Rice	\N	345396936	1982
4323	One Shot	Lee Child	\N	440241022	2005
4324	A Simple Plan	Scott B. Smith	\N	307279952	1993
4325	Telegraph Avenue	Michael Chabon	\N	61493341	2012
4326	Infidel	Ayaan Hirsi Ali	\N	743289684	2006
4327	Prayers for Sale	Sandra Dallas	\N	312385188	1997
4328	Bite Me If You Can	Lynsay Sands	\N	60774126	2007
4329	Forest Born	Shannon Hale	\N	1599901676	2009
4330	All-American Girl	Meg Cabot	\N	64472779	2002
4331	Fantasy Lover	Sherrilyn Kenyon	\N	312979975	2002
4332	A Place Called Freedom	Ken Follett	\N	449225151	1995
4333	Spark	Brigid Kemmerer	\N	758272820	2012
4334	Rainbow Valley	L.M. Montgomery	\N	553269216	1919
4335	Flag in Exile	David Weber	\N	671876813	1995
4336	If I Stay	Gayle Forman	\N	525421033	2009
4337	Shock Wave	Clive Cussler	\N	743449673	1996
4338	High Fidelity	Nick Hornby	\N	1573225517	1995
4339	Captivated by You	Sylvia Day	\N	425273865	2014
4340	Cross	James Patterson	\N	316159794	2006
4341	Mr Maybe	Jane Green	\N	767905202	1999
4342	Alif the Unseen	G. Willow Wilson	\N	802120202	2012
4343	Mortal Prey	John Sandford	\N	425189864	2002
4344	Gone	Lisa Gardner	\N	553588079	2006
4345	Elle s'appelait Sarah	Tatiana de Rosnay	\N	312370830	2007
4346	Windmills of the Gods	Sidney Sheldon	\N	6174426	1987
4347	The Partner	John Grisham	\N	385339100	1997
4348	Mystery	Jonathan Kellerman	\N	345505697	2011
4349	Deadhouse Gates	Steven Erikson	\N	765310023	2000
4350	The Vanished Man	Jeffery Deaver	\N	743437810	2003
4351	The Double Bind	Chris Bohjalian	\N	1400047463	2007
4352	Unspoken	Sarah Rees Brennan	\N	375870415	2012
4353	The Last Anniversary	Liane Moriarty	\N	60890681	2006
4354	Visions of Heat	Nalini Singh	\N	042521575X	2007
4355	The Name of the Star	Maureen Johnson	\N	399256601	2011
4356	I'd Know You Anywhere	Laura Lippman	\N	61706558	2010
4357	Firestarter	Stephen King	\N	451167805	1980
4358	An Echo in the Bone	Diana Gabaldon	\N	752898477	2009
4359	Twisted Palace	Erin Watt	\N	1682305066	2016
4360	Miller's Valley	Anna Quindlen	\N	812996089	2016
4361	Darkness	John Saul	\N	553297260	1991
4362	The Magicians' Guild	Trudi Canavan	\N	1841493139	2001
4363	Restless	William  Boyd	\N	747589372	2006
4364	The Informers	Bret Easton Ellis	\N	330339184	1994
4365	One Door Away from Heaven	Dean Koontz	\N	553582755	2001
4366	Death du Jour	Kathy Reichs	\N	671011375	1999
4367	First Test	Tamora Pierce	\N	679889175	1999
4368	The Boston Girl	Anita Diamant	\N	1439199353	2014
4369	Nefertiti	Michelle Moran	\N	307381463	2007
4370	Along Came a Spider	James Patterson	\N	446692638	1993
4371	Last Sacrifice 	Richelle Mead	\N	1595143068	2010
4372	Hidden	Sophie Jordan	\N	61935123	2012
4373	Tortured for Christ	Richard Wurmbrand	\N	340863684	1940
4374	Keeping the Moon	Sarah Dessen	\N	142401765	1999
4375	Sophie's Choice	William Styron	\N	679736379	1979
4376	A Head Full of Ghosts	Paul Tremblay	\N	62363239	2015
4377	The Body Finder	Kimberly Derting	\N	61779814	2010
4378	Jacob	Jacquelyn Frank	\N	821780654	2006
4379	Swallows and Amazons	Arthur Ransome	\N	087923573X	1930
4380	Finders Keepers	Stephen King	\N	1501100130	2015
4381	Every Last Word	Tamara Ireland Stone	\N	1484705270	2015
4382	Crossroads of Twilight	Robert Jordan	\N	312864590	2003
4383	The Elfstones Of Shannara	Terry Brooks	\N	736693416	1982
4384	The Jordan Rules	Sam Smith	 Doug Grud	671796666	1992
4385	We'll Always Have Summer	Jenny Han	\N	1416995587	2011
4386	WAR	Sebastian Junger	\N	446556246	2010
4387	A House for Mr. Biswas	V.S. Naipaul	\N	330487191	1961
4388	Necessary Lies	Diane Chamberlain	\N	1250010691	2013
4389	The Pigeon Wants a Puppy!	Mo Willems	\N	1423109600	2008
4390	The Eight	Katherine Neville	\N	345366239	1988
4391	The Fourth Protocol	Frederick Forsyth	\N	99642611	1984
4392	The Complete Stories	Flannery O'Connor	\N	374515360	1971
4393	A Week in Winter	Maeve Binchy	\N	140911399X	2012
4394	Ecstasy Unveiled	Larissa Ione	\N	446556823	2010
4395	Message in a Bottle	Nicholas Sparks	\N	446676071	1998
4396	Black Beauty	Anna Sewell	\N	439228905	1877
4397	Protect and Defend	Vince Flynn	\N	074327041X	2007
4398	Providence	Jamie McGuire	\N	615417175	2010
4399	Master of the Game	Sidney Sheldon	\N	6472613	1982
4400	City of Bones	Cassandra Clare	\N	1416914285	2007
4401	Finding Cassie Crazy	Jaclyn Moriarty	\N	439498821	2003
4402	Revival	Stephen King	\N	1476770387	2014
4403	Moving Pictures	Terry Pratchett	\N	552152943	1990
4404	The Crimson Campaign	Brian  McClellan	\N	356502023	2014
4405	Celebrity in Death	J.D. Robb	\N	749955910	2012
4406	Twice Bitten 	Chloe Neill	\N	451230647	2010
4407	Absalom, Absalom!	William Faulkner	\N	679732187	1936
4408	Kindred in Death 	J.D. Robb	\N	749928999	2009
4409	Ogre, Ogre (Xanth, #5)	Piers Anthony	\N	345418530	1982
4410	Under the Dome	Stephen King	\N	1439148503	2009
4411	Empress Orchid	Anchee Min	\N	618562036	2003
4412	Bad Feminist 	Roxane Gay	\N	62282719	2014
4413	Inca Gold	Clive Cussler	\N	743426800	1994
4414	A Fine Balance	Rohinton Mistry	\N	140003065X	1996
4415	Jude the Obscure	Thomas Hardy	\N	486452433	1895
4416	Herr der Diebe	Cornelia Funke	\N	1903434777	2000
4417	The Mephisto Club	Tess Gerritsen	\N	345476999	2006
4418	Red Mist	Patricia Cornwell	\N	399158022	2011
4419	The Other Wind	Ursula K. Le Guin	\N	044101125X	2001
4420	Hush, Hush	Becca Fitzpatrick	\N	1416989412	2009
4421	Lock In	John Scalzi	\N	765375869	2014
4422	We the Animals	Justin Torres	\N	547576722	2011
4423	Heartbreaker	Julie Garwood	\N	1416503811	2000
4424	Death of a Salesman	Arthur Miller	\N	435233076	1949
4425	Hey Nostradamus!	Douglas Coupland	\N	1582344159	2003
4426	Everlasting	Alyson Noel	\N	142998192X	2011
4427	How the Light Gets In	Louise Penny	\N	312655479	2013
4428	The Long Way Home	Louise Penny	\N	1250022061	2014
4429	Collected Poems	Dylan Thomas	\N	811202054	1952
4430	White Noise	Don DeLillo	\N	140283307	1985
4431	Atonement	Ian McEwan	\N	038572179X	2001
4432	Shelter	Harlan Coben	\N	399256504	2011
4433	Tenth Grade Bleeds	Heather Brewer	\N	525421351	2009
4434	Depraved Heart	Patricia Cornwell	\N	006232540X	2015
4435	Kiss of a Demon King 	Kresley Cole	\N	1416580948	2009
4436	Think Twice	Lisa Scottoline	\N	312380755	2010
4437	Eternal Kiss of Darkness	Jeaniene Frost	\N	61783161	2010
4438	One Breath Away	Heather Gudenkauf	\N	778313654	2012
4439	Elixir	Jennifer L. Armentrout	\N	1937053415	2012
4440	Chains	Laurie Halse Anderson	\N	1416905855	2008
4441	Heat	Bill Buford	\N	1400041201	2006
4442	Bare Bones	Kathy Reichs	\N	074345300X	2003
4443	Heartburn	Nora Ephron	\N	679767959	1983
4444	Fear Nothing 	Dean Koontz	\N	553579754	1998
4445	Kristy's Great Idea	Ann M. Martin	\N	590224735	1986
4446	The Fourth Hand	John Irving	\N	345463153	2001
4447	Evening Class	Maeve Binchy	\N	752876821	1996
4448	Midnight Rising	Lara Adrian	\N	440244447	2008
4449	Barely Breathing	Rebecca Donovan	\N	1452440026	2012
4450	Blood Cross	Faith Hunter	\N	451463072	2010
4451	Eragon	Christopher Paolini	\N	375826696	2002
4452	Five Little Pigs	Agatha Christie	\N	425093255	1942
4453	UnWholly	Neal Shusterman	\N	1442423684	2012
4454	Altar of Eden	James Rollins	\N	61231428	2009
4455	Fifty Shades Darker	E.L. James	\N	1612130585	2011
4456	Love Letters to the Dead	Ava Dellaira	\N	374346674	2014
4457	The Lords of the North	Bernard Cornwell	\N	60888628	2006
4458	Dime Store Magic	Kelley Armstrong	\N	553590154	2004
4459	Claimed By Shadow	Karen Chance	\N	451461525	2007
4460	Unraveling	Elizabeth Norris	\N	62103733	2012
4461	Fifty Shades of Grey	E.L. James	\N	1612130291	2011
4462	American Gods	Neil Gaiman	\N	747263744	2001
4463	Tilt	Ellen Hopkins	\N	1416983309	2012
4464	Snow Flower and the Secret Fan	Lisa See	\N	812968069	2005
4465	Bones to Ashes	Kathy Reichs	\N	743294378	2007
4466	Hard Bitten	Chloe Neill	\N	451233328	2011
4467	Speaker for the Dead	Orson Scott Card	\N	812550757	1986
4468	Marvels	Kurt Busiek	 Alex Ross	785100490	1993
4469	Spin	Robert Charles Wilson	\N	076534825X	2005
4470	On the Island	Tracey Garvis-Graves	\N	1405910216	2011
4471	The Distant Hours	Kate Morton	\N	1439152780	2010
4472	Jinx	Meg Cabot	\N	60837640	2007
4473	Commencement	J. Courtney Sullivan	\N	307270742	2009
4474	When the Wind Blows	James Patterson	\N	446676438	1998
4475	Perfect Shadow	Brent Weeks	\N	316196487	2011
4476	Death in the Clouds	Agatha Christie	\N	000711933X	1935
4477	Fear Nothing	Lisa Gardner	\N	525953086	2014
4478	Some Luck	Jane Smiley	\N	307700313	2014
4479	Timeline	Michael Crichton	\N	99244721	1999
4480	The Dead	James Joyce	\N	097496090X	1914
4481	State of Fear	Michael Crichton	\N	61015733	2004
4482	The Interestings	Meg Wolitzer	\N	1594488398	2013
4483	Scent of Magic	Maria V. Snyder	\N	778314189	2012
4484	The Big Sleep	Raymond Chandler	\N	394758285	1939
4485	Savannah Blues	Mary Kay Andrews	\N	60519134	2002
4486	The Girl You Left Behind	Jojo Moyes	\N	670026611	2012
4487	Proof: A Play	David Auburn	\N	571199976	2000
4488	Red Harvest	Dashiell Hammett	\N	752852612	1929
4489	Braveheart	Randall Wallace	\N	671522817	1995
4490	Lullaby	Chuck Palahniuk	\N	99437961	2002
4491	The English Patient	Michael Ondaatje	\N	771068719	1992
4492	Hafalan Shalat Delisa	Tere Liye	\N	9793210605	2005
4493	Beautiful Bastard	Christina Lauren	\N	1476730105	2013
4494	We Need New Names	NoViolet Bulawayo	\N	316230812	2013
4495	The Racketeer	John Grisham	\N	385535144	2012
4496	The Complete Robot	Isaac Asimov	\N	586057242	1982
4497	Froi of the Exiles	Melina Marchetta	\N	670076082	2011
4498	Lilac Girls	Martha Hall Kelly	\N	1101883073	2016
4499	The one I left behind	Jennifer McMahon	\N	006212255X	2013
4500	Divine Madness	Robert Muchamore	\N	1416927247	2006
4501	On the Edge	Ilona Andrews	\N	441017800	2009
4502	Walk Two Moons	Sharon Creech	\N	60739495	1994
4503	Mini Shopaholic	Sophie Kinsella	\N	385342047	2010
4504	The Fiery Cross	Diana Gabaldon	\N	440221668	2001
4505	Food: A Love Story	Jim Gaffigan	\N	804140413	2014
4506	Ransom	Julie Garwood	\N	074347418X	1999
4507	The Third Secret	Steve Berry	\N	345476131	2005
4508	The List	Steve Martini	\N	515121495	1997
4509	The Black Lyon	Jude Deveraux	\N	60727217	1980
4510	Dear Life	Alice Munro	\N	771064861	2012
4511	Hammer of the Gods	Stephen Davis	\N	425182134	1985
4512	Power of Art	Simon Schama	\N	61176109	2006
4513	The World According to Garp	John Irving	\N	345915593	1978
4514	Fixed on You	Laurelin Paige	\N	162704017X	2013
4515	Subterranean	James Rollins	\N	380792648	1999
4516	Bite Club	Rachel Caine	\N	451233182	2011
4517	Solar	Ian McEwan	\N	385533411	2010
4518	Opal	Jennifer L. Armentrout	\N	1620610094	2012
4519	The Shunning	Beverly  Lewis	\N	764224735	1997
4520	The Doomsday Conspiracy	Sidney Sheldon	\N	1568650957	1991
4521	Through the Ever Night	Veronica Rossi	\N	62072064	2013
4522	Netherland	Joseph O'Neill	\N	307377040	2008
4523	Debt of Honor	Tom Clancy	\N	425147584	1994
4524	The Guns of Navarone	Alistair MacLean	\N	449214729	1957
4525	The Rembrandt Affair	Daniel Silva	\N	399156585	2010
4526	Consider Phlebas	Iain M. Banks	\N	1857231384	1987
4527	In Bed with a Highlander	Maya Banks	\N	345519477	2011
4528	The Lemonade War	Jacqueline Davies	\N	618750436	2007
4529	The Quantum Thief	Hannu Rajaniemi	\N	575088877	2010
4530	Gone 	Lisa McMann	\N	1416979182	2010
4531	On Mystic Lake	Kristin Hannah	\N	345471172	1999
4532	Stay Out of the Basement	R.L. Stine	\N	439568455	1992
4533	Kushiel's Mercy	Jacqueline Carey	\N	446500046	2001
4534	Emma	Jane Austen	 Fiona Stafford	141439580	1815
4535	Hothouse Flower	Lucinda Riley	\N	1451655789	2010
4536	Small Steps	Louis Sachar	\N	385733143	2006
4537	Wonder	R.J. Palacio	\N	375869026	2012
4538	Women in Love	D.H. Lawrence	\N	486424588	1920
4539	Fevre Dream	George R.R. Martin	\N	553383051	1982
4540	Arsenic and Old Lace	Joseph Kesselring	\N	856761222	1939
4541	Bruiser	Neal Shusterman	\N	61134104	2010
4542	Taltos	Anne Rice	 Tim Curry	679436545	1994
4543	Summer People	Elin Hilderbrand	\N	312997191	2003
4544	Mudbound	Hillary Jordan	\N	156512569X	2008
4545	So You Want to Be a Wizard	Diane Duane	\N	152047387	1983
4546	The Dante Club	Matthew Pearl	\N	034549038X	2003
4547	Bright Shiny Morning	James Frey	\N	61573132	2008
4548	Magic Breaks	Ilona Andrews	\N	425256227	2014
4549	Rose Madder	Stephen King	\N	340640146	1995
4550	Heart of Darkness	Joseph Conrad	\N	451526570	1910
4551	Storm Island	Ken Follett	\N	006074815X	1978
4552	A Great Deliverance	Elizabeth  George	\N	553278029	1988
4553	Hunted	P.C. Cast	 Kristin Cast	031237982X	2009
4554	The Maltese Falcon	Dashiell Hammett	\N	752865331	1930
4555	China Rich Girlfriend	Kevin Kwan	\N	385539088	2015
4556	Fireproof	Eric Wilson	\N	1595547169	2008
4557	The Great Santini	Pat Conroy	\N	553268929	1976
4558	Dark Side of the Moon	Sherrilyn Kenyon	\N	312934343	2006
4559	Saint Anything	Sarah Dessen	\N	451474708	2015
4560	Big Stone Gap	Adriana Trigiani	\N	345459202	2000
4561	The Fire Within	Chris d'Lacey	\N	439672449	2001
4562	The Whistling Season	Ivan Doig	\N	151012377	2006
4563	After Ever Happy	Anna Todd	\N	1501106406	2015
4564	Written on the Body	Jeanette Winterson	\N	679744479	1992
4565	Birds of a Feather	Jacqueline Winspear	\N	143035304	2004
4566	The Choice	Nicholas Sparks	\N	446579920	2007
4567	The Crown of Embers	Rae Carson	\N	62026518	2012
4568	The Burning Room	Michael Connelly	\N	316225932	2014
4569	Good as Gone	Amy Gentry	\N	544920953	2016
4570	Shades of Grey	Jasper Fforde	\N	670019631	2009
4571	The Visitation	Frank E. Peretti	\N	1595541209	1999
4572	The Pearl of the World	John Steinbeck	\N	142000698	1947
4573	The Black Widow	Daniel Silva	\N	006232022X	2016
4574	The Dragon's Path	Daniel Abraham	\N	1841498874	2011
4575	Make Me	Lee Child	\N	593073894	2015
4576	Stand on Zanzibar	John Brunner	\N	1857988361	1968
4577	Ways of Seeing	John Berger	\N	140135154	1972
4578	The Wicked Girls	Alex Marwood	\N	1847445209	2008
4579	Seven Ancient Wonders	Matthew Reilly	\N	1416505067	2005
4580	House of Suns	Alastair Reynolds	\N	575099127	2008
4581	Silent Prey	John Sandford	\N	425137562	1992
4582	The Pelican Brief	John Grisham	\N	385339704	1992
4583	Relentless	Dean Koontz	\N	553807145	2009
4584	The Pillars of the Earth	Ken Follett	\N	451207149	1989
4585	Cibola Burn	James S.A. Corey	\N	031621762X	2014
4586	The Widow	Fiona Barton	\N	1101990260	2016
4587	Abandon	Meg Cabot	\N	545284104	2011
4588	Next	Michael Crichton	\N	60872985	2006
4589	The Devil Colony	James Rollins	\N	61784788	2010
4590	Passion	Lauren Kate	\N	385739168	2011
4591	The Courts of Chaos	Roger Zelazny	\N	9993911550	1978
4592	Scat	Carl Hiaasen	\N	375834869	2009
4593	The Killing Game	Iris Johansen	\N	553581554	1999
4594	The Body Snatchers	Jack Finney	\N	684852586	1955
4595	Mastery	Robert Greene	\N	670024961	2012
4596	The Icarus Agenda	Robert Ludlum	\N	553278002	1988
4597	Gorky Park	Martin Cruz Smith	\N	345298349	1981
4598	Libra 	Don DeLillo	\N	140156046	1988
4599	A Kingdom of Dreams 	Judith McNaught	\N	743474155	1989
4600	Fade Away	Harlan Coben	\N	440222680	1996
4601	Lasher	Anne Rice	\N	99471434	1993
4602	Mad About Madeline	Ludwig Bemelmans	\N	590133373	1939
4603	Purity	Jonathan Franzen	\N	374239215	2015
4604	Lioness Rampant	Tamora Pierce	\N	689878575	1988
4605	Midnight	Erin Hunter	\N	60744510	2005
4606	By the Light of the Moon	Dean Koontz	\N	553582763	2002
4607	The Crossover	Kwame Alexander	\N	544289595	2014
4608	The Snow Child	Eowyn Ivey	\N	316175676	2012
4609	Jesus Land : A Memoir	Julia Scheeres	\N	1582433542	2005
4610	Coma	Robin Cook	\N	451159535	1977
4611	Appointment in Samarra	John O'Hara	\N	375719202	1933
4612	Lab Girl	Hope Jahren	\N	1101874937	2016
4613	The Bourne Supremacy	Robert Ludlum	\N	752863886	1986
4614	Lick	Kylie Scott	\N	1743342373	2013
4615	Term Limits	Vince Flynn	\N	671023187	1997
4616	Song of Solomon	Toni Morrison	\N	140003342X	1977
4617	No Talking	Andrew Clements	\N	1416909834	2007
4618	Grandfather's Journey	Allen Say	\N	395570352	1993
4619	Bring Up the Bodies	Hilary Mantel	\N	805090037	2012
4620	Old School	Jeff Kinney	\N	1419717014	2015
4621	The Last Precinct	Patricia Cornwell	\N	751525359	2000
4622	The Guardian	Nicholas Sparks	\N	446696110	2003
4623	Inescapable	Amy A. Bartol	\N	1461072514	2013
4624	The Hollow	Jessica Verday	\N	1416978933	2009
4625	She's Come Undone	Wally Lamb	\N	671021001	1992
4626	Life & Times of Michael K.	J.M. Coetzee	\N	009947915X	1983
4627	After	Amy Efaw	\N	670011835	2009
4628	The Dolphins of Pern	Anne McCaffrey	\N	345419383	1994
4629	Divergent	Veronica Roth	\N	62024035	2011
4630	Dance of the Gods	Nora Roberts	\N	515141666	2006
4631	The Realm of Possibility	David Levithan	\N	375836578	2004
4632	You Will Know Me	Megan Abbott	\N	031623107X	2016
4633	The Couple Next Door	Shari Lapena	\N	735221081	2016
4741	The Villa	Nora Roberts	\N	515132187	2001
4634	Opposition	Jennifer L. Armentrout	\N	1622662644	2014
4635	Small Island	Andrea Levy	\N	312424671	2004
4636	The Tiger Rising	Kate DiCamillo	\N	763618985	2001
4637	Blood Work	Michael Connelly	\N	446690449	1998
4638	The Subtle Knife	Philip Pullman	\N	679879250	1997
4639	Jamberry	Bruce Degen	\N	694006513	1982
4640	Digital Fortress	Dan Brown	\N	552151696	1998
4641	Ivanhoe	Walter Scott	\N	140436588	1819
4642	Chain Reaction	Simone Elkeles	\N	802720870	2011
4643	Storm Prey	John Sandford	\N	1847376177	2010
4644	False Memory	Dean Koontz	\N	553580221	1999
4645	The Plum Tree	Ellen Marie Wiseman	\N	758278438	2012
4646	Labor Day	Joyce Maynard	\N	61843407	2009
4647	Rising storm	Erin Hunter	\N	60525630	2005
4648	Forever	Maggie Stiefvater	\N	545259088	2011
4649	The Christmas Shoes	Donna VanLiere	\N	312289510	2001
4650	Shiloh	Phyllis Reynolds Naylor	\N	689862229	1991
4651	Dark Fire	C.J. Sansom	\N	143036432	2004
4652	Looking for Alaska	John Green	\N	142402516	2005
4653	An Itchy Day	Norman Bridwell	\N	059044297X	1963
4654	Grave Peril	Jim Butcher	\N	451458443	2001
4655	Lead	Kylie Scott	\N	1250052386	2014
4656	Sugar Daddy	Lisa Kleypas	\N	312351623	2007
4657	Gift from the Sea	Anne Morrow Lindbergh	\N	394724550	1955
4658	Notes from a Small Island	Bill Bryson	\N	380727501	1995
4659	Artemis Fowl	Eoin Colfer	\N	786817879	2001
4660	Passion Unleashed	Larissa Ione	\N	446401056	2009
4661	A Corner of the Universe	Ann M. Martin	\N	439771242	2002
4662	Shadow and Bone	Leigh Bardugo	\N	805094598	2012
4663	Claim Me	J. Kenner	\N	345545834	2013
4664	The White Queen	Philippa Gregory	\N	1416563687	2009
4665	The Wedding	Nicholas Sparks	\N	446615862	2003
4666	Cause of Death	Patricia Cornwell	\N	425213382	1996
4667	Doomsday Book	Connie Willis	\N	553562738	1992
4668	Lost Horizon	James Hilton	\N	60594527	1933
4669	Starcrossed	Josephine Angelini	\N	62011995	2011
4670	The Cruelest Month	Louise Penny	\N	755328949	2007
4671	Cleopatra: A Life	Stacy Schiff	\N	316001929	2006
4672	Ancillary Mercy	Ann Leckie	\N	356502422	2015
4673	Something Like Fate	Susane Colasanti	\N	670011460	2010
4674	The Snow Leopard	Peter Matthiessen	\N	140255087	1978
4675	Flirt	Laurell K. Hamilton	\N	042523567X	2009
4676	Salem's Lot	Stephen King	\N	450031063	1975
4677	Heat	Mike Lupica	\N	142407577	2006
4678	Zodiac	Robert Graysmith	\N	425098087	1986
4679	Crush	Richard Siken	\N	300107897	2005
4680	The Soldiers of Halla	D.J. MacHale	\N	141691420X	2009
4681	Tell-All	Chuck Palahniuk	\N	385526350	2010
4682	The Enemy	Lee Child	\N	440241014	2004
4683	The Crossing	Michael Connelly	\N	316225886	2015
4684	The Bear and the Dragon	Tom Clancy	\N	425180964	2000
4685	Sleeping Giants	Sylvain Neuvel	\N	1101886692	2016
4686	Family Matters	Rohinton Mistry	\N	037570342X	2001
4687	The Samurai's Garden	Gail Tsukiyama	\N	312144075	1994
4688	Het diner	Herman Koch	 Sam Garrett	770437850	2009
4689	A Fatal Grace	Louise Penny	\N	312352565	2007
4690	Midnight Alley	Rachel Caine	\N	451222385	2007
4691	Ross Poldark	Winston Graham	\N	330344951	1945
4692	Centennial	James A. Michener	\N	449214192	1974
4693	Follow the River	James Alexander Thom	\N	345338545	1981
4694	Empire of Storms	Sarah J. Maas	\N	1619636077	2016
4695	Three Fates	Nora Roberts	\N	515135062	2002
4696	The Crystal Shard	R.A. Salvatore	\N	786942460	1988
4697	Sister Carrie	Theodore Dreiser	\N	393960420	1900
4698	Girl Online	Zoe Sugg	 Siobhan Curham	141357274	2014
4699	Morning Star	Pierce Brown	\N	345539842	2016
4700	River, Cross My Heart	Breena Clarke	\N	316899984	1999
4701	How to Love	Katie Cotugno	\N	006221635X	2013
4702	Idoru	William Gibson	\N	425190455	1996
4703	Red Seas Under Red Skies	Scott Lynch	\N	553804685	2007
4704	King Leopold's Ghost	Adam Hochschild	\N	618001905	1998
4705	Tiger's Curse	Colleen Houck	\N	1402784031	2011
4706	Any Human Heart	William  Boyd	\N	1400031001	2002
4707	O Pioneers!	Willa Cather	\N	679743626	1913
4708	The Ship of Brides	Jojo Moyes	\N	340830107	2005
4709	Joker	Brian Azzarello	 Lee Bermejo	1401215815	2008
4710	The Return: Nightfall	L.J. Smith	\N	61720771	2009
4711	Origin	Jennifer L. Armentrout	\N	1622660757	2013
4712	Red Sparrow	Jason  Matthews	\N	1476706123	2013
4713	Lisey's Story	Stephen King	\N	743289412	2006
4714	A Separate Reality	Carlos Castaneda	\N	671732498	1968
4715	Knowing God	J.I. Packer	\N	083081650X	1973
4716	Dust	Patricia Cornwell	\N	399157573	2013
4717	Homegoing	Yaa Gyasi	\N	1101947136	2016
4718	Desires of the Dead	Kimberly Derting	\N	61779849	2011
4719	Unhinged	A.G. Howard	\N	1613125348	2014
4720	Kiss an Angel 	Susan Elizabeth Phillips	\N	380782332	1996
4721	Only Time Will Tell	Jeffrey Archer	\N	031253955X	2011
4722	Water for Elephants	Sara Gruen	\N	1565125606	2006
4723	Noises Off	Michael Frayn	\N	1400031605	1982
4724	A Clash of Kings	George R.R. Martin	\N	553381695	1998
4725	A Moveable Feast	Ernest Hemingway	\N	99285045	1964
4726	The First Commandment	Brad Thor	\N	1416543791	2007
4727	On Photography	Susan Sontag	\N	141187166	1973
4728	Silver Borne	Patricia Briggs	\N	044101819X	2010
4729	Supernova: Akar	Dee Lestari	\N	9799625726	2002
4730	What We Keep 	Elizabeth Berg	\N	345423291	1998
4731	Twenty Wishes	Debbie Macomber	\N	778325504	2008
4732	Ramona the Pest	Beverly Cleary	\N	192750976	1968
4733	The Devil's Arithmetic	Jane Yolen	\N	142401099	1988
4734	Cross My Heart	James Patterson	\N	316210900	2013
4735	Horde	Ann Aguirre	\N	1250024633	2013
4736	Flowers in the Attic	V.C. Andrews	\N	743496310	1979
4737	Dies the Fire 	S.M. Stirling	\N	451460413	2004
4738	Forever Amber	Kathleen Winsor	\N	141009829	1944
4739	Carrie	Stephen King	\N	1416524304	1974
4742	The Skin I'm In	Sharon G. Flake	\N	786813075	1998
4743	Mother of Pearl	Melinda Haynes	\N	671774670	1999
4744	The Golem and the Jinni	Helene Wecker	\N	62110837	2013
4745	Home 	Harlan Coben	\N	525955100	2016
4746	The Best Nest	P.D. Eastman	\N	394800516	1968
4747	The Witness	Nora Roberts	\N	399159371	2012
4748	Plain Truth	Jodi Picoult	\N	743275012	2000
4749	I'm OK-You're OK	Thomas A. Harris	\N	60724277	1967
4750	Something Like Normal	Trish Doller	\N	1599908441	2012
4751	A Great Reckoning	Louise Penny	\N	1250022134	2016
4752	Sushi for Beginners	Marian Keyes	\N	60555955	2000
4753	Tell Me Your Dreams	Sidney Sheldon	\N	446607207	1998
4754	Day 21	Kass Morgan	\N	316234559	2014
4755	Die Again	Tess Gerritsen	\N	345543858	2014
4756	Einstein's Dreams	Alan Lightman	\N	140007780X	1992
4757	The Affair	Lee Child	\N	593065700	2011
4758	Paradise	Judith McNaught	\N	743474163	1991
4759	The Kitchen House	Kathleen Grissom	\N	1439153663	2010
4760	Azincourt 	Bernard Cornwell	\N	7271212	2008
4761	Night Prey	John Sandford	\N	6478964	1994
4762	Angel Fire	L.A. Weatherly	\N	1409522016	2011
4763	The Mask	Owen  West	 Dean Koontz	425127583	1981
4764	Benediction	Kent Haruf	\N	307959880	2013
4765	The Halfling's Gem	R.A. Salvatore	\N	786938250	1990
4766	The Second Ship	Richard   Phillips	\N	981546269	2006
4767	Liar & Spy	Rebecca Stead	\N	385737432	2012
4768	Make Way for Ducklings	Robert McCloskey	\N	670035386	1941
4769	The Son	Philipp Meyer	\N	62120395	2012
4770	American Pastoral	Philip Roth	\N	99771810	1997
4771	Wall and Piece	Banksy	\N	1844137872	1988
4772	Sult	Knut Hamsun	 George Egerton	486431681	1890
4773	Arcadia	Tom Stoppard	\N	571169341	1993
4774	Wayward	Blake Crouch	\N	1477808701	2013
4775	The Republic of Thieves	Scott Lynch	\N	553804693	2013
4776	Frog and Toad All Year	Arnold Lobel	\N	64440591	1976
4777	Mornings on Horseback	David McCullough	\N	671447548	1981
4778	Arc de Triomphe	Erich Maria Remarque	\N	449912450	1945
4779	Hammered	Kevin Hearne	\N	345522486	2011
4780	The Iron Knight	Julie Kagawa	\N	373210361	2011
4781	The Gnostic Gospels	Elaine Pagels	\N	679724532	1979
4782	Different Seasons	Stephen King	\N	751514624	1982
4783	I is for Innocent	Sue Grafton	\N	449221512	1992
4784	Half the World	Joe Abercrombie	\N	804178429	2015
4785	The Reef	Nora Roberts	\N	051512608X	1998
4786	The Monsters of Templeton	Lauren Groff	\N	434017841	2008
4787	No, David!	David Shannon	\N	590930028	1998
4788	Essays in Love	Alain de Botton	\N	802142400	1993
4789	The Blood of Flowers	Anita Amirrezvani	\N	316065765	2007
4790	Drachenreiter	Cornelia Funke	\N	190444248X	1997
4791	The Lucky One	Nicholas Sparks	\N	446579939	2008
4792	The Icebound Land	John Flanagan	\N	399244565	2005
4793	Queste	Angie Sage	 Mark Zug	60882077	2008
4794	I Do (But I Don't)	Cara Lockwood	\N	743496973	2003
4795	Cold Mountain	Charles Frazier	\N	802142842	1997
4796	The Sleeping Doll	Jeffery Deaver	\N	034083384X	2007
4797	Welcome to Dead House	R.L. Stine	\N	439568471	1992
4798	Memories of Midnight	Sidney Sheldon	\N	446354678	1990
4799	Nantucket Nights	Elin Hilderbrand	\N	312989768	2002
4800	Crossed	Ally Condie	\N	142421715	2011
4801	Billy Budd, Sailor	Herman Melville	\N	1416523723	1924
4802	The Rising	Kelley Armstrong	\N	61797081	2013
4803	Dragonsong 	Anne McCaffrey	\N	141692499X	1976
4804	Concealed in Death	J.D. Robb	\N	039916443X	2014
4805	Harlequin	Bernard Cornwell	\N	60935766	2000
4806	Hero	Perry Moore	\N	1423101952	2007
4807	Halfway to the Grave	Jeaniene Frost	\N	61245089	2007
4808	Sixth Grave on the Edge	Darynda Jones	\N	1250045630	2014
4809	The Lion's Lady	Julie Garwood	\N	067173783X	1988
4810	Twilight and History	Nancy Reagin	\N	470581786	2010
4811	One Tiny Lie	K.A. Tucker	\N	1476740488	2013
4812	Hide and Seek	James Patterson	\N	6498523	1995
4813	Kings Rising	C.S. Pacat	\N	174348495X	2016
4814	The Burning Wire	Jeffery Deaver	\N	1439156336	2010
4815	No Place to Run	Maya Banks	\N	425238199	2010
4816	Heat Lightning	John Sandford	\N	399155279	2008
4817	Bird Box	Josh Malerman	\N	62259652	2014
4818	Love and War 	John Jakes	\N	451200829	1984
4819	The Arrival	Shaun Tan	\N	734406940	2006
4820	Turning Angel	Greg Iles	\N	743454162	2005
4821	Redeemed	P.C. Cast	 Kristin Cast	312594445	2014
4822	Sacred	Dennis Lehane	\N	380726297	1997
4823	One Silent Night	Sherrilyn Kenyon	\N	312947062	2008
4824	Martin the Warrior	Brian Jacques	\N	441001866	1993
4825	The Awakening	Kate Chopin	\N	543898083	1899
4826	Retribution	Sherrilyn Kenyon	\N	312546602	2011
4827	The Burgess Boys	Elizabeth Strout	\N	1400067685	2013
4828	Fates and Furies	Lauren Groff	\N	1594634475	2015
4829	Chanakya's Chant	Ashwin Sanghi	\N	9380658674	2010
4830	A Walk in the Woods	Bill Bryson	\N	307279464	1997
4831	Cinder	Marissa Meyer	\N	312641893	2012
4832	The Beginner's Goodbye	Anne Tyler	\N	307957276	2012
4833	The Burden of Proof	Scott Turow	\N	446677124	1990
4834	Burning For Revenge	John Marsden	\N	439858038	1997
4835	The Pigeon Finds a Hot Dog!	Mo Willems	\N	786818697	2004
4836	Broken for You	Stephanie Kallos	\N	802142109	2004
4837	Ruthless	Sara Shepard	\N	62081861	2011
4838	Eventide	Kent Haruf	\N	375725768	2004
4839	The Gift	Cecelia Ahern	\N	7284977	2008
4840	The Sins of the Father	Jeffrey Archer	\N	1250000971	2012
4841	The Woman Upstairs	Claire Messud	\N	307596907	2013
4842	The Sympathizer	Viet Thanh Nguyen	\N	802123457	2015
4843	Hellboy: Wake the Devil	Mike Mignola	\N	1593070950	1994
4844	False Impression	Jeffrey Archer	\N	312939779	2005
4845	The Best of Me	Nicholas Sparks	\N	446547654	2010
4846	Body Surfing	Anita Shreve	\N	316059854	2007
4847	The Surgeon	Tess Gerritsen	\N	055381706X	2001
4848	Pure	Jennifer L. Armentrout	\N	983157227	2012
4849	The Robe	Lloyd C. Douglas	\N	395957753	1942
4850	The Naturals	Jennifer Lynn Barnes	\N	1423168232	2013
4851	River of Blue Fire	Tad Williams	\N	886778441	1998
4852	The Left Hand of God 	Paul  Hoffman	\N	718155181	2010
4853	Low Country	Anne Rivers Siddons	\N	61093327	1998
4854	Winter Solstice	Rosamunde Pilcher	\N	340752483	2000
4855	The Wicked Will Rise	Danielle  Paige	\N	62280708	2015
4856	Olivia	Ian Falconer	\N	689829531	2000
4857	The Golem's Eye	Jonathan Stroud	\N	786836547	2004
4858	The Shawshank Redemption	Stephen King	\N	896214400	1982
4859	Best Served Cold	Joe Abercrombie	\N	575082453	2009
4860	Perfect	Rachel Joyce	\N	857520660	2013
4861	A Sand County Almanac	Aldo Leopold	\N	195007778	1949
4862	The Heart of a Woman	Maya Angelou	\N	375500723	1981
4863	To Have and Have Not 	Ernest Hemingway	\N	684859238	1937
4864	Vampire, Interrupted	Lynsay Sands	\N	61229776	2008
4865	In Her Shoes	Jennifer Weiner	\N	743495667	2002
4866	Use of Weapons	Iain M. Banks	\N	185723135X	1990
4867	Insurgent	Veronica Roth	\N	7442912	2012
4868	Timbuktu	Paul Auster	\N	312263996	1999
4869	Who Do You Love	Jennifer Weiner	\N	145161781X	2015
4870	Way Station	Clifford D. Simak	\N	20248717	1963
4871	The Mauritius Command	Patrick O'Brian	\N	039330762X	1977
4872	Through Black Spruce	Joseph Boyden	\N	670020575	2008
4873	Fame	Karen Kingsbury	\N	842387439	2005
4874	Something Rotten	Jasper Fforde	\N	014303541X	2004
4875	Size 14 Is Not Fat Either	Meg Cabot	\N	60525126	2006
4876	Truman	David McCullough	\N	671869205	1992
4877	Judas Unchained	Peter F. Hamilton	\N	345461665	2005
4878	The Bone Clocks	David Mitchell	\N	1400065674	2014
4879	Chosen Prey	John Sandford	\N	425182878	2001
4880	Invisible	Paul Auster	\N	805090800	2009
4881	Olive Kitteridge	Elizabeth Strout	\N	140006208X	2008
4882	The Painted Girls	Cathy Marie Buchanan	\N	1594486247	2012
4883	Fantastic Voyage	Isaac Asimov	\N	553275720	1966
4884	Big Sur	Jack Kerouac	 Aram Saroyan	140168125	1962
4885	Foundation	Isaac Asimov	\N	553803719	1951
4886	In a Dark, Dark Wood 	Ruth Ware	\N	1846558913	2015
4887	The Door into Summer	Robert A. Heinlein	\N	345413997	1957
4888	The Wednesday Letters	Jason F. Wright	\N	1590388127	2007
4889	Trading Up	Candace Bushnell	\N	316726192	2003
4890	The Hammer of Thor	Rick Riordan	\N	1423160924	2016
4891	The Wolf Gift	Anne Rice	\N	307595110	2012
4892	Lush Life	Richard Price	\N	374299250	2008
4893	Vision in Silver 	Anne Bishop	\N	045146527X	2015
4894	Pygmy	Chuck Palahniuk	\N	385526342	2009
4895	Vanishing Girls	Lauren Oliver	\N	62224107	2015
4896	Specials	Scott Westerfeld	\N	689865406	2006
4897	Pure	Julianna Baggott	\N	1455503061	2012
4898	The Four Loves	C.S. Lewis	\N	6280897	1960
4899	Vagabond	Bernard Cornwell	\N	60935782	2002
4900	Clouds of Witness	Dorothy L. Sayers	\N	61043532	1926
4901	I, Alex Cross	James Patterson	\N	316018783	2009
4902	You Against Me	Jenny Downham	\N	385613504	2010
4903	Bones of the Hills	Conn Iggulden	\N	7201788	2008
4904	The Fever	Megan Abbott	\N	316231053	2014
4905	Fifth Business	Robertson Davies	\N	141181362	1970
4906	A Theory of Justice	John Rawls	\N	674017722	1971
4907	Beaches	Iris Rainer Dart	\N	60594772	1985
4908	World Without End	Ken Follett	\N	525950079	2007
4909	Creation in Death 	J.D. Robb	\N	142333745X	2007
4910	Void Moon	Michael Connelly	\N	446694258	1999
4911	Tripwire	Lee Child	\N	515128635	1999
4912	Found	Margaret Peterson Haddix	\N	1416954171	2008
4913	Fairest	Gail Carson Levine	\N	60734086	2006
4914	Angelfire	Courtney Allison Moulton	\N	62002325	2011
4915	Syren	Angie Sage	\N	747594155	2009
4916	The Covenant	James A. Michener	\N	749311614	1980
4917	Blowback	Brad Thor	\N	1416505415	2005
4918	The Key to Rebecca	Ken Follett	\N	451207793	1980
4919	The Children's Book	A.S. Byatt	\N	307272095	2009
4920	Hunted	Kevin Hearne	\N	345533631	2013
4921	The High Window	Raymond Chandler	\N	394758269	1942
4922	Never Go Back 	Lee Child	\N	385344341	2013
4923	A Lesson Before Dying	Ernest J. Gaines	\N	375702709	1993
4924	Everlost	Neal Shusterman	\N	689872372	2006
4925	Death of Kings	Bernard Cornwell	\N	7331789	2011
4926	Winter in Madrid	C.J. Sansom	\N	330411985	2006
4927	The Ruins of Gorlan	John Flanagan	\N	142406635	2004
4928	The Luminaries	Eleanor Catton	\N	316074314	2013
4929	The Amber Room	Steve Berry	\N	034548343X	2003
4930	Marked	P.C. Cast	 Kristin Cast	312360266	2007
4931	Picture Perfect	Jodi Picoult	\N	425185508	1995
4932	The Vision	Dean Koontz	\N	425098605	1977
4933	Novecento	Alessandro Baricco	\N	8807813025	1994
4934	Lost in Shangri-la	Mitchell Zuckoff	\N	61988340	2011
4935	Tarzan of the Apes	Edgar Rice Burroughs	\N	809599813	1912
4936	Babbitt	Sinclair Lewis	\N	142640607X	1922
4937	Milkweed	Jerry Spinelli	\N	440420059	2003
4938	Clapton: The Autobiography	Eric Clapton	\N	038551851X	2007
4939	Crow Lake	Mary Lawson	\N	385337639	2002
4940	The High Lord	Trudi Canavan	\N	1841493155	2002
4941	Middlesex	Jeffrey Eugenides	\N	312422156	2002
4942	Ghostgirl	Tonya Hurley	\N	316113573	2008
4943	An Ideal Husband	Oscar Wilde	\N	048641423X	1893
4944	The Last Unicorn	Peter S. Beagle	\N	451450523	1968
4945	Juliet	Anne Fortier	\N	345516109	2010
4946	Virgin River	Robyn Carr	\N	778324907	2007
4947	Of Poseidon	Anna Banks	\N	1250003326	2012
4948	The Good Earth	Pearl S. Buck	\N	1416500189	1931
4949	Destined	Aprilynne Pike	\N	61668125	2012
4950	Secondhand Souls	Christopher Moore	\N	61779784	2015
4951	G is for Gumshoe	Sue Grafton	\N	449000621	1990
4952	When Crickets Cry	Charles Martin	\N	1595540547	2006
4953	The Ghost Bride	Yangsze Choo	\N	62227327	2013
4954	Shadows in Flight	Orson Scott Card	\N	765332000	2011
4955	How to Eat Fried Worms	Thomas Rockwell	\N	440421853	1973
4956	Excavation	James Rollins	\N	038081093X	2000
4957	The Painted Man	Peter V. Brett	\N	345503805	2008
4958	When We Were Orphans	Kazuo Ishiguro	\N	571225403	2000
4959	Scars	Cheryl Rainfield	\N	193481332X	2010
4960	Moloka'i	Alan Brennert	\N	312304358	2003
4961	The Men Who Stare at Goats	Jon Ronson	\N	743270606	2004
4962	Final Jeopardy	Linda Fairstein	\N	671010123	1996
4963	Wake	Lisa McMann	\N	1416953574	2008
4964	Swapping Lives	Jane Green	\N	670034800	2006
4965	Hard Choices	Hillary Rodham Clinton	\N	1476751447	2013
4966	Simple Genius	David Baldacci	\N	446580341	2007
4967	Dog Days	Jeff Kinney	\N	810983915	2009
4968	Farewell, My Lovely	Raymond Chandler	\N	394758277	1940
4969	Crash	J.G. Ballard	\N	312420331	1973
4970	The Camel Club	David Baldacci	\N	446615625	2005
4971	Our Man in Havana	Graham Greene	\N	140184937	1958
4972	The Very Busy Spider 	Eric Carle	\N	399229191	1984
4973	The Casual Vacancy	J.K. Rowling	\N	316228532	2012
4974	Everneath	Brodi Ashton	\N	62071130	2012
4975	Strega Nona	Tomie dePaola	\N	8424133498	1975
4976	Night Mare (Xanth, #6)	Piers Anthony	\N	345418549	1982
4977	Jaws	Peter Benchley	\N	1400064562	1974
4978	Don't Die, My Love	Lurlene McDaniel	\N	553567152	1995
4979	The Talismans of Shannara	Terry Brooks	\N	1857239016	1993
4980	Stones from the River	Ursula Hegi	\N	068484477X	1994
4981	Ball Four	Jim Bouton	\N	20306652	1970
4982	The Dead of the Night	John Marsden	\N	439829119	1994
4983	Infamous	Sherrilyn Kenyon	\N	1250002826	2012
4984	The Exorcist	William Peter Blatty	\N	61007226	1971
4985	Afterwards	Rosamund Lupton	\N	307716546	2011
4986	Dom Casmurro	Machado de Assis	\N	850515033	1899
4987	The Center Cannot Hold	Elyn R. Saks	\N	140130138X	2007
4988	The Life of Elizabeth I	Alison Weir	\N	345425502	1996
4989	Wicked	Sara Shepard	\N	006156608X	2008
4990	Whitethorn Woods	Maeve Binchy	\N	307265781	2006
4991	Vernon God Little	D.B.C. Pierre	\N	571215165	2003
4992	Shopaholic and Baby	Sophie Kinsella	\N	385338708	2007
4993	Black Sun Rising	C.S. Friedman	\N	756403146	1991
4994	Secret Prey	John Sandford	\N	743484207	1998
4995	Vittorio the Vampire	Anne Rice	\N	5559609129	1999
4996	Leaving	Karen Kingsbury	\N	310266289	2011
4997	China Dolls	Lisa See	\N	081299289X	2014
4998	Starter for Ten	David Nicholls	\N	345498127	2003
4999	Imajica	Clive Barker	\N	61053716	1991
5000	Emily Climbs	L.M. Montgomery	\N	553262149	1925
\.


--
-- Data for Name: review_information; Type: TABLE DATA; Schema: public; Owner: weirdjs
--

COPY public.review_information (review_id, book_id, user_id, score, review_date, review_time, review_text) FROM stdin;
1	1	1	4	2019-12-09	23:23:48.022756	Awesome! Would always read again!
12032	962	16	5	2019-12-13	19:46:59.340208	The story is a beautiful story.
3	20	1	3	2019-12-09	23:36:47.946169	I read it at once in the train. It was okay.
4	1	13	3	2019-12-10	08:07:47.035115	I didn't like the protagonist. All the other characters and their plot were awesome. 
5	1	12	2	2019-12-10	08:11:54.424899	Boring story of a boring guy. 
6	2	13	4	2019-12-10	11:37:28.202422	It is very dark and rising.
7	2	1	1	2019-12-10	11:38:35.945574	Boring, lame, almost didn't finished it.
8	3	1	5	2019-12-10	11:40:03.808391	Unicorns are marvelous, especially the black ones!
9	4	1	5	2019-12-10	12:03:39.639285	I love books about robotic topics. This one is a perfect example. I read it 5 times, still wonderful.
10	1	15	4	2019-12-10	13:14:34.988988	Awesome book!
12033	1381	18	3	2019-12-13	19:46:59.349509	It tells us about a beautiful story.
12034	2951	19	3	2019-12-13	19:46:59.352307	The story feels my deepest wish.
12035	3332	17	3	2019-12-13	19:46:59.355193	It is more chocolate.
12036	794	16	5	2019-12-13	19:46:59.357729	The plot requires technical issues.
12037	2594	15	1	2019-12-13	19:46:59.360309	The plot is more chocolate.
12038	1213	13	2	2019-12-13	19:46:59.362822	It believes in my deepest wish.
12039	3323	12	4	2019-12-13	19:46:59.365321	I think this book requires my deepest wish.
12040	296	13	3	2019-12-13	19:46:59.367819	The story is a beautiful story.
12041	4721	18	4	2019-12-13	19:46:59.370244	The female character tells us about technical issues.
12042	4437	19	3	2019-12-13	19:46:59.37255	I wish this book requires just dark.
12043	1795	12	3	2019-12-13	19:46:59.374949	The story requires a beautiful story.
12044	1970	18	1	2019-12-13	19:46:59.377381	I think this book feels my deepest wish.
12046	1212	13	1	2019-12-13	19:46:59.383606	The female character requires my deepest wish.
12047	4215	12	4	2019-12-13	19:46:59.385945	I wish this book believes in my deepest wish.
12048	1412	18	4	2019-12-13	19:46:59.388411	The story is just dark.
12049	839	17	5	2019-12-13	19:46:59.390815	I wish this book believes in more chocolate.
12050	1270	13	3	2019-12-13	19:46:59.393219	It describes just dark.
12051	82	16	3	2019-12-13	19:46:59.395707	The protagonist is just dark.
12052	2678	12	2	2019-12-13	19:46:59.398017	I think this book requires just dark.
12053	1128	19	2	2019-12-13	19:46:59.400458	The female character describes my deepest wish.
12055	4781	13	5	2019-12-13	19:46:59.403984	The protagonist needs just wrong.
12056	969	15	1	2019-12-13	19:46:59.406379	The story requires cold and dump.
12057	2220	19	3	2019-12-13	19:46:59.408694	The female character needs just wrong.
12058	3771	18	4	2019-12-13	19:46:59.411012	I wish this book describes more chocolate.
12059	4607	18	2	2019-12-13	19:46:59.413348	It tells us about my deepest wish.
12060	3375	19	4	2019-12-13	19:46:59.416977	The story wishes more chocolate.
12062	1359	19	3	2019-12-13	19:46:59.420257	I think this book is a breach in humanity.
12063	3490	19	5	2019-12-13	19:46:59.422633	The plot shows us technical issues.
12064	4177	18	1	2019-12-13	19:46:59.425354	I wish this book feels more chocolate.
12065	279	17	4	2019-12-13	19:46:59.428077	I wish this book requires technical issues.
12066	3626	17	5	2019-12-13	19:46:59.430352	The story believes in just dark.
12067	815	13	3	2019-12-13	19:46:59.432694	The plot needs cold and dump.
12068	3068	13	4	2019-12-13	19:46:59.435346	It needs just wrong.
12069	1979	1	3	2019-12-13	19:46:59.438594	The story requires a breach in humanity.
12071	2278	17	1	2019-12-13	19:46:59.442061	The plot tells us about cold and dump.
12074	4229	13	1	2019-12-13	19:46:59.445997	I think this book shows us more chocolate.
12075	3768	19	2	2019-12-13	19:46:59.448295	It tells us about a beautiful story.
12076	1399	16	1	2019-12-13	19:46:59.450571	The plot shows us cold and dump.
12077	1157	1	5	2019-12-13	19:46:59.454279	The female character feels just dark.
12079	816	18	1	2019-12-13	19:46:59.457629	It needs technical issues.
12082	934	13	3	2019-12-13	19:46:59.462665	I wish this book wishes my deepest wish.
12084	2000	18	5	2019-12-13	19:46:59.466374	The protagonist believes in just wrong.
12086	51	13	2	2019-12-13	19:46:59.469337	I wish this book describes a breach in humanity.
12088	2929	19	5	2019-12-13	19:46:59.472383	I wish this book requires more chocolate.
12089	4642	16	5	2019-12-13	19:46:59.474689	It is my deepest wish.
12090	824	1	3	2019-12-13	19:46:59.476887	The plot needs just dark.
12092	4369	12	4	2019-12-13	19:46:59.479953	It wishes just dark.
12093	75	1	1	2019-12-13	19:46:59.482358	It shows us just wrong.
12094	4970	12	1	2019-12-13	19:46:59.484437	I think this book feels a breach in humanity.
12096	1910	1	3	2019-12-13	19:46:59.487323	The story shows us my deepest wish.
12098	1455	17	3	2019-12-13	19:46:59.49034	The story tells us about cold and dump.
12099	3744	15	1	2019-12-13	19:46:59.492558	I think this book shows us cold and dump.
12100	4699	16	3	2019-12-13	19:46:59.494752	I wish this book is technical issues.
12102	626	1	1	2019-12-13	19:46:59.49775	The story tells us about cold and dump.
12105	4909	18	3	2019-12-13	19:46:59.50166	It feels more chocolate.
12107	2606	18	5	2019-12-13	19:46:59.505061	I wish this book believes in a beautiful story.
12108	4133	17	2	2019-12-13	19:46:59.507495	The protagonist feels a breach in humanity.
12110	4050	16	3	2019-12-13	19:46:59.510718	I think this book is my deepest wish.
12111	177	16	4	2019-12-13	19:46:59.513047	I think this book shows us just wrong.
12112	3916	12	3	2019-12-13	19:46:59.515423	The female character believes in my deepest wish.
12113	1451	16	1	2019-12-13	19:46:59.517825	I wish this book describes just wrong.
12116	3736	13	2	2019-12-13	19:46:59.52424	The story believes in a beautiful story.
12118	4740	12	5	2019-12-13	19:46:59.527446	The protagonist shows us just wrong.
12119	2749	15	2	2019-12-13	19:46:59.529787	The story needs technical issues.
12120	1499	18	3	2019-12-13	19:46:59.532214	It believes in just wrong.
12122	2298	19	1	2019-12-13	19:46:59.536346	I think this book is just dark.
12123	2064	17	1	2019-12-13	19:46:59.539353	It feels a breach in humanity.
12125	1322	16	5	2019-12-13	19:46:59.542754	The plot is my deepest wish.
12126	3628	18	1	2019-12-13	19:46:59.545086	The protagonist wishes my deepest wish.
12127	3934	18	3	2019-12-13	19:46:59.547387	The female character tells us about cold and dump.
12128	2711	19	1	2019-12-13	19:46:59.5497	The female character wishes a beautiful story.
12130	2256	18	1	2019-12-13	19:46:59.55352	It tells us about a beautiful story.
12131	3526	15	2	2019-12-13	19:46:59.555979	The protagonist is more chocolate.
12133	1480	18	1	2019-12-13	19:46:59.560703	It wishes technical issues.
12134	191	15	2	2019-12-13	19:46:59.563105	I wish this book believes in just wrong.
12135	4957	16	1	2019-12-13	19:46:59.565704	The protagonist believes in just dark.
12137	2652	18	3	2019-12-13	19:46:59.570353	The plot requires a beautiful story.
12138	2000	17	1	2019-12-13	19:46:59.573104	The female character shows us technical issues.
12139	670	12	1	2019-12-13	19:46:59.575372	I wish this book requires more chocolate.
12140	754	17	2	2019-12-13	19:46:59.577651	The story tells us about just dark.
12142	524	1	4	2019-12-13	19:46:59.580782	The plot wishes a beautiful story.
12143	4898	18	1	2019-12-13	19:46:59.583349	The protagonist needs a beautiful story.
12145	4596	15	5	2019-12-13	19:46:59.588055	I wish this book believes in just wrong.
12146	1009	19	1	2019-12-13	19:46:59.590583	The story believes in cold and dump.
12147	324	17	1	2019-12-13	19:46:59.593045	The protagonist feels just wrong.
12148	316	16	4	2019-12-13	19:46:59.595786	I think this book tells us about more chocolate.
12149	3586	18	5	2019-12-13	19:46:59.598267	It feels a breach in humanity.
12151	2929	15	3	2019-12-13	19:46:59.601616	The story shows us just dark.
12152	4835	18	3	2019-12-13	19:46:59.604519	The female character describes just wrong.
12153	154	19	2	2019-12-13	19:46:59.607383	The protagonist describes my deepest wish.
12155	4046	19	2	2019-12-13	19:46:59.610604	It requires a beautiful story.
12156	3948	17	5	2019-12-13	19:46:59.612975	The story believes in technical issues.
12157	2764	1	5	2019-12-13	19:46:59.615539	It tells us about more chocolate.
12158	1263	1	2	2019-12-13	19:46:59.618042	The female character believes in my deepest wish.
12159	3836	13	1	2019-12-13	19:46:59.620768	I wish this book tells us about more chocolate.
12160	542	12	3	2019-12-13	19:46:59.623699	The story requires more chocolate.
22157	1247	13	4	2019-12-13	22:45:08.191051	The plot wishes more chocolate.
22158	761	1	1	2019-12-13	22:45:08.193933	I think this book shows us a beautiful story.
22159	3142	12	4	2019-12-13	22:45:08.196856	I think this book needs cold and dump.
22160	3311	13	5	2019-12-13	22:45:08.19971	I wish this book is just dark.
22161	3176	17	4	2019-12-13	22:45:08.202668	It feels a beautiful story.
22162	3175	12	2	2019-12-13	22:45:08.205417	The protagonist shows us just wrong.
22163	3408	15	4	2019-12-13	22:45:08.208373	The story shows us my deepest wish.
22164	1274	13	4	2019-12-13	22:45:08.21121	I think this book needs my deepest wish.
22165	52	15	4	2019-12-13	22:45:08.214179	The protagonist requires more chocolate.
22166	4463	15	3	2019-12-13	22:45:08.217174	It feels a breach in humanity.
22167	1362	17	5	2019-12-13	22:45:08.220384	The story believes in technical issues.
22169	4855	18	1	2019-12-13	22:45:08.225553	I wish this book feels a beautiful story.
22170	3696	16	2	2019-12-13	22:45:08.228756	The protagonist requires a breach in humanity.
22171	172	15	2	2019-12-13	22:45:08.231942	It requires technical issues.
22173	4147	13	4	2019-12-13	22:45:08.236974	The story describes cold and dump.
22175	973	16	3	2019-12-13	22:45:08.246748	The female character requires technical issues.
22176	1591	18	1	2019-12-13	22:45:08.249693	I wish this book feels just wrong.
22177	4341	17	5	2019-12-13	22:45:08.252567	It needs cold and dump.
22178	3659	17	3	2019-12-13	22:45:08.255379	It wishes cold and dump.
22179	3135	19	2	2019-12-13	22:45:08.25792	The protagonist needs technical issues.
22180	4794	19	4	2019-12-13	22:45:08.260642	The female character believes in just dark.
22181	3626	19	3	2019-12-13	22:45:08.262996	The protagonist wishes just wrong.
22182	256	16	2	2019-12-13	22:45:08.265781	The female character feels just dark.
22183	2358	16	2	2019-12-13	22:45:08.268785	The story tells us about a beautiful story.
22184	199	13	5	2019-12-13	22:45:08.271726	It believes in cold and dump.
22185	1981	12	4	2019-12-13	22:45:08.274582	The protagonist feels more chocolate.
22186	4088	17	1	2019-12-13	22:45:08.277677	The female character shows us my deepest wish.
22187	3422	13	5	2019-12-13	22:45:08.280472	It describes just wrong.
22188	2738	1	4	2019-12-13	22:45:08.283161	I think this book feels more chocolate.
22189	2410	1	3	2019-12-13	22:45:08.286104	The plot requires more chocolate.
22191	886	16	5	2019-12-13	22:45:08.29015	I wish this book feels a beautiful story.
22192	2711	16	1	2019-12-13	22:45:08.292664	I wish this book feels just dark.
22193	2406	16	4	2019-12-13	22:45:08.295114	I wish this book wishes technical issues.
22194	2751	13	4	2019-12-13	22:45:08.297429	I wish this book feels just dark.
22195	2984	13	2	2019-12-13	22:45:08.299982	The protagonist tells us about my deepest wish.
22196	4585	18	4	2019-12-13	22:45:08.302448	The plot describes more chocolate.
22197	2421	1	2	2019-12-13	22:45:08.304779	I think this book describes technical issues.
22198	1301	17	2	2019-12-13	22:45:08.307074	The protagonist shows us more chocolate.
22199	3767	15	4	2019-12-13	22:45:08.30937	I wish this book requires just wrong.
22200	814	12	1	2019-12-13	22:45:08.31191	The story wishes a beautiful story.
22202	2106	15	5	2019-12-13	22:45:08.315406	The protagonist believes in my deepest wish.
22204	1387	1	5	2019-12-13	22:45:08.318639	The protagonist shows us a breach in humanity.
22205	620	17	3	2019-12-13	22:45:08.320923	The story wishes more chocolate.
22208	1307	18	2	2019-12-13	22:45:08.325683	The story requires just dark.
22209	3466	16	3	2019-12-13	22:45:08.32798	It is a beautiful story.
22210	3294	18	1	2019-12-13	22:45:08.330245	The plot shows us just wrong.
22211	4645	15	4	2019-12-13	22:45:08.332379	It believes in my deepest wish.
22212	4868	18	1	2019-12-13	22:45:08.334645	The plot feels a beautiful story.
22213	1421	12	2	2019-12-13	22:45:08.337159	It wishes just wrong.
22214	2590	16	4	2019-12-13	22:45:08.339387	I think this book believes in more chocolate.
22215	2706	18	3	2019-12-13	22:45:08.3417	The protagonist tells us about a beautiful story.
22216	295	1	3	2019-12-13	22:45:08.343899	I wish this book is my deepest wish.
22217	2993	17	1	2019-12-13	22:45:08.346032	It wishes more chocolate.
22218	319	18	5	2019-12-13	22:45:08.348354	The story is just dark.
22219	4954	12	5	2019-12-13	22:45:08.355467	It believes in technical issues.
22220	2007	1	4	2019-12-13	22:45:08.359154	The protagonist describes technical issues.
22221	1538	12	4	2019-12-13	22:45:08.364483	The story shows us technical issues.
22222	3113	15	4	2019-12-13	22:45:08.369753	The protagonist tells us about a breach in humanity.
22223	2833	1	5	2019-12-13	22:45:08.375305	The protagonist tells us about my deepest wish.
22224	2700	16	4	2019-12-13	22:45:08.38156	It shows us my deepest wish.
22225	3101	1	4	2019-12-13	22:45:08.385235	I think this book feels technical issues.
22226	836	12	5	2019-12-13	22:45:08.389895	The plot tells us about just dark.
22227	3761	15	5	2019-12-13	22:45:08.394687	The female character wishes more chocolate.
22228	4471	16	4	2019-12-13	22:45:08.399429	The story requires cold and dump.
22230	1362	15	2	2019-12-13	22:45:08.402671	The female character believes in a breach in humanity.
22231	1110	15	3	2019-12-13	22:45:08.404941	I think this book believes in cold and dump.
22232	4847	13	3	2019-12-13	22:45:08.407231	The story wishes cold and dump.
22233	3961	18	5	2019-12-13	22:45:08.409504	The story wishes a breach in humanity.
22234	4245	1	2	2019-12-13	22:45:08.411743	I wish this book needs more chocolate.
22235	609	13	1	2019-12-13	22:45:08.414008	I think this book requires more chocolate.
22237	2520	17	4	2019-12-13	22:45:08.417232	The protagonist believes in a breach in humanity.
22238	3728	17	4	2019-12-13	22:45:08.419542	The female character is just wrong.
22239	3704	1	3	2019-12-13	22:45:08.421797	The protagonist describes technical issues.
22240	4871	1	1	2019-12-13	22:45:08.424061	The female character shows us technical issues.
22241	3154	1	3	2019-12-13	22:45:08.426308	The plot requires just wrong.
22243	1715	13	4	2019-12-13	22:45:08.429476	The protagonist is my deepest wish.
22244	2273	16	1	2019-12-13	22:45:08.431757	The plot tells us about my deepest wish.
22245	2104	13	5	2019-12-13	22:45:08.434193	The plot requires my deepest wish.
22246	1792	16	4	2019-12-13	22:45:08.436554	The protagonist believes in technical issues.
22247	1838	15	1	2019-12-13	22:45:08.439058	The protagonist requires just dark.
22248	541	15	5	2019-12-13	22:45:08.441814	I wish this book is a breach in humanity.
22249	762	12	4	2019-12-13	22:45:08.444359	The story tells us about more chocolate.
22250	4758	18	1	2019-12-13	22:45:08.44683	I wish this book believes in a breach in humanity.
22251	3103	15	3	2019-12-13	22:45:08.449533	The protagonist requires more chocolate.
22252	1783	13	1	2019-12-13	22:45:08.451805	The female character describes technical issues.
22253	270	12	4	2019-12-13	22:45:08.454688	The plot wishes just dark.
22257	60	17	2	2019-12-13	22:45:08.45979	The plot shows us more chocolate.
22258	4390	18	3	2019-12-13	22:45:08.46239	It is just wrong.
22259	1663	19	2	2019-12-13	22:45:08.464916	The female character needs my deepest wish.
22260	609	16	5	2019-12-13	22:45:08.467413	I wish this book tells us about a breach in humanity.
22261	2389	19	5	2019-12-13	22:45:08.469835	I wish this book requires a breach in humanity.
22263	3553	12	2	2019-12-13	22:45:08.474623	The female character describes a beautiful story.
22264	2792	17	4	2019-12-13	22:45:08.477214	I think this book is technical issues.
22265	3551	18	3	2019-12-13	22:45:08.47988	The plot is just dark.
22266	2745	16	2	2019-12-13	22:45:08.482507	The protagonist wishes my deepest wish.
22267	4606	1	4	2019-12-13	22:45:08.485107	The story shows us just wrong.
22268	1114	1	2	2019-12-13	22:45:08.487677	The story feels a breach in humanity.
22269	2447	1	5	2019-12-13	22:45:08.489949	It requires just wrong.
22270	3341	16	4	2019-12-13	22:45:08.492249	The plot believes in just dark.
22271	1457	12	1	2019-12-13	22:45:08.494523	The protagonist wishes just wrong.
22273	4248	18	4	2019-12-13	22:45:08.498072	The plot describes technical issues.
22274	2727	1	2	2019-12-13	22:45:08.500454	The plot requires technical issues.
22275	1334	1	3	2019-12-13	22:45:08.502754	The plot is a breach in humanity.
22276	2146	19	5	2019-12-13	22:45:08.505153	I wish this book wishes my deepest wish.
22277	2362	15	1	2019-12-13	22:45:08.507608	I think this book believes in more chocolate.
22278	4907	1	3	2019-12-13	22:45:08.510191	I think this book tells us about more chocolate.
22279	4652	12	4	2019-12-13	22:45:08.512485	I think this book needs a breach in humanity.
22280	3446	16	1	2019-12-13	22:45:08.514701	The protagonist describes a breach in humanity.
22281	13	16	2	2019-12-13	22:45:08.516986	The story tells us about more chocolate.
22283	2801	17	3	2019-12-13	22:45:08.520689	The story believes in a breach in humanity.
22284	3978	16	4	2019-12-13	22:45:08.52346	The female character is a breach in humanity.
22285	2819	18	1	2019-12-13	22:45:08.525687	The story is more chocolate.
22286	2049	16	4	2019-12-13	22:45:08.527931	I wish this book requires just dark.
22287	2851	18	3	2019-12-13	22:45:08.530359	I think this book believes in a breach in humanity.
22288	4166	12	4	2019-12-13	22:45:08.533126	The female character describes my deepest wish.
22289	2252	16	3	2019-12-13	22:45:08.537698	The story shows us just dark.
22290	4198	13	4	2019-12-13	22:45:08.540044	The plot needs technical issues.
22291	1137	12	1	2019-12-13	22:45:08.542412	The story believes in a breach in humanity.
22292	4430	15	5	2019-12-13	22:45:08.544788	The plot feels a beautiful story.
22294	3920	15	5	2019-12-13	22:45:08.548704	The female character tells us about a beautiful story.
22295	3820	15	1	2019-12-13	22:45:08.551103	I wish this book needs technical issues.
22296	4798	1	4	2019-12-13	22:45:08.553345	I wish this book requires just wrong.
22297	1520	19	3	2019-12-13	22:45:08.555655	The protagonist shows us cold and dump.
22298	4448	18	4	2019-12-13	22:45:08.558044	The protagonist requires a breach in humanity.
22299	3219	13	5	2019-12-13	22:45:08.560358	The protagonist describes a breach in humanity.
22301	4458	18	3	2019-12-13	22:45:08.56362	The protagonist describes my deepest wish.
22302	3944	15	4	2019-12-13	22:45:08.566004	It shows us more chocolate.
22303	1503	13	3	2019-12-13	22:45:08.568409	I think this book believes in more chocolate.
22304	1315	12	1	2019-12-13	22:45:08.570738	I think this book describes more chocolate.
22306	3590	17	5	2019-12-13	22:45:08.574196	The protagonist describes technical issues.
22307	1228	16	3	2019-12-13	22:45:08.57676	The female character wishes a beautiful story.
22312	4129	15	4	2019-12-13	22:45:08.582505	The plot shows us a breach in humanity.
22314	4720	18	5	2019-12-13	22:45:08.587882	I wish this book is technical issues.
22315	1753	12	4	2019-12-13	22:45:08.590133	It believes in technical issues.
22316	1280	15	1	2019-12-13	22:45:08.592386	I think this book describes just dark.
22317	4361	12	1	2019-12-13	22:45:08.594654	The plot tells us about my deepest wish.
22318	3904	16	1	2019-12-13	22:45:08.596975	It believes in a breach in humanity.
22319	4584	19	2	2019-12-13	22:45:08.599316	I wish this book shows us my deepest wish.
22320	1501	19	5	2019-12-13	22:45:08.601808	The plot wishes technical issues.
22321	4658	1	1	2019-12-13	22:45:08.604443	The protagonist tells us about just dark.
22322	4042	13	3	2019-12-13	22:45:08.607125	The plot believes in my deepest wish.
22325	1393	1	3	2019-12-13	22:45:08.612564	The plot needs a breach in humanity.
22327	1918	17	1	2019-12-13	22:45:08.617025	It requires technical issues.
22328	210	1	5	2019-12-13	22:45:08.619874	The protagonist wishes technical issues.
22331	2322	17	1	2019-12-13	22:45:08.625994	It describes my deepest wish.
22332	2910	12	1	2019-12-13	22:45:08.629042	I wish this book wishes more chocolate.
22334	4421	17	4	2019-12-13	22:45:08.633087	The protagonist feels a beautiful story.
22335	2330	15	5	2019-12-13	22:45:08.635545	The story requires a beautiful story.
22339	3332	16	2	2019-12-13	22:45:08.641532	The story wishes a breach in humanity.
22340	129	17	1	2019-12-13	22:45:08.644308	I think this book tells us about cold and dump.
22342	3349	18	5	2019-12-13	22:45:08.648821	It shows us more chocolate.
22343	4532	15	2	2019-12-13	22:45:08.651562	The protagonist believes in a breach in humanity.
22344	3230	12	1	2019-12-13	22:45:08.65438	The story believes in just dark.
22345	3321	13	2	2019-12-13	22:45:08.65709	The female character is a beautiful story.
22346	2031	13	2	2019-12-13	22:45:08.659684	I think this book believes in more chocolate.
22348	2902	19	5	2019-12-13	22:45:08.663559	The female character tells us about a beautiful story.
22349	1171	17	4	2019-12-13	22:45:08.666154	The plot tells us about more chocolate.
22350	2155	19	4	2019-12-13	22:45:08.668618	The female character tells us about cold and dump.
22351	2085	1	3	2019-12-13	22:45:08.671617	The story tells us about more chocolate.
22352	2635	18	4	2019-12-13	22:45:08.674343	The female character wishes a breach in humanity.
22353	2029	17	4	2019-12-13	22:45:08.677382	It is cold and dump.
22354	4332	16	3	2019-12-13	22:45:08.683995	It tells us about cold and dump.
22355	3134	16	3	2019-12-13	22:45:08.689219	The female character requires technical issues.
22357	2027	19	5	2019-12-13	22:45:08.694954	The plot tells us about technical issues.
22359	1589	15	2	2019-12-13	22:45:08.701326	The story describes my deepest wish.
22362	696	18	3	2019-12-13	22:45:08.707521	The protagonist shows us my deepest wish.
22363	2945	16	5	2019-12-13	22:45:08.710168	I think this book describes a beautiful story.
22365	3359	13	1	2019-12-13	22:45:08.714658	The protagonist describes a beautiful story.
22367	3708	13	3	2019-12-13	22:45:08.718731	I think this book requires more chocolate.
22368	3032	18	3	2019-12-13	22:45:08.721528	The plot describes just wrong.
22369	959	15	1	2019-12-13	22:45:08.724238	The story describes cold and dump.
22372	3609	13	2	2019-12-13	22:45:08.730585	It is cold and dump.
22373	2680	19	5	2019-12-13	22:45:08.733451	I think this book is just wrong.
22375	752	13	3	2019-12-13	22:45:08.737745	I wish this book shows us just wrong.
22376	1842	15	4	2019-12-13	22:45:08.740796	The protagonist wishes just dark.
22379	3486	13	2	2019-12-13	22:45:08.747242	The plot is a beautiful story.
22380	774	13	4	2019-12-13	22:45:08.750286	The protagonist is my deepest wish.
22381	4773	17	5	2019-12-13	22:45:08.753512	It requires just dark.
22382	3399	1	5	2019-12-13	22:45:08.756264	The protagonist requires just dark.
22385	480	12	4	2019-12-13	22:45:08.762115	The story tells us about just wrong.
22386	1387	18	3	2019-12-13	22:45:08.765132	I wish this book feels my deepest wish.
22387	1696	1	4	2019-12-13	22:45:08.768246	The protagonist shows us my deepest wish.
22388	2450	13	3	2019-12-13	22:45:08.77133	The plot shows us just dark.
22389	4052	13	4	2019-12-13	22:45:08.774394	The protagonist shows us my deepest wish.
22391	4335	1	1	2019-12-13	22:45:08.77941	I think this book wishes more chocolate.
22392	1631	17	3	2019-12-13	22:45:08.782493	The plot wishes a beautiful story.
22393	4332	13	2	2019-12-13	22:45:08.785467	The plot is technical issues.
22394	3872	12	4	2019-12-13	22:45:08.788623	The plot needs a beautiful story.
22396	2940	19	1	2019-12-13	22:45:08.794158	The story believes in more chocolate.
22397	1825	17	1	2019-12-13	22:45:08.797581	I wish this book needs technical issues.
22398	1326	13	2	2019-12-13	22:45:08.800761	It describes a breach in humanity.
22399	4295	19	3	2019-12-13	22:45:08.803714	The female character believes in cold and dump.
22400	3616	17	1	2019-12-13	22:45:08.806634	I think this book shows us just wrong.
22402	3453	12	1	2019-12-13	22:45:08.811477	The plot tells us about my deepest wish.
22403	421	18	2	2019-12-13	22:45:08.814383	The female character tells us about more chocolate.
22404	306	1	4	2019-12-13	22:45:08.817281	It describes a breach in humanity.
22405	3282	15	5	2019-12-13	22:45:08.825328	The female character believes in technical issues.
22406	341	12	3	2019-12-13	22:45:08.831743	I wish this book needs just wrong.
22407	2427	13	4	2019-12-13	22:45:08.837392	The female character wishes a breach in humanity.
22409	4459	17	1	2019-12-13	22:45:08.845944	The protagonist describes just wrong.
22410	1370	12	4	2019-12-13	22:45:08.848977	It believes in just dark.
22411	563	13	3	2019-12-13	22:45:08.851842	The plot is a breach in humanity.
22412	4653	17	5	2019-12-13	22:45:08.854636	The plot shows us just dark.
22413	450	1	3	2019-12-13	22:45:08.858083	The protagonist tells us about more chocolate.
22414	3063	15	2	2019-12-13	22:45:08.8608	I wish this book believes in a breach in humanity.
22416	4617	13	5	2019-12-13	22:45:08.864394	It is my deepest wish.
22418	513	1	3	2019-12-13	22:45:08.868214	I wish this book needs my deepest wish.
22420	4135	12	4	2019-12-13	22:45:08.872472	It tells us about technical issues.
22421	2458	19	5	2019-12-13	22:45:08.875092	The female character describes cold and dump.
22422	328	13	4	2019-12-13	22:45:08.877419	I think this book is a breach in humanity.
22424	3052	15	3	2019-12-13	22:45:08.881024	It describes cold and dump.
22425	4600	12	4	2019-12-13	22:45:08.88369	I think this book is a breach in humanity.
22426	255	12	1	2019-12-13	22:45:08.886152	The protagonist feels a breach in humanity.
22427	3748	12	1	2019-12-13	22:45:08.888534	The plot describes more chocolate.
22428	2142	12	5	2019-12-13	22:45:08.891204	The plot feels more chocolate.
22429	1479	16	2	2019-12-13	22:45:08.895213	I think this book tells us about just wrong.
22430	3130	12	2	2019-12-13	22:45:08.89763	I wish this book shows us a beautiful story.
22431	3674	12	5	2019-12-13	22:45:08.899789	I wish this book is a beautiful story.
22433	2324	12	5	2019-12-13	22:45:08.902927	I wish this book describes just wrong.
22435	3518	15	4	2019-12-13	22:45:08.906419	The female character tells us about a beautiful story.
22436	2396	13	2	2019-12-13	22:45:08.909184	I wish this book describes cold and dump.
22437	1518	17	5	2019-12-13	22:45:08.911473	It needs more chocolate.
22438	2067	13	3	2019-12-13	22:45:08.913599	I wish this book describes a breach in humanity.
22439	1190	16	2	2019-12-13	22:45:08.915806	The protagonist believes in a breach in humanity.
22440	3703	18	1	2019-12-13	22:45:08.918601	The story requires just dark.
22442	145	17	4	2019-12-13	22:45:08.921774	I wish this book believes in just wrong.
22443	2329	12	5	2019-12-13	22:45:08.924404	The plot believes in technical issues.
22444	2726	13	2	2019-12-13	22:45:08.926831	I wish this book requires technical issues.
22445	3889	17	4	2019-12-13	22:45:08.929094	The story tells us about a beautiful story.
22447	4377	1	3	2019-12-13	22:45:08.932547	The female character requires more chocolate.
22448	1693	16	4	2019-12-13	22:45:08.934839	The plot describes a beautiful story.
22449	1690	1	2	2019-12-13	22:45:08.936998	The story tells us about just wrong.
22450	2728	17	5	2019-12-13	22:45:08.93957	The female character describes more chocolate.
22452	2149	1	4	2019-12-13	22:45:08.943486	It tells us about a breach in humanity.
22454	1001	1	5	2019-12-13	22:45:08.946641	I think this book is a breach in humanity.
22455	2757	15	1	2019-12-13	22:45:08.948915	I think this book requires technical issues.
22456	2191	13	1	2019-12-13	22:45:08.951315	The female character needs more chocolate.
22457	1222	13	5	2019-12-13	22:45:08.953691	The story describes a beautiful story.
22458	1908	16	3	2019-12-13	22:45:08.955879	The plot tells us about technical issues.
22460	3973	17	3	2019-12-13	22:45:08.959905	The protagonist wishes more chocolate.
22461	800	12	3	2019-12-13	22:45:08.962195	The plot is cold and dump.
22462	3536	12	5	2019-12-13	22:45:08.96433	The protagonist describes cold and dump.
22463	271	15	1	2019-12-13	22:45:08.966517	I think this book tells us about a breach in humanity.
22464	4113	19	5	2019-12-13	22:45:08.968722	The protagonist feels my deepest wish.
22467	285	16	4	2019-12-13	22:45:08.972503	The story feels cold and dump.
22468	2997	18	5	2019-12-13	22:45:08.979698	The protagonist shows us technical issues.
22469	294	15	4	2019-12-13	22:45:08.985747	The female character needs just wrong.
22470	227	12	3	2019-12-13	22:45:08.990988	The story believes in a breach in humanity.
22471	216	12	2	2019-12-13	22:45:08.997877	I wish this book is just wrong.
22472	2541	19	1	2019-12-13	22:45:09.001619	I think this book needs cold and dump.
22473	685	19	3	2019-12-13	22:45:09.011242	The female character requires just wrong.
22474	4473	18	4	2019-12-13	22:45:09.017503	I think this book requires technical issues.
22475	44	13	4	2019-12-13	22:45:09.02271	The story feels technical issues.
22476	3475	15	5	2019-12-13	22:45:09.028077	The plot requires technical issues.
22477	3894	19	5	2019-12-13	22:45:09.031622	The plot requires a beautiful story.
22478	2322	15	4	2019-12-13	22:45:09.036332	The story requires my deepest wish.
22479	4919	16	5	2019-12-13	22:45:09.038792	I think this book requires a breach in humanity.
22480	3686	16	5	2019-12-13	22:45:09.041345	The plot needs cold and dump.
22481	4654	12	4	2019-12-13	22:45:09.044108	It is just wrong.
22482	4150	1	5	2019-12-13	22:45:09.046763	I wish this book needs technical issues.
22483	4708	13	4	2019-12-13	22:45:09.049289	I think this book describes technical issues.
22484	3756	12	2	2019-12-13	22:45:09.051747	The story shows us my deepest wish.
22486	1456	18	1	2019-12-13	22:45:09.055051	The story tells us about a breach in humanity.
22487	1209	18	2	2019-12-13	22:45:09.060766	The plot feels cold and dump.
22488	1564	1	2	2019-12-13	22:45:09.066093	I wish this book is more chocolate.
22489	1422	17	1	2019-12-13	22:45:09.071726	The plot believes in cold and dump.
22491	2180	19	3	2019-12-13	22:45:09.078119	I wish this book feels technical issues.
22492	3988	16	1	2019-12-13	22:45:09.082753	I think this book shows us a beautiful story.
22493	1701	18	1	2019-12-13	22:45:09.087846	The story is more chocolate.
22494	527	13	5	2019-12-13	22:45:09.090263	I think this book believes in a beautiful story.
22495	4430	19	1	2019-12-13	22:45:09.093064	I think this book tells us about more chocolate.
22496	4329	16	2	2019-12-13	22:45:09.095853	The protagonist believes in just wrong.
22497	1183	13	4	2019-12-13	22:45:09.098411	The plot shows us just wrong.
22498	2964	12	1	2019-12-13	22:45:09.10199	It feels just wrong.
22499	3709	17	2	2019-12-13	22:45:09.104597	I wish this book shows us my deepest wish.
22500	2686	13	4	2019-12-13	22:45:09.107534	The plot shows us my deepest wish.
22501	682	18	2	2019-12-13	22:45:09.11033	I think this book wishes a breach in humanity.
22502	1399	12	3	2019-12-13	22:45:09.112756	I wish this book needs a beautiful story.
22503	3844	1	1	2019-12-13	22:45:09.117197	The story believes in just dark.
22504	4871	15	1	2019-12-13	22:45:09.119685	The plot shows us a breach in humanity.
22505	3723	1	3	2019-12-13	22:45:09.122104	I think this book believes in a breach in humanity.
22506	2582	19	1	2019-12-13	22:45:09.124536	The story needs a beautiful story.
22507	3206	16	2	2019-12-13	22:45:09.12732	The plot tells us about a breach in humanity.
22508	1367	19	3	2019-12-13	22:45:09.13263	The plot tells us about cold and dump.
22510	434	19	1	2019-12-13	22:45:09.136082	It tells us about just wrong.
22512	119	12	4	2019-12-13	22:45:09.14036	I wish this book tells us about technical issues.
22513	1053	15	5	2019-12-13	22:45:09.142651	The plot wishes technical issues.
22514	4690	1	1	2019-12-13	22:45:09.145633	The story believes in just wrong.
22515	3075	13	1	2019-12-13	22:45:09.147983	The protagonist tells us about technical issues.
22516	2479	19	5	2019-12-13	22:45:09.150216	I think this book is a beautiful story.
22517	498	13	4	2019-12-13	22:45:09.152438	It feels technical issues.
22518	1888	19	5	2019-12-13	22:45:09.154561	I wish this book feels technical issues.
22519	3151	18	1	2019-12-13	22:45:09.156769	The female character describes my deepest wish.
22520	713	17	1	2019-12-13	22:45:09.158981	The story believes in more chocolate.
22521	3795	12	5	2019-12-13	22:45:09.161429	I wish this book believes in more chocolate.
22522	3427	17	2	2019-12-13	22:45:09.163746	I think this book is cold and dump.
22523	1014	12	5	2019-12-13	22:45:09.165965	The protagonist believes in my deepest wish.
22524	3856	13	4	2019-12-13	22:45:09.168197	It describes cold and dump.
22525	3475	19	2	2019-12-13	22:45:09.170378	I think this book shows us cold and dump.
22526	333	17	1	2019-12-13	22:45:09.172512	I think this book shows us cold and dump.
22527	350	12	1	2019-12-13	22:45:09.174612	The plot tells us about more chocolate.
22528	3454	19	2	2019-12-13	22:45:09.176931	I think this book needs a breach in humanity.
22531	2917	19	5	2019-12-13	22:45:09.183879	It tells us about technical issues.
22535	3221	18	5	2019-12-13	22:45:09.189662	It wishes just wrong.
22536	1554	19	2	2019-12-13	22:45:09.19236	I wish this book shows us cold and dump.
22538	1468	15	5	2019-12-13	22:45:09.197144	I wish this book believes in a breach in humanity.
22539	4668	1	5	2019-12-13	22:45:09.199955	I think this book requires more chocolate.
22540	1424	1	2	2019-12-13	22:45:09.202696	The protagonist wishes a beautiful story.
22541	2011	16	4	2019-12-13	22:45:09.205206	I think this book believes in just wrong.
22543	2586	16	2	2019-12-13	22:45:09.208979	The plot shows us cold and dump.
22544	1202	16	5	2019-12-13	22:45:09.21151	The protagonist is cold and dump.
22545	3211	17	2	2019-12-13	22:45:09.214017	The protagonist needs cold and dump.
22547	663	19	5	2019-12-13	22:45:09.218142	It describes my deepest wish.
22548	966	19	3	2019-12-13	22:45:09.220871	The protagonist describes just dark.
22552	3375	18	5	2019-12-13	22:45:09.228096	I wish this book feels my deepest wish.
22553	2198	17	2	2019-12-13	22:45:09.230842	I think this book tells us about cold and dump.
22554	1976	17	2	2019-12-13	22:45:09.233743	I think this book feels cold and dump.
22555	1568	1	3	2019-12-13	22:45:09.23648	I wish this book feels cold and dump.
22557	787	15	1	2019-12-13	22:45:09.240838	I think this book needs my deepest wish.
22558	544	15	3	2019-12-13	22:45:09.243847	The female character is more chocolate.
22559	4285	17	2	2019-12-13	22:45:09.246802	The protagonist shows us my deepest wish.
22560	1281	13	2	2019-12-13	22:45:09.249739	The story needs a breach in humanity.
22561	443	1	3	2019-12-13	22:45:09.252645	The protagonist believes in more chocolate.
22562	648	15	3	2019-12-13	22:45:09.260333	I think this book describes a beautiful story.
22563	4128	15	1	2019-12-13	22:45:09.264912	The plot requires just dark.
22564	995	1	4	2019-12-13	22:45:09.269713	The female character tells us about just dark.
22565	273	16	2	2019-12-13	22:45:09.274447	The female character requires my deepest wish.
22566	4646	15	5	2019-12-13	22:45:09.279164	I wish this book believes in just wrong.
22568	274	17	4	2019-12-13	22:45:09.291536	I think this book believes in my deepest wish.
22569	4161	19	2	2019-12-13	22:45:09.294538	I think this book shows us a beautiful story.
22570	2704	16	4	2019-12-13	22:45:09.297334	I wish this book believes in more chocolate.
22571	524	13	3	2019-12-13	22:45:09.300343	I think this book is just dark.
22572	1790	15	4	2019-12-13	22:45:09.303455	I think this book feels just wrong.
22573	3780	16	3	2019-12-13	22:45:09.305929	The female character feels cold and dump.
22575	2770	12	1	2019-12-13	22:45:09.309126	I think this book is cold and dump.
22576	3119	19	4	2019-12-13	22:45:09.311488	The plot believes in just wrong.
22577	3386	1	3	2019-12-13	22:45:09.313804	The protagonist is a breach in humanity.
22578	3382	1	4	2019-12-13	22:45:09.316274	The female character requires technical issues.
22580	3485	18	3	2019-12-13	22:45:09.319787	The plot describes my deepest wish.
22581	781	12	1	2019-12-13	22:45:09.32224	The female character wishes just wrong.
22582	878	19	3	2019-12-13	22:45:09.324541	The plot believes in cold and dump.
22584	3026	18	1	2019-12-13	22:45:09.327862	The plot wishes more chocolate.
22585	1159	15	3	2019-12-13	22:45:09.330086	I think this book requires just wrong.
22586	3162	16	2	2019-12-13	22:45:09.332809	The plot needs a beautiful story.
22588	4161	1	4	2019-12-13	22:45:09.336876	The plot wishes cold and dump.
22589	2240	13	4	2019-12-13	22:45:09.339143	The protagonist describes cold and dump.
22590	3817	18	5	2019-12-13	22:45:09.341393	The plot describes just wrong.
22591	4359	1	4	2019-12-13	22:45:09.343543	I wish this book is a breach in humanity.
22593	497	18	4	2019-12-13	22:45:09.346616	The story requires technical issues.
22594	941	13	5	2019-12-13	22:45:09.3493	The protagonist is my deepest wish.
22595	828	19	3	2019-12-13	22:45:09.351709	The plot shows us just dark.
22596	2695	16	4	2019-12-13	22:45:09.353998	It wishes technical issues.
22597	2764	17	3	2019-12-13	22:45:09.356165	The female character feels more chocolate.
22598	1659	17	3	2019-12-13	22:45:09.358238	I think this book feels technical issues.
22599	3250	19	5	2019-12-13	22:45:09.360359	It believes in technical issues.
22601	3685	18	3	2019-12-13	22:45:09.363217	It believes in a beautiful story.
22602	3936	19	2	2019-12-13	22:45:09.365468	I wish this book needs a beautiful story.
22603	2216	15	1	2019-12-13	22:45:09.367838	I wish this book shows us just dark.
22604	2829	15	1	2019-12-13	22:45:09.370087	I wish this book shows us cold and dump.
22605	975	19	5	2019-12-13	22:45:09.372203	The female character tells us about a breach in humanity.
22607	4704	12	1	2019-12-13	22:45:09.37519	The protagonist needs my deepest wish.
22608	511	1	2	2019-12-13	22:45:09.377421	It feels more chocolate.
22609	2885	12	2	2019-12-13	22:45:09.37955	I think this book feels my deepest wish.
22610	1853	19	5	2019-12-13	22:45:09.381811	It believes in a breach in humanity.
22611	3687	15	3	2019-12-13	22:45:09.384171	I think this book tells us about cold and dump.
22612	2868	19	2	2019-12-13	22:45:09.386414	I wish this book describes technical issues.
22613	1572	12	1	2019-12-13	22:45:09.38856	The protagonist believes in technical issues.
22615	2498	12	3	2019-12-13	22:45:09.391454	The story needs just wrong.
22616	2509	1	4	2019-12-13	22:45:09.393606	It requires cold and dump.
22617	2827	1	1	2019-12-13	22:45:09.395653	It shows us just wrong.
22618	1930	15	4	2019-12-13	22:45:09.397755	The female character describes my deepest wish.
22619	1545	16	2	2019-12-13	22:45:09.400016	The protagonist requires a breach in humanity.
22620	1060	13	2	2019-12-13	22:45:09.402387	I wish this book describes my deepest wish.
22621	4076	12	5	2019-12-13	22:45:09.404515	The story wishes a breach in humanity.
22622	2992	12	5	2019-12-13	22:45:09.406559	I think this book feels a beautiful story.
22623	1450	15	4	2019-12-13	22:45:09.408656	The plot feels more chocolate.
22625	2464	19	1	2019-12-13	22:45:09.411599	The protagonist requires a beautiful story.
22626	3177	13	5	2019-12-13	22:45:09.413752	The female character believes in more chocolate.
22627	4188	13	4	2019-12-13	22:45:09.415927	The female character requires a beautiful story.
22628	3183	15	1	2019-12-13	22:45:09.418607	The protagonist is my deepest wish.
22629	1033	19	5	2019-12-13	22:45:09.420819	The protagonist wishes more chocolate.
22630	2305	15	3	2019-12-13	22:45:09.422933	The female character shows us my deepest wish.
22631	2546	17	1	2019-12-13	22:45:09.425009	The protagonist feels cold and dump.
22632	2813	13	5	2019-12-13	22:45:09.427083	I think this book wishes cold and dump.
22633	2552	16	5	2019-12-13	22:45:09.429214	The plot needs my deepest wish.
22634	2788	12	1	2019-12-13	22:45:09.431306	I think this book believes in a beautiful story.
22635	4640	18	3	2019-12-13	22:45:09.433671	The female character shows us technical issues.
22638	2378	19	5	2019-12-13	22:45:09.437608	The female character requires just dark.
22639	4302	16	2	2019-12-13	22:45:09.439714	The plot describes more chocolate.
22640	2648	13	3	2019-12-13	22:45:09.441802	The female character needs my deepest wish.
22641	989	17	2	2019-12-13	22:45:09.444063	I think this book feels just dark.
22642	1688	16	5	2019-12-13	22:45:09.446193	The plot requires my deepest wish.
22643	128	15	4	2019-12-13	22:45:09.448497	The protagonist tells us about just dark.
22644	2400	16	1	2019-12-13	22:45:09.451397	The protagonist tells us about technical issues.
22645	1445	16	5	2019-12-13	22:45:09.453739	I think this book requires cold and dump.
22646	1138	16	1	2019-12-13	22:45:09.456004	I wish this book needs just dark.
22649	4654	19	1	2019-12-13	22:45:09.460761	The story describes a beautiful story.
22650	3986	17	5	2019-12-13	22:45:09.463213	The female character describes technical issues.
22652	2184	16	4	2019-12-13	22:45:09.467005	The protagonist tells us about cold and dump.
22653	1327	17	2	2019-12-13	22:45:09.469931	I wish this book needs technical issues.
22654	2412	1	3	2019-12-13	22:45:09.472174	The female character is cold and dump.
22655	282	13	5	2019-12-13	22:45:09.477023	The female character is my deepest wish.
22657	3068	12	4	2019-12-13	22:45:09.480182	The story shows us just wrong.
22658	4203	15	5	2019-12-13	22:45:09.48313	The female character describes a beautiful story.
22659	186	13	5	2019-12-13	22:45:09.485765	It wishes just wrong.
22660	1809	1	3	2019-12-13	22:45:09.488187	The protagonist needs just wrong.
22661	562	19	2	2019-12-13	22:45:09.490485	The protagonist tells us about a breach in humanity.
22662	4180	12	4	2019-12-13	22:45:09.492738	The plot is cold and dump.
22664	2810	17	4	2019-12-13	22:45:09.496141	The plot believes in just wrong.
22666	3271	1	4	2019-12-13	22:45:09.49954	The protagonist needs just wrong.
22667	2933	15	2	2019-12-13	22:45:09.501784	I wish this book describes my deepest wish.
22668	1079	16	1	2019-12-13	22:45:09.503997	The protagonist describes just wrong.
22669	183	17	4	2019-12-13	22:45:09.506373	I think this book wishes cold and dump.
22670	2476	17	5	2019-12-13	22:45:09.509014	The protagonist requires more chocolate.
22671	436	13	4	2019-12-13	22:45:09.519564	I wish this book shows us my deepest wish.
22673	1444	15	2	2019-12-13	22:45:09.528409	The story tells us about more chocolate.
22674	2555	18	1	2019-12-13	22:45:09.534221	The protagonist believes in my deepest wish.
22676	4455	18	1	2019-12-13	22:45:09.541302	I think this book is just wrong.
22677	3620	18	5	2019-12-13	22:45:09.544327	The story is a beautiful story.
22678	4716	18	5	2019-12-13	22:45:09.546673	I think this book tells us about just wrong.
22679	2565	19	3	2019-12-13	22:45:09.548957	The female character wishes cold and dump.
22680	837	16	2	2019-12-13	22:45:09.551223	The female character tells us about my deepest wish.
22684	2302	17	4	2019-12-13	22:45:09.560067	I wish this book tells us about my deepest wish.
22685	3227	18	3	2019-12-13	22:45:09.56255	I think this book requires more chocolate.
22686	1724	1	2	2019-12-13	22:45:09.564985	The female character believes in a beautiful story.
22687	4562	12	5	2019-12-13	22:45:09.567479	I think this book wishes more chocolate.
22688	3361	13	2	2019-12-13	22:46:20.612118	It shows us a beautiful story.
22690	3169	17	4	2019-12-13	22:46:20.624567	The story requires a beautiful story.
22691	4927	19	5	2019-12-13	22:46:20.627458	It feels cold and dump.
22692	4590	18	5	2019-12-13	22:46:20.629994	I think this book requires a breach in humanity.
22693	4649	15	2	2019-12-13	22:46:20.632451	The protagonist describes just wrong.
22694	762	17	4	2019-12-13	22:46:20.634903	I think this book believes in just wrong.
22695	4525	15	2	2019-12-13	22:46:20.637329	The story describes more chocolate.
22696	923	12	4	2019-12-13	22:46:20.639559	The plot believes in just wrong.
22697	4807	17	2	2019-12-13	22:46:20.644668	It believes in my deepest wish.
22698	4313	16	5	2019-12-13	22:46:20.649908	I think this book is a beautiful story.
22700	1181	17	4	2019-12-13	22:46:20.656276	The protagonist requires a beautiful story.
22701	229	13	4	2019-12-13	22:46:20.658679	The story believes in cold and dump.
22702	461	17	2	2019-12-13	22:46:20.664095	The plot wishes just dark.
22703	4507	18	2	2019-12-13	22:46:20.669546	The female character describes a breach in humanity.
22704	4078	16	3	2019-12-13	22:46:20.674806	It feels cold and dump.
22705	3829	17	4	2019-12-13	22:46:20.680269	The plot needs cold and dump.
22707	2946	18	1	2019-12-13	22:46:20.686483	It needs cold and dump.
22708	4880	1	1	2019-12-13	22:46:20.690913	The plot shows us just wrong.
22710	3779	13	1	2019-12-13	22:46:20.695993	I think this book describes just dark.
22711	1040	1	2	2019-12-13	22:46:20.698322	The protagonist is just dark.
22712	303	1	3	2019-12-13	22:46:20.700598	I think this book is a beautiful story.
22713	1911	1	5	2019-12-13	22:46:20.70284	It shows us just dark.
22714	1041	18	1	2019-12-13	22:46:20.705134	The plot tells us about a breach in humanity.
22715	2099	12	4	2019-12-13	22:46:20.709748	I wish this book tells us about my deepest wish.
22716	3005	13	5	2019-12-13	22:46:20.712179	The plot shows us my deepest wish.
22717	4821	12	5	2019-12-13	22:46:20.714541	The story shows us cold and dump.
22719	3284	15	3	2019-12-13	22:46:20.71789	The plot describes more chocolate.
22720	3079	18	5	2019-12-13	22:46:20.720323	I think this book feels technical issues.
22721	4910	15	1	2019-12-13	22:46:20.72251	I think this book shows us a beautiful story.
22722	3087	13	4	2019-12-13	22:46:20.724698	I think this book requires just dark.
22724	2719	16	1	2019-12-13	22:46:20.727831	I think this book shows us just wrong.
22725	1891	19	5	2019-12-13	22:46:20.730162	The plot believes in my deepest wish.
22726	3181	1	3	2019-12-13	22:46:20.732529	I wish this book feels my deepest wish.
22727	3245	15	3	2019-12-13	22:46:20.734752	It describes cold and dump.
22728	847	1	3	2019-12-13	22:46:20.736946	I think this book requires a beautiful story.
22730	1430	17	3	2019-12-13	22:46:20.740144	The protagonist shows us my deepest wish.
22732	3982	1	4	2019-12-13	22:46:20.744709	It feels just dark.
22735	2906	1	4	2019-12-13	22:46:20.749036	It feels a beautiful story.
22737	1650	18	1	2019-12-13	22:46:20.753053	The plot shows us just wrong.
22738	3910	12	1	2019-12-13	22:46:20.75549	The story requires a breach in humanity.
22739	3426	13	4	2019-12-13	22:46:20.757906	The female character describes just wrong.
22740	3313	1	2	2019-12-13	22:46:20.760166	I wish this book believes in just dark.
22741	4074	19	2	2019-12-13	22:46:20.762448	The protagonist is more chocolate.
22742	3986	19	1	2019-12-13	22:46:20.764621	It needs more chocolate.
22744	1204	16	3	2019-12-13	22:46:20.769623	I think this book wishes just wrong.
22745	568	18	2	2019-12-13	22:46:20.772436	The protagonist is just wrong.
22746	4199	12	4	2019-12-13	22:46:20.775002	It believes in just dark.
22747	2813	18	4	2019-12-13	22:46:20.778061	I think this book tells us about a beautiful story.
22748	2871	18	1	2019-12-13	22:46:20.780677	The protagonist tells us about a breach in humanity.
22749	533	15	2	2019-12-13	22:46:20.783215	The protagonist tells us about just wrong.
22750	1085	1	5	2019-12-13	22:46:20.785633	I think this book tells us about cold and dump.
22751	302	19	2	2019-12-13	22:46:20.787878	I think this book requires technical issues.
22752	3800	12	1	2019-12-13	22:46:20.790138	I wish this book needs a breach in humanity.
22753	4449	12	4	2019-12-13	22:46:20.792397	It needs my deepest wish.
22754	3932	13	2	2019-12-13	22:46:20.794795	The plot requires just dark.
22755	4195	13	1	2019-12-13	22:46:20.797126	The plot needs a breach in humanity.
22756	4440	12	4	2019-12-13	22:46:20.799356	I think this book requires my deepest wish.
22757	2793	12	5	2019-12-13	22:46:20.801554	The protagonist requires a beautiful story.
22758	2639	12	5	2019-12-13	22:46:20.803797	The plot needs a beautiful story.
22759	1540	16	4	2019-12-13	22:46:20.80611	The plot wishes just dark.
22760	3663	13	5	2019-12-13	22:46:20.808378	It requires more chocolate.
22761	205	15	5	2019-12-13	22:46:20.810613	I wish this book believes in a breach in humanity.
22762	4404	17	5	2019-12-13	22:46:20.812854	The plot shows us just wrong.
22763	907	17	5	2019-12-13	22:46:20.815102	It needs a breach in humanity.
22765	4631	15	3	2019-12-13	22:46:20.82374	It wishes more chocolate.
22766	363	15	5	2019-12-13	22:46:20.829074	I think this book is my deepest wish.
22767	3742	18	4	2019-12-13	22:46:20.834492	The protagonist tells us about more chocolate.
22768	2431	17	3	2019-12-13	22:46:20.840986	It is a breach in humanity.
22770	2050	12	1	2019-12-13	22:46:20.845174	The protagonist needs just dark.
22771	244	18	3	2019-12-13	22:46:20.847688	The story believes in technical issues.
22773	4890	19	4	2019-12-13	22:46:20.851087	The story believes in my deepest wish.
22774	528	16	3	2019-12-13	22:46:20.85386	It requires my deepest wish.
22778	3698	19	4	2019-12-13	22:46:20.861043	The female character is my deepest wish.
22780	4752	1	5	2019-12-13	22:46:20.864772	The protagonist requires technical issues.
22781	2671	13	1	2019-12-13	22:46:20.867582	I wish this book shows us cold and dump.
22782	1668	12	2	2019-12-13	22:46:20.870394	The female character believes in technical issues.
22785	119	18	2	2019-12-13	22:46:20.875945	I wish this book describes more chocolate.
22786	214	1	1	2019-12-13	22:46:20.878589	I think this book is more chocolate.
22787	2936	13	3	2019-12-13	22:46:20.881135	The story is more chocolate.
22789	3071	19	3	2019-12-13	22:46:20.884263	It feels cold and dump.
22791	743	17	1	2019-12-13	22:46:20.887291	I wish this book tells us about more chocolate.
22795	788	17	5	2019-12-13	22:46:20.894753	The female character believes in technical issues.
22796	868	1	3	2019-12-13	22:46:20.897085	It is technical issues.
22798	4366	18	5	2019-12-13	22:46:20.900395	I think this book feels just dark.
22799	4144	12	4	2019-12-13	22:46:20.902929	The female character wishes technical issues.
22800	1021	16	2	2019-12-13	22:46:20.905239	The protagonist needs just dark.
22801	3360	15	5	2019-12-13	22:46:20.90802	I think this book needs just dark.
22803	2542	1	4	2019-12-13	22:46:20.912288	I wish this book is a beautiful story.
22804	3785	18	4	2019-12-13	22:46:20.914696	I think this book describes just wrong.
22806	4264	19	4	2019-12-13	22:46:20.917827	The story describes just dark.
22807	1757	12	2	2019-12-13	22:46:20.924628	The story requires a breach in humanity.
22808	2549	16	1	2019-12-13	22:46:20.927935	The story believes in a breach in humanity.
22810	2482	18	2	2019-12-13	22:46:20.931362	The protagonist needs a breach in humanity.
22811	3060	18	3	2019-12-13	22:46:20.934248	I wish this book tells us about a beautiful story.
22813	3194	18	3	2019-12-13	22:46:20.937554	The female character describes just dark.
22815	3708	17	2	2019-12-13	22:46:20.942164	I think this book feels technical issues.
22816	4684	19	4	2019-12-13	22:46:20.944425	The female character needs just dark.
22819	3873	13	4	2019-12-13	22:46:20.948376	I think this book is more chocolate.
22821	760	13	4	2019-12-13	22:46:20.951539	I wish this book needs technical issues.
22822	335	12	4	2019-12-13	22:46:20.953736	The plot believes in a breach in humanity.
22823	2221	16	2	2019-12-13	22:46:20.955842	The protagonist wishes my deepest wish.
22824	1575	16	4	2019-12-13	22:46:20.957999	The plot is technical issues.
22825	2179	17	5	2019-12-13	22:46:20.960225	It feels cold and dump.
22827	4940	16	4	2019-12-13	22:46:20.963351	It requires my deepest wish.
22828	4508	16	2	2019-12-13	22:46:20.965655	I think this book wishes technical issues.
22830	2438	16	4	2019-12-13	22:46:20.968852	I wish this book needs a breach in humanity.
22831	4885	19	4	2019-12-13	22:46:20.971102	I wish this book is just dark.
22832	3417	15	5	2019-12-13	22:46:20.973289	I wish this book feels just wrong.
22833	1366	16	2	2019-12-13	22:46:20.976423	The female character requires cold and dump.
22835	2334	18	2	2019-12-13	22:46:20.979704	I think this book wishes just dark.
22836	3578	18	2	2019-12-13	22:46:20.982026	The story requires just dark.
22837	4321	17	3	2019-12-13	22:46:20.98428	I wish this book describes just wrong.
22838	1671	16	2	2019-12-13	22:46:20.98648	I think this book needs technical issues.
22839	1876	17	4	2019-12-13	22:46:20.988737	I think this book tells us about a beautiful story.
22840	2149	18	1	2019-12-13	22:46:20.990943	The protagonist tells us about cold and dump.
22843	142	15	4	2019-12-13	22:46:20.994945	The story tells us about just wrong.
22844	4697	12	4	2019-12-13	22:46:20.999258	The plot is my deepest wish.
22846	1395	12	3	2019-12-13	22:46:21.002404	The story describes a breach in humanity.
22847	684	15	3	2019-12-13	22:46:21.004743	I wish this book requires a breach in humanity.
22848	4403	16	1	2019-12-13	22:46:21.007014	The plot tells us about a beautiful story.
22850	3291	18	5	2019-12-13	22:46:21.010191	The plot is more chocolate.
22853	4972	16	2	2019-12-13	22:46:21.014281	The female character needs a beautiful story.
22854	4408	12	5	2019-12-13	22:46:21.016666	The protagonist believes in just wrong.
22856	3197	13	3	2019-12-13	22:46:21.019786	The protagonist is cold and dump.
22857	1135	13	2	2019-12-13	22:46:21.022073	The story wishes just wrong.
22858	3603	16	1	2019-12-13	22:46:21.024331	It believes in a beautiful story.
22860	2077	16	1	2019-12-13	22:46:21.02784	The plot describes more chocolate.
22861	463	19	4	2019-12-13	22:46:21.030279	I think this book requires my deepest wish.
22862	2159	17	5	2019-12-13	22:46:21.032913	The plot feels technical issues.
22863	1680	18	5	2019-12-13	22:46:21.035879	It needs technical issues.
22864	4181	15	3	2019-12-13	22:46:21.038266	The female character requires just wrong.
22867	4805	19	5	2019-12-13	22:46:21.051847	I wish this book requires a breach in humanity.
22868	2896	17	5	2019-12-13	22:46:21.054527	It believes in technical issues.
22869	4419	12	1	2019-12-13	22:46:21.057004	The female character tells us about just wrong.
22870	2998	18	1	2019-12-13	22:46:21.059709	The plot shows us technical issues.
22871	1049	15	3	2019-12-13	22:46:21.062579	The plot believes in a beautiful story.
22874	2340	1	4	2019-12-13	22:46:21.067007	The female character shows us my deepest wish.
22875	1818	12	3	2019-12-13	22:46:21.069355	The plot believes in a breach in humanity.
22876	914	15	1	2019-12-13	22:46:21.0717	I think this book wishes a beautiful story.
22877	1778	12	2	2019-12-13	22:46:21.074122	I wish this book tells us about a beautiful story.
22878	3885	18	3	2019-12-13	22:46:21.077441	I wish this book wishes technical issues.
22881	2879	12	1	2019-12-13	22:46:21.082568	The plot wishes a beautiful story.
22882	946	12	5	2019-12-13	22:46:21.084915	The plot wishes technical issues.
22883	4336	13	5	2019-12-13	22:46:21.087301	It describes my deepest wish.
22885	740	12	1	2019-12-13	22:46:21.09084	The plot describes more chocolate.
22886	4775	17	3	2019-12-13	22:46:21.093818	The plot wishes my deepest wish.
22887	3349	12	1	2019-12-13	22:46:21.096796	The protagonist tells us about a breach in humanity.
22888	2482	16	4	2019-12-13	22:46:21.09943	The story needs just dark.
22889	4199	15	2	2019-12-13	22:46:21.102136	I wish this book shows us just dark.
22891	1324	15	1	2019-12-13	22:46:21.105543	It believes in a beautiful story.
22892	2500	19	5	2019-12-13	22:46:21.107945	It feels just wrong.
22894	2933	16	5	2019-12-13	22:46:21.113489	The story wishes just wrong.
22896	2985	18	1	2019-12-13	22:46:21.116943	The female character tells us about cold and dump.
22897	1725	16	5	2019-12-13	22:46:21.11925	It needs a beautiful story.
22898	419	16	2	2019-12-13	22:46:21.123808	I think this book wishes a beautiful story.
22899	2589	18	1	2019-12-13	22:46:21.126422	The protagonist requires just wrong.
22900	1366	12	2	2019-12-13	22:46:21.129233	I think this book tells us about just dark.
22902	3901	18	5	2019-12-13	22:46:21.133208	The plot needs a breach in humanity.
22903	4659	1	5	2019-12-13	22:46:21.136404	The protagonist believes in a beautiful story.
22904	4141	1	5	2019-12-13	22:46:21.138884	The story shows us just dark.
22905	1909	12	2	2019-12-13	22:46:21.141226	I wish this book requires a breach in humanity.
22906	1203	1	2	2019-12-13	22:46:21.143418	I wish this book tells us about my deepest wish.
22907	3002	15	2	2019-12-13	22:46:21.145737	The protagonist tells us about a breach in humanity.
22908	4124	19	5	2019-12-13	22:46:21.148118	It describes my deepest wish.
22909	678	15	1	2019-12-13	22:46:21.150433	It needs more chocolate.
22910	1688	18	3	2019-12-13	22:46:21.152654	I wish this book shows us more chocolate.
22912	3360	13	5	2019-12-13	22:46:21.155899	The plot is technical issues.
22913	1529	17	4	2019-12-13	22:46:21.158295	It believes in a breach in humanity.
22914	1977	16	4	2019-12-13	22:46:21.160668	The plot needs a breach in humanity.
22915	13	17	3	2019-12-13	22:46:21.163002	I think this book requires just dark.
22917	3496	1	1	2019-12-13	22:46:21.166111	The plot tells us about just dark.
22918	2404	18	2	2019-12-13	22:46:21.168367	I wish this book believes in cold and dump.
22920	4461	1	1	2019-12-13	22:46:21.172445	The protagonist requires just dark.
22921	2645	17	3	2019-12-13	22:46:21.174817	The story tells us about just wrong.
22922	4672	16	1	2019-12-13	22:46:21.177022	The story shows us more chocolate.
22923	36	12	1	2019-12-13	22:46:21.17921	The female character describes cold and dump.
22924	1189	12	5	2019-12-13	22:46:21.181413	It requires a beautiful story.
22925	3285	18	2	2019-12-13	22:46:21.183712	I think this book tells us about just wrong.
22927	1450	18	3	2019-12-13	22:46:21.187335	I wish this book shows us more chocolate.
22928	2312	13	4	2019-12-13	22:46:21.189807	The female character wishes just wrong.
22929	141	15	3	2019-12-13	22:46:21.19308	I wish this book describes just dark.
22932	676	13	2	2019-12-13	22:46:21.198091	It shows us just dark.
22933	3891	18	4	2019-12-13	22:46:21.200513	The protagonist requires a breach in humanity.
22934	3881	12	5	2019-12-13	22:46:21.202866	The story requires a beautiful story.
22935	2650	19	2	2019-12-13	22:46:21.205274	It wishes a breach in humanity.
22937	859	17	1	2019-12-13	22:46:21.209358	The plot feels my deepest wish.
22938	2060	15	2	2019-12-13	22:46:21.212123	The plot needs technical issues.
22939	3433	18	1	2019-12-13	22:46:21.215204	The plot needs cold and dump.
22940	4902	17	2	2019-12-13	22:46:21.218514	I wish this book describes more chocolate.
22941	550	16	1	2019-12-13	22:46:21.221423	I wish this book believes in my deepest wish.
22942	1058	12	4	2019-12-13	22:46:21.224249	The plot describes a breach in humanity.
22943	4361	15	5	2019-12-13	22:46:21.227007	The protagonist describes my deepest wish.
22945	4159	16	4	2019-12-13	22:46:21.232877	The story is just dark.
22947	1279	19	5	2019-12-13	22:46:21.241554	The protagonist shows us a beautiful story.
22949	3197	1	4	2019-12-13	22:46:21.245343	The protagonist is my deepest wish.
22950	39	15	2	2019-12-13	22:46:21.248461	The protagonist is my deepest wish.
22951	771	19	3	2019-12-13	22:46:21.251205	It is just wrong.
22953	1256	16	5	2019-12-13	22:46:21.254875	The female character shows us just dark.
22954	3593	19	1	2019-12-13	22:46:21.2579	It believes in a beautiful story.
22955	2358	12	4	2019-12-13	22:46:21.260658	It wishes just dark.
22956	3302	13	2	2019-12-13	22:46:21.263682	I wish this book tells us about my deepest wish.
22957	4193	12	1	2019-12-13	22:46:21.266814	It shows us my deepest wish.
22958	660	18	4	2019-12-13	22:46:21.269431	It wishes my deepest wish.
22961	2948	18	1	2019-12-13	22:46:21.275029	I think this book feels cold and dump.
22962	2521	17	1	2019-12-13	22:46:21.277764	The female character wishes just wrong.
22963	3923	15	3	2019-12-13	22:46:21.280645	The protagonist tells us about more chocolate.
22964	2448	17	3	2019-12-13	22:46:21.283797	The female character believes in my deepest wish.
22965	4926	16	4	2019-12-13	22:46:21.286548	The female character needs more chocolate.
22966	4012	15	1	2019-12-13	22:46:21.289349	The plot is my deepest wish.
22967	828	16	5	2019-12-13	22:46:21.292034	The protagonist wishes a beautiful story.
22968	4260	13	1	2019-12-13	22:46:21.294844	The protagonist shows us a breach in humanity.
22969	4	12	4	2019-12-13	22:46:21.298166	The story describes more chocolate.
22971	3733	1	1	2019-12-13	22:46:21.303419	The story needs my deepest wish.
22975	4189	12	3	2019-12-13	22:46:21.310789	The story shows us a breach in humanity.
22976	4098	16	3	2019-12-13	22:46:21.314256	The protagonist needs more chocolate.
22978	4631	19	2	2019-12-13	22:46:21.318775	I think this book tells us about a breach in humanity.
22979	205	12	2	2019-12-13	22:46:21.32162	The protagonist requires my deepest wish.
22981	4207	19	1	2019-12-13	22:46:21.325534	I think this book needs a breach in humanity.
22983	1655	16	4	2019-12-13	22:46:21.329877	The protagonist is a breach in humanity.
22984	4716	15	5	2019-12-13	22:46:21.333662	The plot wishes just wrong.
22985	573	16	5	2019-12-13	22:46:21.3371	I think this book tells us about more chocolate.
22986	233	16	3	2019-12-13	22:46:21.339948	I think this book describes just dark.
22987	4994	18	5	2019-12-13	22:46:21.34283	The female character shows us cold and dump.
22988	989	16	3	2019-12-13	22:46:21.345592	The plot wishes technical issues.
22989	1091	13	4	2019-12-13	22:46:21.34871	The female character shows us technical issues.
22990	446	13	5	2019-12-13	22:46:21.351703	The protagonist believes in a beautiful story.
22991	4557	15	4	2019-12-13	22:46:21.35456	I wish this book shows us more chocolate.
22992	99	13	3	2019-12-13	22:46:21.357281	The story describes more chocolate.
22994	4837	12	4	2019-12-13	22:46:21.361517	It is a beautiful story.
22995	2474	12	5	2019-12-13	22:46:21.36421	I wish this book requires a breach in humanity.
22996	1714	19	3	2019-12-13	22:46:21.366938	The plot is just wrong.
22997	1401	18	3	2019-12-13	22:46:21.369584	The plot wishes a beautiful story.
22998	3869	12	2	2019-12-13	22:46:21.374221	I wish this book tells us about my deepest wish.
23000	4475	13	5	2019-12-13	22:46:21.378203	The plot is more chocolate.
23002	3338	17	2	2019-12-13	22:46:21.382114	It wishes technical issues.
23003	4057	15	4	2019-12-13	22:46:21.384581	The protagonist feels technical issues.
23005	1099	19	1	2019-12-13	22:46:21.388599	It believes in more chocolate.
23008	4880	18	1	2019-12-13	22:46:21.394621	I think this book is my deepest wish.
23009	1141	16	5	2019-12-13	22:46:21.397557	The protagonist tells us about cold and dump.
23010	773	1	5	2019-12-13	22:46:21.400469	The plot needs cold and dump.
23011	3659	16	5	2019-12-13	22:46:21.402929	The protagonist requires just dark.
23012	1509	13	3	2019-12-13	22:46:21.405507	It needs just dark.
23013	4361	17	3	2019-12-13	22:46:21.40826	I wish this book describes my deepest wish.
23014	2288	13	2	2019-12-13	22:46:21.410961	I wish this book shows us cold and dump.
23016	1422	13	3	2019-12-13	22:46:21.414032	I wish this book believes in my deepest wish.
23017	1303	13	3	2019-12-13	22:46:21.416264	It is technical issues.
23018	3503	16	4	2019-12-13	22:46:21.418715	The plot feels more chocolate.
23019	2440	17	3	2019-12-13	22:46:21.42156	The story tells us about technical issues.
23021	4909	1	5	2019-12-13	22:46:21.424548	It tells us about my deepest wish.
23022	1385	12	1	2019-12-13	22:46:21.426759	The female character is technical issues.
23024	3404	12	3	2019-12-13	22:46:21.430052	The female character shows us just dark.
23025	863	1	4	2019-12-13	22:46:21.432399	The female character wishes a beautiful story.
23026	4797	18	3	2019-12-13	22:46:21.434927	I wish this book tells us about a breach in humanity.
23027	1781	1	3	2019-12-13	22:46:21.437601	The story shows us cold and dump.
23028	3449	19	5	2019-12-13	22:46:21.440056	I wish this book wishes technical issues.
23030	2310	17	5	2019-12-13	22:46:21.443514	The plot feels a breach in humanity.
23034	1166	19	5	2019-12-13	22:46:21.450825	The female character shows us just dark.
23035	4320	1	2	2019-12-13	22:46:21.456298	The story needs my deepest wish.
23036	792	19	5	2019-12-13	22:46:21.460811	The protagonist wishes a beautiful story.
23037	887	12	5	2019-12-13	22:46:21.464293	I wish this book believes in just dark.
23038	4476	1	1	2019-12-13	22:46:21.467682	I wish this book needs cold and dump.
23039	652	18	4	2019-12-13	22:46:21.473138	The plot feels cold and dump.
23040	429	18	4	2019-12-13	22:46:21.476584	The story is cold and dump.
23043	1503	15	5	2019-12-13	22:46:21.483569	The story shows us just dark.
23044	4683	19	2	2019-12-13	22:46:21.486605	I wish this book describes more chocolate.
23045	1720	1	5	2019-12-13	22:46:21.49013	The plot wishes my deepest wish.
23047	941	19	4	2019-12-13	22:46:21.497051	I think this book feels my deepest wish.
23049	4854	18	5	2019-12-13	22:46:21.501223	I think this book tells us about just wrong.
23051	889	19	5	2019-12-13	22:46:21.504369	It requires just dark.
23052	2406	18	4	2019-12-13	22:46:21.507003	The female character needs a beautiful story.
23053	1164	18	3	2019-12-13	22:46:21.509699	The female character requires a breach in humanity.
23054	2112	15	5	2019-12-13	22:46:21.512182	I think this book believes in technical issues.
23055	3458	17	3	2019-12-13	22:46:21.515211	I wish this book is a beautiful story.
23057	2795	17	3	2019-12-13	22:46:21.518956	I think this book describes a breach in humanity.
23059	1947	17	1	2019-12-13	22:46:21.522387	The story shows us cold and dump.
23060	2127	1	4	2019-12-13	22:46:21.524931	I wish this book tells us about a breach in humanity.
23061	3765	16	2	2019-12-13	22:46:21.527261	The story requires more chocolate.
23062	2987	19	4	2019-12-13	22:46:21.530836	The plot tells us about more chocolate.
23063	414	17	4	2019-12-13	22:46:21.539101	I think this book tells us about just dark.
23064	4795	17	1	2019-12-13	22:46:21.54372	The story requires my deepest wish.
23065	2504	1	2	2019-12-13	22:46:21.549019	The plot shows us technical issues.
23067	2561	15	2	2019-12-13	22:46:21.55437	The story believes in just dark.
23069	2547	13	4	2019-12-13	22:46:21.558985	The female character wishes my deepest wish.
23070	384	15	5	2019-12-13	22:46:21.562914	The story needs more chocolate.
23073	3941	1	3	2019-12-13	22:46:21.568029	It wishes just wrong.
23074	2980	17	2	2019-12-13	22:46:21.57045	The plot shows us cold and dump.
23075	3472	15	5	2019-12-13	22:46:21.572589	The plot describes more chocolate.
23076	2695	17	5	2019-12-13	22:46:21.574727	The female character feels just wrong.
23077	4350	15	4	2019-12-13	22:46:21.576965	The story describes just wrong.
23078	3391	12	5	2019-12-13	22:46:21.579281	It shows us just dark.
23079	4017	15	3	2019-12-13	22:46:21.582102	The story tells us about just wrong.
23080	4800	13	4	2019-12-13	22:46:21.585007	The protagonist feels my deepest wish.
23081	344	12	4	2019-12-13	22:46:21.587183	The protagonist tells us about technical issues.
23083	3271	17	5	2019-12-13	22:46:21.59033	The protagonist shows us just dark.
23084	3162	12	3	2019-12-13	22:46:21.592664	The story believes in cold and dump.
23085	4294	12	1	2019-12-13	22:46:21.59516	The plot describes just wrong.
23086	3723	18	5	2019-12-13	22:46:21.597612	The female character describes cold and dump.
23087	4240	15	3	2019-12-13	22:46:21.600668	The story believes in a breach in humanity.
23088	983	13	2	2019-12-13	22:46:21.603228	The story feels cold and dump.
23089	4858	18	3	2019-12-13	22:46:21.60573	The protagonist tells us about just dark.
23090	3847	12	3	2019-12-13	22:46:21.607876	The female character needs a beautiful story.
23093	2939	12	1	2019-12-13	22:46:21.612173	The story wishes my deepest wish.
23094	4441	13	2	2019-12-13	22:46:21.614906	I think this book believes in cold and dump.
23096	4444	15	2	2019-12-13	22:46:21.620982	The plot is cold and dump.
23097	399	13	2	2019-12-13	22:46:21.623294	It describes technical issues.
23098	823	12	5	2019-12-13	22:46:21.628687	I wish this book tells us about cold and dump.
23100	2546	1	1	2019-12-13	22:46:21.63578	The female character believes in just wrong.
23101	274	15	2	2019-12-13	22:46:21.6396	The protagonist feels my deepest wish.
23103	4420	18	2	2019-12-13	22:46:21.645264	The protagonist tells us about a breach in humanity.
23105	3907	16	5	2019-12-13	22:46:21.649544	I think this book needs technical issues.
23106	782	12	4	2019-12-13	22:46:21.652658	The plot needs technical issues.
23107	3153	13	5	2019-12-13	22:46:21.655058	It describes cold and dump.
23108	3125	13	5	2019-12-13	22:46:21.657447	I think this book needs just dark.
23109	546	18	1	2019-12-13	22:46:21.659737	I wish this book feels my deepest wish.
23111	1966	13	2	2019-12-13	22:46:21.663566	The plot feels just dark.
23112	3078	12	4	2019-12-13	22:46:21.667164	The story needs my deepest wish.
23114	2250	16	4	2019-12-13	22:46:21.671195	The female character shows us just wrong.
23115	2684	12	3	2019-12-13	22:46:21.673824	I think this book wishes just dark.
23116	1047	13	1	2019-12-13	22:46:21.676368	I think this book believes in just dark.
23117	1548	13	5	2019-12-13	22:46:21.678866	The plot tells us about a beautiful story.
23118	1175	18	1	2019-12-13	22:46:21.686855	The story tells us about technical issues.
23119	1983	1	1	2019-12-13	22:46:21.693188	The plot believes in cold and dump.
23120	2581	15	3	2019-12-13	22:46:21.697394	The protagonist requires cold and dump.
23121	4152	19	4	2019-12-13	22:46:21.699778	The story requires technical issues.
23122	3547	19	3	2019-12-13	22:46:21.702816	The protagonist requires technical issues.
23124	3561	17	4	2019-12-13	22:46:21.706522	The plot needs cold and dump.
23125	2803	12	5	2019-12-13	22:46:21.709162	It tells us about my deepest wish.
23127	4904	15	4	2019-12-13	22:46:21.712513	The plot is a beautiful story.
23130	2644	18	1	2019-12-13	22:46:21.716967	The story believes in cold and dump.
23131	1868	19	1	2019-12-13	22:46:21.72009	The story is technical issues.
23132	891	16	3	2019-12-13	22:46:21.729987	The female character feels more chocolate.
23133	3665	18	5	2019-12-13	22:46:21.737074	I think this book needs a breach in humanity.
23134	3990	18	5	2019-12-13	22:46:21.741634	The story describes more chocolate.
23135	1732	1	1	2019-12-13	22:46:21.74528	I think this book is my deepest wish.
23136	1658	12	2	2019-12-13	22:46:21.74993	The protagonist needs my deepest wish.
23138	189	15	5	2019-12-13	22:46:21.757322	The protagonist shows us a beautiful story.
23139	1357	13	4	2019-12-13	22:46:21.760637	The plot is technical issues.
23142	2337	17	4	2019-12-13	22:46:21.767723	It shows us more chocolate.
23143	2769	16	5	2019-12-13	22:46:21.771313	The story requires just wrong.
23144	2210	15	2	2019-12-13	22:46:21.773981	The plot shows us just dark.
23145	1106	12	5	2019-12-13	22:46:21.776513	The female character shows us just dark.
23147	3103	17	2	2019-12-13	22:46:21.78309	The plot describes a beautiful story.
23149	791	12	5	2019-12-13	22:46:21.788637	The plot requires cold and dump.
23151	2398	19	2	2019-12-13	22:46:21.793333	I think this book feels my deepest wish.
23153	4028	19	2	2019-12-13	22:46:21.797393	The female character believes in just dark.
23155	4243	18	3	2019-12-13	22:46:21.80162	I wish this book requires just dark.
23156	4976	13	1	2019-12-13	22:46:21.80487	The female character needs a breach in humanity.
23157	3897	12	2	2019-12-13	22:46:21.807662	The protagonist describes a beautiful story.
23158	3391	16	1	2019-12-13	22:46:21.810508	The protagonist describes my deepest wish.
23159	4851	1	1	2019-12-13	22:46:21.81308	The female character needs my deepest wish.
23160	4015	15	2	2019-12-13	22:46:21.817921	I wish this book feels technical issues.
23161	4931	12	5	2019-12-13	22:46:21.820806	It tells us about technical issues.
23164	3887	12	1	2019-12-13	22:46:21.829484	The plot requires just wrong.
23168	4105	16	1	2019-12-13	22:46:21.836488	The female character shows us a beautiful story.
23171	4256	19	2	2019-12-13	22:46:21.848607	The protagonist requires a beautiful story.
23172	3303	13	2	2019-12-13	22:46:21.851364	The protagonist is just wrong.
23173	4139	18	4	2019-12-13	22:46:21.8541	I wish this book is technical issues.
23174	1029	15	2	2019-12-13	22:46:21.856522	The female character tells us about a breach in humanity.
23175	3562	18	2	2019-12-13	22:46:21.859114	It shows us a beautiful story.
23177	4063	1	1	2019-12-13	22:46:21.862909	The protagonist requires more chocolate.
23178	3795	1	2	2019-12-13	22:46:21.865628	It believes in technical issues.
23179	2895	16	1	2019-12-13	22:46:21.869413	The story feels more chocolate.
23181	2166	18	5	2019-12-13	22:46:21.872734	The plot believes in more chocolate.
23182	3442	1	1	2019-12-13	22:46:21.874942	The plot shows us technical issues.
23183	3923	12	4	2019-12-13	22:46:21.87706	The protagonist wishes a breach in humanity.
23185	2928	12	3	2019-12-13	22:46:21.879917	The story needs my deepest wish.
23186	3270	16	3	2019-12-13	22:46:21.882822	The plot shows us my deepest wish.
23187	4712	1	4	2019-12-13	22:46:21.886157	The female character feels a beautiful story.
23188	3239	12	3	2019-12-13	22:46:21.888335	The female character is technical issues.
23190	769	18	3	2019-12-13	22:46:21.891485	The plot needs just wrong.
23191	4523	1	2	2019-12-13	22:46:21.893757	The protagonist requires just dark.
23194	1816	18	2	2019-12-13	22:46:21.897769	I think this book is just wrong.
23195	4610	18	1	2019-12-13	22:46:21.900011	The female character needs a beautiful story.
23197	4949	19	4	2019-12-13	22:46:21.903198	I wish this book wishes technical issues.
23200	3440	13	1	2019-12-13	22:46:21.907371	I think this book requires just dark.
23201	1351	1	5	2019-12-13	22:46:21.90966	I wish this book shows us a beautiful story.
23202	649	17	1	2019-12-13	22:46:21.911922	It describes cold and dump.
23203	3015	17	1	2019-12-13	22:46:21.915026	I wish this book tells us about more chocolate.
23204	3991	19	5	2019-12-13	22:46:21.917671	I think this book wishes more chocolate.
23208	3385	16	5	2019-12-13	22:46:21.922601	The female character believes in technical issues.
23209	4352	15	4	2019-12-13	22:46:21.924882	The story tells us about my deepest wish.
23210	3425	18	1	2019-12-13	22:46:21.927208	I wish this book needs technical issues.
23211	472	12	5	2019-12-13	22:46:21.929518	I wish this book is a beautiful story.
23212	1418	13	4	2019-12-13	22:46:21.931712	It describes technical issues.
23213	1848	18	4	2019-12-13	22:46:21.933989	It feels a breach in humanity.
23214	3275	15	3	2019-12-13	22:46:21.936094	The female character believes in my deepest wish.
23215	3120	12	1	2019-12-13	22:46:21.938264	I wish this book believes in my deepest wish.
23216	2105	15	4	2019-12-13	22:46:21.940574	The female character needs more chocolate.
23217	970	13	4	2019-12-13	22:46:21.942885	I think this book is a breach in humanity.
23219	2191	15	2	2019-12-13	22:46:21.945719	I wish this book needs just dark.
23220	2362	12	2	2019-12-13	22:46:21.948799	I wish this book tells us about a breach in humanity.
23221	1582	13	3	2019-12-13	22:46:21.951106	The plot shows us my deepest wish.
23222	3164	17	2	2019-12-13	22:46:21.953488	It feels more chocolate.
23223	3090	12	5	2019-12-13	22:46:21.955831	The female character wishes my deepest wish.
23224	2189	15	3	2019-12-13	22:46:21.958181	The female character describes a breach in humanity.
23225	2343	13	2	2019-12-13	22:46:21.960495	The female character needs just wrong.
23226	2696	16	4	2019-12-13	22:46:21.962857	The plot feels a breach in humanity.
23227	2017	15	3	2019-12-13	22:46:21.965259	The story is technical issues.
23228	4824	12	4	2019-12-13	22:46:21.967613	The plot shows us just wrong.
23230	3232	15	2	2019-12-13	22:46:21.970687	It tells us about cold and dump.
23231	4283	16	5	2019-12-13	22:46:21.976338	The female character believes in cold and dump.
23232	3713	13	4	2019-12-13	22:46:21.979818	The plot wishes more chocolate.
23233	719	16	4	2019-12-13	22:46:21.985239	The protagonist needs more chocolate.
23234	3730	18	3	2019-12-13	22:46:21.992379	I think this book is just wrong.
23235	3395	18	1	2019-12-13	22:46:21.996453	I think this book requires a breach in humanity.
23237	2487	19	2	2019-12-13	22:46:22.003116	It wishes more chocolate.
23238	2819	15	2	2019-12-13	22:46:22.007695	The story feels a beautiful story.
23239	1731	13	1	2019-12-13	22:46:22.013324	I wish this book tells us about my deepest wish.
23240	3403	17	1	2019-12-13	22:46:22.01914	The protagonist is a breach in humanity.
23241	4851	17	1	2019-12-13	22:46:22.024846	I think this book is just dark.
23242	3362	13	2	2019-12-13	22:46:22.031203	The female character believes in a beautiful story.
23243	640	12	1	2019-12-13	22:46:22.034984	The female character requires a breach in humanity.
23244	3672	15	5	2019-12-13	22:46:22.037358	I wish this book requires just wrong.
23246	2369	1	3	2019-12-13	22:46:22.040609	The plot tells us about technical issues.
23248	1916	15	5	2019-12-13	22:46:22.044509	The female character requires cold and dump.
23249	4249	19	1	2019-12-13	22:46:22.046983	The protagonist is just wrong.
23250	1850	19	5	2019-12-13	22:46:22.049295	The story feels cold and dump.
23252	3423	13	4	2019-12-13	22:46:22.05474	I think this book describes just wrong.
23253	1851	18	4	2019-12-13	22:46:22.05725	The plot believes in just dark.
23254	4298	15	3	2019-12-13	22:46:22.059546	The female character is my deepest wish.
23255	2232	19	4	2019-12-13	22:46:22.061688	It is just dark.
23256	2610	17	4	2019-12-13	22:46:22.063859	I wish this book wishes just wrong.
23258	1789	19	3	2019-12-13	22:46:22.067045	The female character requires more chocolate.
23260	3683	19	4	2019-12-13	22:46:22.070575	The protagonist shows us just dark.
23262	3583	15	2	2019-12-13	22:46:22.073749	The protagonist believes in cold and dump.
23263	1897	18	1	2019-12-13	22:46:22.076423	The protagonist describes more chocolate.
23265	1154	16	5	2019-12-13	22:46:22.080494	The female character requires my deepest wish.
23266	718	12	5	2019-12-13	22:46:22.082904	The protagonist is more chocolate.
23267	4465	16	5	2019-12-13	22:46:22.085119	The protagonist believes in a breach in humanity.
23268	2834	19	3	2019-12-13	22:46:22.087397	The plot shows us my deepest wish.
23269	81	17	2	2019-12-13	22:46:22.089616	I think this book describes my deepest wish.
23271	4205	16	5	2019-12-13	22:46:22.092903	The plot is just dark.
23272	1089	13	4	2019-12-13	22:46:22.095149	The protagonist shows us a beautiful story.
23273	922	19	1	2019-12-13	22:46:22.099393	I wish this book requires technical issues.
23274	57	17	2	2019-12-13	22:46:22.101572	The protagonist describes more chocolate.
23275	2452	1	3	2019-12-13	22:46:22.104069	The plot tells us about a beautiful story.
23276	2717	12	1	2019-12-13	22:46:22.106223	It tells us about more chocolate.
23277	4089	15	4	2019-12-13	22:46:22.108441	I wish this book feels technical issues.
23278	1334	19	5	2019-12-13	22:46:22.110602	The protagonist wishes technical issues.
23279	728	13	1	2019-12-13	22:46:22.112892	The plot is just wrong.
23280	823	16	2	2019-12-13	22:46:22.117944	I think this book believes in technical issues.
23282	2518	17	1	2019-12-13	22:46:22.121383	The female character tells us about my deepest wish.
23283	4543	17	2	2019-12-13	22:46:22.129226	The story requires more chocolate.
23284	596	12	4	2019-12-13	22:46:22.135156	It tells us about a beautiful story.
23285	2168	15	1	2019-12-13	22:46:22.138732	The story feels technical issues.
23286	4144	18	1	2019-12-13	22:46:22.143742	The story is my deepest wish.
23287	4163	17	5	2019-12-13	22:46:22.148805	The female character wishes just dark.
23289	4550	12	2	2019-12-13	22:46:22.154987	I think this book is a breach in humanity.
23290	4523	19	1	2019-12-13	22:46:22.159437	The story tells us about my deepest wish.
23293	3054	15	2	2019-12-13	22:46:22.166389	The protagonist wishes just wrong.
23294	1915	19	5	2019-12-13	22:46:22.169968	I wish this book shows us just wrong.
23296	459	15	4	2019-12-13	22:46:22.176635	I wish this book is just dark.
23297	1469	18	1	2019-12-13	22:46:22.179918	The story believes in my deepest wish.
23298	2255	12	2	2019-12-13	22:46:22.182705	It feels just wrong.
23300	2774	16	5	2019-12-13	22:46:22.186611	I think this book describes more chocolate.
23301	434	12	4	2019-12-13	22:46:22.189456	I wish this book tells us about more chocolate.
23302	1114	16	2	2019-12-13	22:46:22.192084	It wishes just wrong.
23303	367	12	2	2019-12-13	22:46:22.194953	It believes in cold and dump.
23304	4745	1	1	2019-12-13	22:46:22.197765	The protagonist describes technical issues.
23305	2274	18	5	2019-12-13	22:46:22.20042	The plot feels just wrong.
23306	4932	15	3	2019-12-13	22:46:22.202955	The protagonist believes in just dark.
23307	4210	12	4	2019-12-13	22:46:22.205428	The plot believes in more chocolate.
23308	1592	19	2	2019-12-13	22:46:22.208137	The story feels technical issues.
23309	4589	18	3	2019-12-13	22:46:22.210876	I think this book describes just wrong.
23310	4184	12	4	2019-12-13	22:46:22.213689	I wish this book believes in cold and dump.
23311	1945	18	1	2019-12-13	22:46:22.216446	I wish this book believes in a breach in humanity.
23314	1703	17	1	2019-12-13	22:46:22.221798	It believes in technical issues.
23316	1931	18	2	2019-12-13	22:46:22.226758	I wish this book believes in more chocolate.
23318	3424	16	2	2019-12-13	22:46:22.230637	I think this book shows us my deepest wish.
23319	3225	17	5	2019-12-13	22:46:22.233254	I wish this book tells us about more chocolate.
23321	4095	16	1	2019-12-13	22:46:22.237117	The female character requires my deepest wish.
23322	2628	13	4	2019-12-13	22:46:22.239746	The plot needs technical issues.
23323	1954	19	1	2019-12-13	22:46:22.24218	I think this book believes in more chocolate.
23324	3957	12	4	2019-12-13	22:46:22.244318	It feels just dark.
23326	2302	15	5	2019-12-13	22:46:22.248035	The female character tells us about a breach in humanity.
23327	3418	18	3	2019-12-13	22:46:22.251076	The plot feels a breach in humanity.
23328	4411	13	1	2019-12-13	22:46:22.253746	The protagonist describes my deepest wish.
23329	3466	15	2	2019-12-13	22:46:22.256406	The story requires cold and dump.
23330	4994	19	2	2019-12-13	22:46:22.259188	It needs cold and dump.
23331	3603	18	3	2019-12-13	22:46:22.262056	I wish this book tells us about my deepest wish.
23332	4897	12	2	2019-12-13	22:46:22.264625	I wish this book believes in a breach in humanity.
23333	1277	19	4	2019-12-13	22:46:22.2672	The story describes more chocolate.
23335	3409	16	4	2019-12-13	22:46:22.272159	The female character feels just dark.
23336	4373	19	4	2019-12-13	22:46:22.274788	The plot describes technical issues.
23339	737	13	2	2019-12-13	22:46:22.279471	I wish this book tells us about a beautiful story.
23340	1043	1	5	2019-12-13	22:46:22.282241	The plot wishes technical issues.
23341	1175	13	3	2019-12-13	22:46:22.284855	The story wishes a breach in humanity.
23342	1299	18	4	2019-12-13	22:46:22.288121	The female character shows us more chocolate.
23343	3747	1	4	2019-12-13	22:46:22.291576	I think this book wishes more chocolate.
23344	2860	15	4	2019-12-13	22:46:22.294342	I wish this book tells us about just dark.
23345	1096	12	4	2019-12-13	22:46:22.296982	The plot tells us about a beautiful story.
23347	4963	1	3	2019-12-13	22:46:22.300646	The plot is my deepest wish.
23349	1613	1	5	2019-12-13	22:46:22.310177	The story tells us about more chocolate.
23350	1180	16	1	2019-12-13	22:46:22.312879	I wish this book requires just wrong.
23351	4249	15	5	2019-12-13	22:46:22.315625	The plot is more chocolate.
23352	4121	17	1	2019-12-13	22:46:22.318102	The female character wishes just wrong.
23353	3249	16	4	2019-12-13	22:46:22.322189	I think this book describes a beautiful story.
\.


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: weirdjs
--

COPY public.user_data (user_id, username, password_hash) FROM stdin;
12	Torf	$2b$10$/nPtNPLRdzEnLmr9MDnHHuZ99dZjopjluY/2T06chDIstz/vcY1da
13	Ada	$2b$10$kBQD4b7rqDm.66bsoARY2eBtc/V6AcjmJ5vvExe6VfoJnCt6aLrs.
15	FulianPashir	$2b$10$N9FALmMFhj8ixaI0sdv8/uB66ws6to9uB/CwZf64jn8Uc56ip4mby
16	WadziaFax	$2b$10$l1zBN1O9bMvUjFPf.BhKAOsRWtbudTlFkc5qgDsI1Ol.zQPv1Fx5O
17	MiraPerys	$2b$10$Tk8FngcN.Kiz5DWDI0WVeeMJ6.HBToJKURzqTiPKxbNqd9xDUZWOa
18	FulBukat	$2b$10$rjIc5xiF6wlwYliI29v7d.1L2RuuLpRcXVbRAbai6U2Kmw0vDxbyK
19	KilesA'Rien	$2b$10$W8rufGY14daZDM4vufO2/OdJ72yBcZA4CmFrKpCWkdp6RoeZhuMl6
20	Woc	$2b$10$CRXh8TmevAmTrADQysd3j.ZFV00TFkyFaBYwSMnm74KIOykxpxRDm
21	Poc	$2b$10$RP0Lc8Zn2A9TsLJTRbZ/C.BXtfWWZioOrNq0TTND9XsPnP8LcCLfG
1	DenjaminBisko	$2b$10$sFUFA01Gvp891fK82tzBEeRoSfUsZG6hH2Tz6RNbZkFX6ktoGAFuO
\.


--
-- Name: author_information_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: weirdjs
--

SELECT pg_catalog.setval('public.author_information_author_id_seq', 1881, true);


--
-- Name: book_information_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: weirdjs
--

SELECT pg_catalog.setval('public.book_information_book_id_seq', 45000, true);


--
-- Name: review_information_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: weirdjs
--

SELECT pg_catalog.setval('public.review_information_review_id_seq', 23353, true);


--
-- Name: user_data_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: weirdjs
--

SELECT pg_catalog.setval('public.user_data_user_id_seq', 21, true);


--
-- Name: author_information author_information_pkey; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.author_information
    ADD CONSTRAINT author_information_pkey PRIMARY KEY (author_id);


--
-- Name: book_information book_information_isbn_key; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.book_information
    ADD CONSTRAINT book_information_isbn_key UNIQUE (isbn);


--
-- Name: book_information book_information_pkey; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.book_information
    ADD CONSTRAINT book_information_pkey PRIMARY KEY (book_id);


--
-- Name: review_information review_information_book_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.review_information
    ADD CONSTRAINT review_information_book_id_user_id_key UNIQUE (book_id, user_id);


--
-- Name: review_information review_information_pkey; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.review_information
    ADD CONSTRAINT review_information_pkey PRIMARY KEY (review_id);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (user_id);


--
-- Name: review_information review_information_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.review_information
    ADD CONSTRAINT review_information_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book_information(book_id);


--
-- Name: review_information review_information_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: weirdjs
--

ALTER TABLE ONLY public.review_information
    ADD CONSTRAINT review_information_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_data(user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--



--
-- PostgreSQL database dump complete
--

