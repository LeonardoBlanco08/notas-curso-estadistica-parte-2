--- 
title: "Notas Curso de Estadística"
author: "Maikol Solís"
date: "Actualizado el 23 junio, 2020"
site: bookdown::bookdown_site
documentclass: book
fontsize: 12pt
monofont: "Source Code Pro"
colorlinks: true
bibliography: [bibliografia.bib]
biblio-style: authoryear
biblatexoptions: [url=false, doi=false, eprint=false, isbn=false]
link-citations: yes
description: ""
---



# Introducción


<!--chapter:end:index.Rmd-->


# Estimación de densidades

## Histograma

El histograma es una de las estructuras básicas en estadística. Básicamente con este objeto se puede visualizar la distribución de los datos sin tener conocimiento previo de los mismos.

### Construcción Estadística

Suponga que  \(X_1,X_2, \dots ,X_n\) proviene de una distribución desconocida.

- Seleccione un origen \(x_0\) y divida la linea real en _segmentos_.
\begin{equation*}
B_j = [x_0 +(j - 1)h,x_0 + jh) \quad j\in \mathbb{Z}
\end{equation*}

- Cuente cuántas observaciones caen en cada segmento. \(n_j\).


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/observaciones-histograma-1} \end{center}
- Cuente la frecuencia por el tamaño de muestra \(n\) y el ancho de banda \(h\).
\begin{equation*}
f_j = \frac{n_j}{nh}
\end{equation*}

- Dibuje el histograma.


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/ejemplo-inicial-histograma-1} \end{center}



Formalmente el histograma es el

\begin{equation*}
\hat{f}_h(x) = \frac{1}{nh} \sum_{i = 1}^{n} \sum_{j} I(X_i\in B_j) I(x\in B_j),
\end{equation*}

donde \(I\) es la indicadora.

### Construcción probabilistica

Denote \(m_j=jh-h/2\) el centro del segmento,

\begin{align*}
	\mathbb{P}\left(X\in \left[m_j - \frac{h}{2},m_j + \frac{h}{2} \right)\right)
	  & =
	\int_{m_j - \frac{h}{2}}^{m_j + \frac{h}{2}} f(u)du                                             \\
	  & \approx f(m_j)h
\end{align*}

Esto se puede aproximar como

\begin{equation*}
	\mathbb{P} \left(X\in \left[m_j - \frac{h}{2},m_j + \frac{h}{2}\right) \right)  \approx   \frac{1}{n} \#
	\left\{X\in \left[m_j - \frac{h}{2},m_j + \frac{h}{2}\right) \right\}
\end{equation*}

Acomodando un poco la expresión

\begin{equation*}
\hat{f}_h(m_j) =  \frac{1}{nh} \#
\left\{X\in \left[m_j - \frac{h}{2},m_j + \frac{h}{2}\right) \right\}
\end{equation*}

### Propiedades estadísticas 

Suponga que  \(x_0 = 0\) y que \(x \in B_j\) fijo, entonces

\begin{equation*}
\hat{f}_h(m_j) =  \frac{1}{nh} \sum_{i = 1}^{n} I(X_i \in B_j)
\end{equation*}

### Sesgo

El cálculo del sesgo es el

\begin{align*}
\mathbb{E}\left[ \hat{f}_h(m_j)\right]
& =  \frac{1}{nh} \sum_{i = 1}^{n} \mathbb{E}\left[ I(X_i \in B_j)\right] \\
& = \frac{1}{nh} n \mathbb{E}\left[ I(X_i \in B_j)\right]
\end{align*}

\(I(X_i \in B_j)\) es una indicadora con probabilidad de 1 de \(\int_{(j -
1)h}^{jh} f(u)du\) y 0 sino.

Entonces

\begin{align*}
\mathbb{E}\left[ I(X_i \in B_j)\right] = \mathbb{P}\left(I(X_i \in
B_j)=1\right) = \int_{(j - 1)h}^{jh} f(u)du.
\end{align*}

Entonces,
\begin{align*}
\mathbb{E}\left[{f}_h(m_j)\right]
& = \frac{1}{h} \int_{(j - 1)h}^{jh} f(u)du
\end{align*}

\begin{equation*}
Sesgo(\hat{f}_h(m_j)) = \frac{1}{h} \int_{(j -
1)h}^{jh} f(u)du - f(x)
\end{equation*}

Esto se puede aproximar usando Taylor alrededor del centro \(m_j = jh - h/2\) de \(B_j\) de modo que \(f(u) - f(x) \approx f^{\prime}(m_j)(u - x)\).

\begin{equation*}
Sesgo(\hat{f}_h(m_j)) =  \frac{1}{h} \int_{(j -
1)h}^{jh} f(u) - f(x) du \approx f^\prime(m_j)(m_j - x)
\end{equation*}

### Varianza

Dado que todos los \(X_i\) son i.i.d., entonces

\begin{align*}
\mathrm{Var}\left( \hat{f}_h(m_j)\right) & =
\mathrm{Var}\left( \frac{1}{nh} \sum_{i = 1}^{n} I(X_i \in B_j)\right)                                  \\
& = \frac{1}{n^2h^2} n\mathrm{Var}\left( I(X_i \in B_j)\right)
\end{align*}

La variable \(I\) es una bernoulli con parametro \(\int_{(j - 1)h}^{h} f(u)du\) por lo tanto su varianza es el

\begin{equation*}
\mathrm{Var}\left( \hat{f}_h(x)\right)\, =
\frac{1}{nh^2} \left(\int_{(j - 1)h}^{h} f(u)du \right)\left( 1 -\int_{(j - 1)h}^{h} f(u)du \right)
\end{equation*}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-3"><strong>(\#exr:unnamed-chunk-3) </strong></span>Usando un desarrollo de Taylor como en la parte anterior, pruebe que:
\begin{equation*}
\mathrm{Var}\left( \hat{f}_h(x)\right)\approx
\frac{1}{nh} f(x)
\end{equation*}</div>\EndKnitrBlock{exercise}


### Error cuadrático medio

El error cuadrático medio del histograma es el

\begin{equation*}
\mathrm{MSE}\left( \hat{f}_h(x)\right) =
\mathrm{E}\left[\left(\hat{f}_h(x) - f(x)\right)^2\right] = \mathrm{Sesgo}^2\left( \hat{f}_h(x)\right) + \mathrm{Var}\left( \hat{f}_h(x)\right).
\end{equation*}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4) </strong></span>¿Pueden probar la segunda igualdad de la expresión anterior?</div>\EndKnitrBlock{exercise}

\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solución. </em></span>  \fi{}Prueba segunda igualdad:
\begin{align*}
& \text{Sesgo}^2\left(\hat{f}_h(x)  \right) + \text{Var}\left( \hat{f}_h(x)\right)  = \\ & \left[ E\left(\hat{f}_h(x)\right) - f(x)\right]^2 + E\left[\left( E\left(\hat{f}_h(x)\right) - \hat{f}_h(x)\right)^2\right] \ =
\\ & E\left[\left[ E\left(\hat{f}_h(x)\right) - f(x)\right]^2 + \left( E\left(\hat{f}_h(x)\right) - \hat{f}_h(x)\right)^2   \right] \ \textcolor{red}{(*)} \
\end{align*}
Ahora note que:
\begin{align*}
& E\left[\left( E\left(\hat{f}_h(x)\right) - f(x)   \right) \left(E\left(\hat{f}_h(x)\right) - \hat{f}_h(x)    \right)    \right] \ = \                                      \\
& E\left[E\left(\hat{f}_h(x)\right)^2 \right] \ - \ E\left[E\left(\hat{f}_h(x)\right)\cdot \hat{f}_h(x) \right] \ - \ E\left[f(x)\cdot E\left(\hat{f}_h(x)\right)\right] \ + \\
& E\left[f(x)\cdot \hat{f}_h(x)\right]\ = \                                                                                                                                  \\
& E\left(\hat{f}_h(x)\right)^2  \ - \ E\left(\hat{f}_h(x)\right)^2  \ - \ E\left(\hat{f}_h(x)\right)\cdot E\left( f(x)\right) \ + \
E\left( f(x)\right)\cdot E\left(\hat{f}_h(x)\right) \                                                                                                                         \\
& = 0
\end{align*}
Entonces:
\begin{align*}
& \textcolor{red}{(*)} \ = \ E\left[\left[ E\left(\hat{f}_h(x)\right) - f(x)\right]^2 \ -  \right.                                                                                                         \\
& \left. \ 2\left( E\left(\hat{f}_h(x)\right) - f(x)   \right) \left(E\left(\hat{f}_h(x)\right) - \hat{f}_h(x)    \right) \ + \ \left( E\left(\hat{f}_h(x)\right) - \hat{f}_h(x)\right)^2   \right] \ = \  \\
& E\left[ \left(E\left(\hat{f}_h(x)\right) - f(x) \ - \ E\left(\hat{f}_h(x)\right) + \hat{f}_h(x) \right)^2   \right] \ = \                                                                                \\
& E\left[\left(\hat{f}_h(x) - f(x)\right)^2    \right]
\end{align*}
\qed</div>\EndKnitrBlock{solution}

Retomando los términos anteriores se tiene que

\begin{multline*}
\mathrm{MSE}\left( \hat{f}_h(x)\right) =
\frac{1}{nh} f(x) + f^\prime
\left\{
\left(
j - \frac{1}{2}
\right) h
\right\}^2
\left\{
\left(
j - \frac{1}{2}
\right) h - x
\right\}^2 \\
+ o\left(h \right) + 		o\left(\frac{1}{nh} \right)
\end{multline*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Si \(h \to 0\) y \(nh \to \infty\) entonces \(\mathrm{MSE}\left(  \hat{f}_h(x)\right) \to 0 \). Es decir, conforme usamos más observaciones, pero el ancho de banda de banda no decrece tan rápida, entonces el error cuadrático medio converge a 0.

Esto indica que si \(\mathrm{MSE}\left(  \hat{f}_h(x)\right) \to 0 \) (convergencia en \(\mathbb{L}^2\)) implica que \(\hat{f}_h(x) \stackrel{\mathcal{P}}{\to} f(x)\), por lo tanto \(\hat{f}_h\) es consistente.</div>\EndKnitrBlock{remark}

La fórmula anterior tiene la siguiente particularidad

- Si \(h\to 0\), la varianza crece (converge a \(\infty\)) y el sesgo decrece (converge a \(f^\prime (0)x^2\)).
- Si \(h\to \infty\), la varianza decrece (hacia 0)  y el sesgo crece (hacia \(\infty\))


Note que la figura siguiente tiene esa propiedad. 




\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/MSE-histograma-1} \end{center}

### Error cuadrático medio integrado

El problema con el \(\mathrm{MSE}\left(  \hat{f}_h(x)\right)\) es que depende completamente del punto escogido \(x\).

La solución a esto es integrar el MSE.

\begin{align*}
\mathrm{MISE}\left(  \hat{f}_h(x)\right)
& = \mathrm{E}\left[
\int_{ -\infty}^{\infty} \left\{
\hat{f}_h(x) - f(x)
\right\}^2 dx
\right]                                                       \\
& = \int_{ -\infty}^{\infty} \mathrm{E}\left[
\left\{
\hat{f}_h(x) - f(x)
\right\}^2
\right] dx                                                    \\
& = \int_{ -\infty}^{\infty}\mathrm{MSE}(\hat{f}_h(x)) \, dx
\end{align*}

Además,

\begin{align*}
\mathrm{MISE} (\hat{f}_h(x))
& = \int_{ -\infty}^{\infty} \frac{1}{nh} f(x)dx                                                                                                                                          \\
& + \int_{ -\infty}^{\infty}\, \sum_{j}^{} I(x\in B_j) \left\{ \left( j- \frac{1}{2} \right)h -x  \right\}^2 \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2 dx \\
& = \frac{1}{nh} + \sum_{j}^{} \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2 \int_{ B_j}    \left\{ \left( j- \frac{1}{2} \right)h -x  \right\}^2 dx          \\
& =\frac{1}{nh} + \frac{h^2}{12} \sum_{j} \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2                                                                       \\
& \approx \frac{1}{nh} + \frac{h^2}{12} \int \{f^\prime(x)\}^2 dx                                                                                                                         \\
& =\frac{1}{nh} + \frac{h^2}{12} \Vert f^\prime\Vert_{2}^2
\end{align*}

### Ancho de banda óptimo para el histograma

El MISE tiene el mismo comportamiento que el MSE. La figura siguiente presenta el comportamiento de la varianza, sesgo y MISE para nuestro ejemplo.

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/MISE-histograma-1} 

}

\caption{ }(\#fig:MISE-histograma)
\end{figure}

La mala elección del parámetro $h$ causa que el histograma no capture toda la estructura de los datos.


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-8-1} \end{center}

En este caso se puede simplemente minimizar el MISE de la forma usual,

\begin{equation*}
\frac{\partial \mathrm{MISE}(f_{h})}{\partial h} = -\frac{1}{nh^2} + \frac{1}{6} h \Vert f^\prime\Vert_{2}^2 = 0
\end{equation*}

implica que

\begin{equation*}
h_{opt} = \left(\frac{6}{n\Vert f^\prime\Vert_{2}^2}\right) ^{1/3} = O\left( n^{1/3} \right).
\end{equation*}

y que por lo tanto

\begin{equation*}
\mathrm{MISE}(\hat{f}_{h}) = \frac{1}{n} \left(\frac{n\Vert f^\prime\Vert_{2}^2}{6}\right)  ^{1/3}
\end{equation*}

\BeginKnitrBlock{remark}\iffalse{-91-82-101-99-117-101-114-100-101-32-100-101-32-69-115-116-97-100-237-115-116-105-99-97-32-73-93-}\fi{}<div class="remark">\iffalse{} <span class="remark"><em>Nota</em> (Recuerde de Estadística I): </span>  \fi{}Si \(X_1, \ldots, X_2 \sim f_{\theta} \) i.i.d, con \(\mathrm{Var}(X) = \sigma^2\), recuerde que el estimador \(\hat{\theta}\)  de \(\theta\) tiene la característica que

\begin{equation*}
\mathrm{MSE}(\theta) = \mathrm{Var}(\hat{\theta}) +
\mathrm{Sesgo}^2(\hat{\theta}) = \frac{\sigma^2}{n}
\end{equation*}</div>\EndKnitrBlock{remark}

Según la nota anterior la tasas de convergencia del histograma es más lenta que la de un estimador parámetrico considerando la misma cantidad de datos.


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-10-1} \end{center}



Finalmente, podemos encontrar el valor óptimo  de esta datos dado por  $h=$`h_opt_MISE`

\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-12-1} \end{center}




## Estimación No-paramétrica de densidad

### Primera construcción

Sea $X_{1},\ldots,X_{n}$ variables aleatorias i.i.d. con distribución $f$ en $\mathbb{R}$.

La distribución de  $f$ es  $F(x)=\int_{-\infty}^{x}f(t)dt$.

Considere la distribución empírica como
\[
F_{n}(x)=\frac{1}{n}\sum_{i=1}^{n}I(X_{i}\leq x).
\]

Por la ley de los grandes números tenemos que \(\hat{F}_{n}(x)
\xrightarrow{c.s} F(x)\) para todo  $x$ en $\mathbb{R}$as
$n\rightarrow\infty$. Entonces, $F_{n}(x)$ es consistente

para todo $x$ in $\mathbb{R}$.

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Podríamos derivar \(\hat{F}_n\) para encontrar el estimar \(\hat{f}_n\)?</div>\EndKnitrBlock{remark}

La respuesta es si (más o menos).

Suponga que $h>0$ tenemos la aproximación
\[
f(x)\approx\frac{F(x+h)-F(x-h)}{2h}.
\]

Remplazando $F$  por su estimador  $\hat{F}_{n}$, defina
\[
\hat{f}_{n}^{R}(x)=\frac{F_{n}(x+h)-F_{n}(x-h)}{2h},
\]
donde $\hat{f}_{n}^{R}(x)$ es el estimador de _Rosenblatt _.

Podemos rescribirlo de la forma,
\[
\hat{f}_{n}^{R}(x)=\frac{1}{2nh}\sum_{i=1}^{n}I(x-h<X_{i}\leq x+h)=\frac{1}{nh}\sum_{i=1}^{n}K_{0}\left(\frac{X_{i}-x}{h}\right)
\]
con  $K_{0}(u)=\frac{1}{2}I(-1<u\leq1)$, lo cuál es equivalente al caso del histograma.



### Otra construcción

Con el histograma construimos una serie de segmentos fijo \(B_{j}\) y contabamos el número de datos que estaban **CONTENIDOS en $B_{j}$**

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Qué pasaría si cambiamos la palabra **CONTENIDOS** por **ALREDEDOR DE "x"**?</div>\EndKnitrBlock{remark}

Suponga que se tienen intervalos de longitud $ 2h $, es decir, intervalos de la forma $ [x-h,x+h) $.

El histograma  se escribe como

\begin{equation*}
\hat{f_{h}}(x) = \dfrac{1}{2hn} \# \{ X_i \in [x-h,x+h) \}.
\end{equation*}

Ahora tratemos de modificar ligeramente esta expresión notando dos cosas

1. \begin{equation*}
\frac{1}{2} I \left( \left\vert u \right\vert \leq 1 \right)
\end{equation*}
con \(u = \frac{x-xi}{h}\)

2.

\begin{equation*}
\frac{1}{2}\# \{ X_i \in [x-h,x+h) \}
=\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)
=\sum_{i=1}^{n}  \frac{1}{2} I \left( \left\vert \frac{x-x_{i}}{h}
\right\vert \leq 1 \right)
\end{equation*}
\end{enumerate}

Finalmente se tiene que

\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)
\end{equation*}

<!-- \begin{center} -->
<!-- \includegraphics[width=\linewidth]{manual_figure/np-density-interval-crop.pdf} -->
<!-- \end{center} -->


\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Qué pasaría si cambiaríamos la función \(K\) del histograma por una más general?</div>\EndKnitrBlock{remark}

Esta función debería cumplir las siguientes características


- \(K(u)\geq 0\).
- \(\int_{-\infty}^{\infty} K(u)du = 1 \).
- \(\int_{-\infty}^{\infty} u K(u)du = 0\).
- \(\int_{-\infty}^{\infty} u^{2} K(u)du <\infty\).


Por ejemplo:


- **Uniforme:** \(\frac{1}{2} I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Triangular:** \( (1-|u|) I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Epanechnikov:** \(\frac{3}{4} (1-u^{2}) I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Gausian:** \(\frac{1}{\sqrt{2\pi}} \exp \left( -\frac{1}{2}u^{2} \right)\).



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-16-1} \end{center}

Entonces se tendría que la expresión general para un estimador por núcleos es

\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)
\end{equation*}



\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Qué pasaría si modificamos el ancho de banda \(h\) para un mismo kernel?</div>\EndKnitrBlock{remark}

Nuevamente sería el ancho de banda ya que


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-18-1} \end{center}



\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Qué pasaría si modificamos el kernel para un mismo ancho de banda \(h\)?</div>\EndKnitrBlock{remark}


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-20-1} \end{center}



Recordemos nuevamente la fórmula

\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-X_{i}}{h} \right)
\end{equation*}

Cada sumando de esta expresión es una función por si misma. Si la integramos se obtiene que

\begin{equation*}
\frac{1}{nh}\int K\left( \frac{x-X_{i}}{h} \right) dx
= \frac{1}{nh} \int K\left( u \right) h du
= \frac{1}{n} \int K(u) du
= \frac{1}{n}
\end{equation*}


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-21-1} \end{center}



## Propiedades Estadísticas

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Podríamos imitar lo mismo que hicimos para el histograma?</div>\EndKnitrBlock{remark}

Si. Las propiedades que vimos anteriormente son universales para estimadores.

Entonces:
\begin{align*}
\mathrm{MSE}(\hat{f}_{h}(x)) & =\mathrm{Var}(\hat{f}_{h}(x))+\mathrm{Sesgo}^{2} (\hat{f}_{h}(x))            \\
\mathrm{MISE}(\hat{f}_{h})   & =\int\mathrm{Var}(\hat{f}_{h}(x))dx+\int\mathrm{Sesgo}^{2}(\hat{f}_{h}(x))dx
\end{align*}

donde

\(\mathrm{Var}\left(\hat{f}_{h}(x)\right)=\mathbb{E}\left[\hat{f}_{h}(x)-\mathbb{E}\hat{f}_{h}(x)\right]^{2}\) and \(\mathrm{Sesgo}\left(\hat{f}_{h}(x)\right)=\mathbb{E}\left[\hat{f}_{h}(x)\right]-f(x)\).



### Varianza

\begin{align*}
\mathrm{Var}(\hat{f}_{h}(x))
& =\mathrm{Var}\left(\frac{1}{n}\sum_{i=1}^{n}K\left(\frac{x-X_{i}}{h}\right)\right)          \\
& =\frac{1}{n^{2}h^{2}}\sum_{i=1}^{n}\mathrm{Var}\left(K\left(\frac{x-X_{i}}{h}\right)\right) \\
& =\frac{1}{nh^{2}}\mathrm{Var}\left(K\left(\frac{x-X}{h}\right)\right)                       \\
& =\frac{1}{nh^{2}}\left\{
\textcolor{red}{\mathbb{E}\left[K^{2}\left(\frac{x-X}{h}\right)\right]}
-\left\{
\textcolor{blue}{\mathbb{E}\left[K\left(\frac{x-X}{h}\right)\right]}
\right\}^{2}
\right\}.
\end{align*}
Usando que:
\begin{align*}
\textcolor{red}{\mathbb{E}\left[K^{2}\left(\frac{x-X}{h}\right)\right]}
& =\int K^{2}\left(\frac{x-s}{h}\right)f(s)ds            \\
& =h\int K^{2}\left(u\right)f(uh+x)du                    \\
& =h\int K^{2}\left(u\right)\left\{ f(x)+o(1)\right\} du \\
& =h\left\{ \Vert K\Vert_{2}^{2}f(x)+o(1)\right\} .
\end{align*}

\begin{align*}
\textcolor{blue}{\mathbb{E}\left[K\left(\frac{x-X}{h}\right)\right]}
& =\int K\left(\frac{x-s}{h}\right)f(s)ds            \\
& =	h\int K\left(u\right)f(uh+x)du                    \\
& =h\int K\left(u\right)\left\{ f(x)+o(1)\right\} du \\
& =h\left\{f(x)+o(1)\right\} .
\end{align*}

Por lo tanto se obtiene que

\begin{equation*}
\mathrm{Var}\left(\hat{f}_{h}(x)\right) = \frac{1}{nh} \Vert K\Vert_{2}^{2}f(x) + o\left(\frac{1}{nh}\right), \text{ si } nh\to \infty.
\end{equation*}



### Sesgo

Para el sesgo tenemos

\begin{align*}
\mathrm{Sesgo}\left(\hat{f}_{h}(x)\right)
& = \mathbb{E}\left[\hat{f}_{h}(x)\right]-f(x)                                                  \\
& = \frac{1}{nh} \sum_{i=1}^{n} \mathrm{E}\left[K\left( \frac{x-X_{i}}{h} \right)\right] - f(x) \\
& = \frac{1}{h}\mathrm{E}\left[K\left( \frac{x-X_{1}}{h} \right)\right] - f(x)                  \\
& = \int \frac{1}{h} K\left( \frac{x-u}{h}\right)f(u)du -f(x)                                   \\
\end{align*}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-23"><strong>(\#exr:unnamed-chunk-23) </strong></span>Usando el cambio de variable \(s=\frac{u-x}{h}\) y las propiedades del kernel pruebe que

\begin{equation*}
\mathrm{Sesgo}\left(\hat{f}_{h}(x)\right) = \frac{h^{2}}{2} f^{\prime\prime} \mu_{2}(K) + o(h^{2}), \text{ si } h\to 0
\end{equation*}
donde \(\mu_{2}=\int s^{2}K(s)ds\).

\emph{**Nota:** En algunas pruebas más formales, se necesita
además que  $f^{\prime\prime}$ sea absolutamente continua y que
$\int(f^{\prime\prime\prime}(x))dx<\infty$.}</div>\EndKnitrBlock{exercise}

\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solución. </em></span>  \fi{}\begin{align*}
\mathrm{Sesgo}(\hat{f_{h}}(x)) & = \int \frac{1}{h} K\left( \frac{x-u}{h} \right) f(u)du - f(x)		\\
& = \frac{1}{h} \int hK(s)f(sh+x) ds - f(x) \\
& = \int K(s)\Biggl[ f(x) + f^{\prime}(x)(sh+x-x)  \\
&  \qquad  + \frac{f^{\prime\prime}(x)}{2}(sh+x-x)^2 + o(h^{2}) \Biggr] - f(x) \\
& = \int K(s)f(x)ds + \int hf^{\prime}(x)sK(s) ds  \\
& \qquad  + \int \frac{h^2}{2} f^{\prime\prime}(x)s^2K(s) ds + o(h^2) - f(x) \\
& = f(x) + 0 + \frac{h^2}{2}f^{\prime\prime}(x)\mu_{2}(K) + o(h^2) - f(x)	\\
& = \frac{h^2}{2}f^{\prime\prime}(x)\mu_{2}(K) + o(h^2) \\
\end{align*}</div>\EndKnitrBlock{solution}


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-25-1} \end{center}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Note como los cambios en el ancho de banda modifican la suavidad (sesgo) y el aplanamiento de la curva (varianza).</div>\EndKnitrBlock{remark}



### Error cuadrático medio y Error cuadrático medio integrado

El error cuadrático medio se escribe
\begin{align*}
\mathrm{MSE}(\hat{f}_{h}(x))
& = \mathrm{Sesgo}\left(\hat{f}_{h}(x)\right)^{2} + \mathrm{Var}\left(\hat{f}_{h}(x)\right)                                                 \\
& = \frac{h^{4}}{4}\left(\mu_{2}(K)f^{\prime\prime}(x)\right)^{2}+\frac{1}{nh}\Vert K\Vert_{2}^{2}f(x)+o(h^{4})+o\left(\frac{1}{nh}\right).
\end{align*}

Y el error cuadrático medio integrado se escribe como,
\begin{align*}
\mathrm{MISE}\left(\hat{f}_{h}\right) & = \int \mathrm{MSE}\left(\hat{f}_{h}(x)\right)dx                                                                                                        \\
& = \int \mathrm{Sesgo}\left(\hat{f}_{h}(x)\right)^{2} + \mathrm{Var}\left(\hat{f}_{h}(x)\right)dx                                                        \\
& = \frac{h^{4}}{4}\mu_{2}^{2}(K)\left\Vert f^{\prime\prime}(x)\right\Vert_{2}^{2} +\frac{1}{nh}\Vert K\Vert_{2}^{2}+o(h^{4})+o\left(\frac{1}{nh}\right).
\end{align*}

### Ancho de banda óptimo

Minimizando el \(\mathrm{MISE}\) con respecto a \(h\) obtenemos
\begin{equation*}
h_{opt}=\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right).
\end{equation*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}De forma práctica, $h_{opt}$ no es un estimador útil de $h$ porque depende de $\Vert f^{\prime\prime}\Vert_{2}^{2}$  que es desconocido.

Más adelante veremos otra forma de encontrar este estimador.</div>\EndKnitrBlock{remark}

Evaluando $h_{opt}$ en el \(\mathrm{MISE}\) tenemos que

\begin{equation*}
\mathrm{MISE}(\hat{f}_{h})=\frac{5}{4}\left(\Vert K\Vert_{2}^{2}\right)^{4/5}\left(\Vert f^{\prime\prime}\Vert_{2}^{2}\mu_{2}(K)\right)^{2/5}n^{-4/5} = O\left( n^{-4/5} \right).
\end{equation*}


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-28-1} \end{center}



\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Formalmente, es posible probar que si $f$ es $\beta$ veces continuamente diferenciable y  $\int\left(f^{(\beta)}\right)^{2}<\infty$, entonces se tiene que
\[
{\displaystyle h_{opt}=O\left(n^{-\frac{1}{2\beta+1}}\right).}
\]
Por lo tanto se podría aproximar a una tasa paramétrica de convergencia si
\(\beta\) es grande.</div>\EndKnitrBlock{remark}



## Escogiendo el ancho de banda

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}La principal característica del ancho de banda
\begin{equation*}
h_{opt}=\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right).
\end{equation*}

ES QUE ¡NO FUNCIONA!
</div>\EndKnitrBlock{remark}

Veremos dos métodos para determinar un \(h\) que funcione:


- Referencia normal.
- Validación cruzada.




### Referencia normal

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Este método es más efectivo si se conoce que la verdadera distribución es bastante suave, unimodal y simétrica.

Más adelante veremos otro método para densidades más generales.</div>\EndKnitrBlock{remark}

Asuma que \(f\) es normal distribuida y se utiliza un kernel \(K\) gausiano. Entonces se tiene que

\begin{align*}
\hat{h}_{rn} & =\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right) \\
& =1.06 \hat{\sigma} n^{-1/5}.
\end{align*}

donde

\begin{equation*}
\hat{\sigma} = \sqrt{\frac{1}{n-1} \sum_{i=1}^{n} \left( x_{i}-\bar{x}^{2} \right)}
\end{equation*}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-32"><strong>(\#exr:unnamed-chunk-32) </strong></span>Pruebe que la ecuación anterior es verdadera. Es decir, calcule \(\Vert K\Vert_{2}^{2}\), \(\Vert f^{\prime\prime}\Vert_{2}^{2}\) y \(\mu_{2}(K)\)</div>\EndKnitrBlock{exercise}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Un problema con \(\hat{h}_{rn}=1.06 \hat{\sigma} n^{-1/5}\) es su sensibilidad a los valores extremos.</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:unnamed-chunk-34"><strong>(\#exm:unnamed-chunk-34) </strong></span>La varianza empírica de  1, 2, 3, 4, 5, es  2.5.

La varianza empírica de 1, 2, 3, 4, 5, 99, es 1538.</div>\EndKnitrBlock{example}

El rango intercuantil IQR se define como
\begin{equation*}
\mathrm{IQR}^{X} = Q^{X}_{3} - Q^{X}_{1}
\end{equation*}
donde \(Q^{X}_{1}\) y \(Q^{X}_{3}\) son el primer y tercer  de un conjunto de datos \(X_{1},\ldots, X_n\).

Con el supuesto que \(X\sim \mathcal{N}(\mu,\sigma^{2})\) entonces \(\displaystyle Z = \frac{X-\mu}{\sigma} \sim \mathcal{N}(0,1)\).

Entonces,
\begin{align*}
\mathrm{IQR}
& = Q^{X}_{3} - Q^{X}_{1}                                                     \\
& = \left( \mu+\sigma Q^{Z}_{3} \right) - \left( \mu+\sigma Q^{Z}_{1} \right) \\
& = \sigma \left(Q^{Z}_{3} - Q^{Z}_{1} \right)                                \\
& \approx \sigma \left( 0.67 - (0.67) \right)                                 \\
& =1.34 \sigma.
\end{align*}

Por lo tanto \(\displaystyle \hat{\sigma} = \frac{\widehat{\mathrm{IQR}}^{X}}{1.34}\)

Podemos sustituir la varianza empírica de la fórmula inicial y tenemos
\begin{equation*}
\hat{h}_{rn} = 1.06 \frac{\widehat{\mathrm{IQR}}^{X}}{1.34} n^{-\frac{1}{5}} \approx 0.79\  \widehat{\mathrm{IQR}}^{X}\ n^{-\frac{1}{5}}
\end{equation*}

Combinando ambos estimadores, podemos obtener,

\begin{equation*}
\hat{h}_{rn} = 1.06 \min \left\{\frac{\widehat{\mathrm{IQR}}^{X}}{1.34}, \hat{\sigma }\right\} n^{-\frac{1}{5}}
\end{equation*}



### Validación Cruzada

Defina el _error cuadrático integrado_ como
\begin{align*}
\mathrm{ISE}(\hat{f}_{h}) & =\int\left(\hat{f}_{h}(x)-f(x)\right)^{2}dx\nonumber                   \\
& =\int \hat{f}_{h}^{2}(x)dx-2\int \hat{f}_{h}(x)f(x)dx+\int f^{2}(x)dx.
\end{align*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}El MISE es el valor esperado del ISE.</div>\EndKnitrBlock{remark}

Nuestro objetivo es minimizar el ISE con respecto a \(h\).

Primero note que \(\int f^{2}(x)dx\) NO DEPENDE de \(h\). Podemos minimizar la expresión
\begin{equation*}
\mathrm{ISE}(\hat{f}_{h})-\int f^{2}(x)dx=
\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}
-2
\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}
\end{equation*}

Vamos a resolver esto en dos pasos partes



**Integral \(\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}\)**   

El término \(\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}\) es el valor esperado de
\(\mathrm{E}\left[\hat{f}(X)\right]\). Su estimador es
\begin{equation*}
\widehat{\mathrm{E}\left[\hat{f}(X)\right]}
= \frac{1}{n}\sum_{i=1}^{n}\hat{f}_{h}(X_{i})
=\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{j=1}^{n}
K\left(\frac{X_{j}-X_{i}}{h}\right).
\end{equation*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}El problema con esta expresión es que las observaciones que se usan para estimar la esperanza son las misma que se usan para estimar \(\hat{f}_{h}(x)\) (Se utilizan doble).</div>\EndKnitrBlock{remark}

La solución es remover la  $i^{\text{ésima}}$ observación de $\hat{f}_{h}$ para cada \(i\).

Redefiniendo el estimador anterior tenemos $\int \hat{f}_{h}(x)f(x)dx$ como
\[
\frac{1}{n}\sum_{i=1}^{n}\hat{f}_{h,-i}(X_{i}),
\]
donde
\[
\hat{f}_{h,-i}(x)=\frac{1}{(n-1)h}\sum_{\substack{j=1\\ j\neq i}}^{n}K\left( \frac{x-X_{i}}{h} \right) .
\]


**Integral \(\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}\)**  

Siguiendo con el término \(\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}\) note que este se puede reescribir como

\begin{align*}
\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}
& =\int\left(\frac{1}{nh}\sum_{i=1}^{n}K\left( \frac{x-X_{i}}{h} \right)\right)^{2}dx                                    \\
& =\frac{1}{n^{2}h^{2}}\sum_{i=1}^{n}\sum_{i=1}^{n}\int K\left(\frac{x-X_{i}}{h}\right)K\left(\frac{x-X_{j}}{h}\right)dx \\
& =\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{i=1}^{n}\int K\left(u\right)K\left(\frac{X_{i}-X_{j}}{h}-u\right)du               \\
& =\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{i=1}^{n}K*K\left(\frac{X_{i}-X_{j}}{h}\right).
\end{align*}

donde $K*K$ es la convolución de  $K$  consigo misma.


Finalmente tenemos la  función,

\[
\mathrm{CV}(h)=\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{j=1}^{n}K*K\left(\frac{X_{i}-X_{j}}{h}\right)-\frac{2}{(n-1)h}\sum_{i=1}^{n}\mathop{\sum_{j=1}^{n}}_{j\neq i}K\left( \frac{X_{i}-X_{j}}{h} \right).
\]

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Note que \(\mathrm{CV}(h)\) no depende de \(f\) o sus derivadas.</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Para efectos prácticos es mejor utilizar el criterio

\[
CV(h)=\int\hat{f}_{h}^{2}(x)dx-\frac{2}{(n-1)h}\sum_{i=1}^{n}\mathop{\sum_{j=1}^{n}}_{j\neq i}K\left( \frac{X_{i}-X_{j}}{h} \right)
\]
y luego calcular numéricamente la integral.</div>\EndKnitrBlock{remark}



### Intervalos de confianza para estimadores de densidad no paramétricos

Usando los resultados anteriores y asumiendo que \(h=cn^{-\frac{1}{5}}\) entonces

\begin{equation*}
n^{-\frac{2}{5}} \left\{ \hat{f}_{h}(x) -f(x)\right\}
\xrightarrow{\mathcal{L}} \mathcal{N}\left(\underbrace{\frac{c^{2}}{2} f^{\prime\prime}
\mu_{2}(K)}_{b_{x}}, \underbrace{\frac{1}{c}f(x) \left\Vert K \right\Vert_{2}^{2}}_{v_{x}}\right).
\end{equation*}

Si \(z_{1-\frac{\alpha}{2}}\) es el cuantil \(1-\frac{\alpha}{2}\) de una distribución normal estándar, entonces

\begin{align*}
1-\alpha
& \approx \mathbb{P}\left(b_{x}-z_{1-\frac{\alpha}{2}} v_{x} \leq n^{2 / 5}\left\{\widehat{f}_{h}(x)-f(x)\right\} \leq b_{x}+z_{1-\frac{\alpha}{2}} v_{x}\right) \\
& =\mathbb{P}\left(\widehat{f}_{h}(x)-n^{-2 / 5}\left\{b_{x}+z_{1-\frac{\alpha}{2}} v_{x}\right\}\right.                                                         \\
& \qquad\qquad \left. \leq f(x)\leq \hat{f}_{h}(x)-n^{-2 / 5}\left\{b_{x}-z_{1-\frac{\alpha}{2}} v_{x}\right\}\right)
\end{align*}

Esta expresión nos dice que con una probabilidad de  \(1-\alpha\) se tiene que

\begin{equation*}
\begin{aligned}
& \left[\hat{f}_{h}(x)-\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)-z_{1-\frac{\alpha}{2}} \sqrt{\frac{f(x)\|K\|_{2}^{2}}{n h}}\right. \\
& \left.\widehat{f}_{h}(x)-\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)+z_{1-\frac{a}{2}} \sqrt{\frac{f(x)\|K\|_{2}^{2}}{n h}}\right]
\end{aligned}
\end{equation*}

Al igual que en los casos anteriores, este invtervalo no es útil ya que depende de \(f(x)\) y \(f^{\prime\prime} (x)\).

Si \(h\) es pequeño relativamente a \(n^{-\frac{1}{5}}\) entonces el segundo término \(\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)\) podría ser ignorado.

Podemos reemplazar \(f(x)\) por su estimador \(\hat{f}_{h}(x)\).  Entonces tendríamos una intervalo aplicable a nuestro caso

\begin{equation*}
\left[\hat{f_{h}}(x)-z_{1-\frac{\alpha}{2}} \sqrt{\frac{\hat{f_{h}}(x)\|K\|_{2}^{2}}{n h}}, \hat{f}_{h}(x)+z_{1-\frac{\alpha}{2}} \sqrt{\frac{\hat{f}_{h}(x)\|\mathrm{K}\|_{2}^{2}}{n h}}\right]
\end{equation*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Este intervalo de confianza solo funciona en cada punto particular de \(f(x)\).

Existe una versión más general para determinar la banda de confianza de toda la función. Por favor revisar la página 62 de [@Hardle2004].</div>\EndKnitrBlock{remark}


## Laboratorio

Comenzaremos con una librería bastante básica llamada \texttt{KernSmooth}.

### Efecto de distintos Kernels en la estimación





```r
x <- read.csv("data/stockres.txt")
x <- unlist(x)
```





```r
summary(x)
```

```
##       Min.    1st Qu.     Median       Mean    3rd Qu.       Max. 
## -0.6118200 -0.0204085 -0.0010632 -0.0004988  0.0215999  0.1432286
```



```r
library(KernSmooth)

fhat_normal <- bkde(x, kernel = "normal", bandwidth = 0.05)
plot(fhat_normal, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-42-1} \end{center}

```r
fhat_unif <- bkde(x, kernel = "box", bandwidth = 0.05)
plot(fhat_unif, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-42-2} \end{center}

```r
fhat_epanech <- bkde(x, kernel = "epanech", bandwidth = 0.05)
plot(fhat_epanech, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-42-3} \end{center}

```r
fhat_biweight <- bkde(x, kernel = "biweight", bandwidth = 0.05)
plot(fhat_biweight, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-42-4} \end{center}

```r
fhat_triweight <- bkde(x, kernel = "triweight", bandwidth = 0.05)
plot(fhat_triweight, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-42-5} \end{center}

### Efecto del ancho de banda en la estimación 

** Kernel uniforme **

```r
fhat <- bkde(x, kernel = "box", bandwidth = 0.001)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-43-1} \end{center}

```r
fhat <- bkde(x, kernel = "box", bandwidth = 0.5)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-43-2} \end{center}

** Kernel Epanechnikov **


```r
fhat <- bkde(x, kernel = "epa", bandwidth = 0.001)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-44-1} \end{center}

```r
fhat <- bkde(x, kernel = "epa", bandwidth = 0.5)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-44-2} \end{center}


```r
suppressMessages(library(tidyverse))
library(gganimate)

fani <- tibble()

for (b in seq(0.001, 0.02, length.out = 40)) {
    f <- bkde(x, kernel = "epa", bandwidth = b, gridsize = length(x))
    fani <- fani %>% bind_rows(tibble(xreal = sort(x), 
        x = f$x, y = f$y, bw = b))
}

ggplot(data = fani) + geom_line(aes(x, y), color = "blue") + 
    labs(title = paste0("Ancho de banda = {closest_state}")) + 
    transition_states(bw) + view_follow() + theme_minimal(base_size = 20)

# anim_save('manual_figure/bandwidth-animation.gif')
```

<!-- \includemedia[ -->
<!-- label=bandwidth, -->
<!-- width=0.6\linewidth,height=0.45\linewidth, -->
<!-- addresource=manual_figure/bandwidth-animation.mp4, -->
<!-- transparent, -->
<!-- %transparent player background -->
<!-- activate=pageopen, -->
<!-- %show VPlayer's right-click menu -->
<!-- flashvars={ -->
<!-- source=manual_figure/bandwidth-animation.mp4 -->
<!-- &loop=true -->
<!-- % loop video -->
<!-- } -->
<!-- ]{}{VPlayer.swf} -->

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}
- Construya una variable llamada `u` que sea una secuencia de -0.15 a 0.15 con un paso de 0.01
- Asigne `x` a los datos `stockrel` y calcule su media y varianza.
- Usando la función `dnorm` construya los valores de la distribución de los datos usando la media y varianza calculada anteriormente. Asigne a esta variable `f\_param`.
- Defina un ancho de banda `h` en 0.02
- Construya un histograma para estos datos con ancho de banda `h`. Llame a esta variable `f\_hist`
- Usando el paquete `KernSmooth` y la función `bkde`, construya una función que calcule el estimador no paramétrico con un núcleo Epanechivok para un ancho de banda  $h$.  Llame a esta variable `f\_epa`.
- Dibuje en el mismo gráfico la estimación paramétrica y no paramétrica.
</div>\EndKnitrBlock{remark}



```r
x <- read.csv("data/stockres.txt")
x <- unlist(x)
# Eliminar nombres de las columnas
names(x) <- NULL

u <- seq(-0.15, 0.15, by = 0.01)

mu <- mean(x)
sigma <- sd(x)

f_param <- dnorm(u, mean = mu, sd = sigma)

h <- 0.02

n_bins <- floor(diff(range(x))/h)

f_hist <- hist(x, breaks = n_bins)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-47-1} \end{center}

```r
f_epa <- as.data.frame(bkde(x, kernel = "epa", bandwidth = h))

x_df <- data.frame(x)

library(ggplot2)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = 0.02, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = f_epa, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-47-2} \end{center}



### Ancho de banda óptimo

Usemos la regla de la normal o también conocida como Silverman.
**Primero recuerde que en este caso se asume que $f(x)$ sigue una distribución normal**. En este caso, lo que se obtiene es que

\begin{align*}
\Vert f^{\prime \prime} \Vert_2^2 & = \sigma ^{-5} \int \{\phi^{\prime \prime}\}^2 dx              \\
& = \sigma ^{-5} \frac{3}{8\sqrt{\pi}} \approx 0.212 \sigma^{-5}
\end{align*}

donde $\phi$ es la densidad de una normal estándar.

El estimador para $\sigma$ es

\[
s = \sqrt{\frac{1}{n-1} \sum_{i=1}^n (x_i - \bar{x})^2  }.
\]

Y usando el cálculo realizado anteriormente, se obtiene que

\[
h_{normal} = \left( \frac{4 s^5}{3n} \right)^{1/5} \approx 1.06 s n^{-1/5}.
\]

Un estimador más robusto es

\[
h_{normal} =  1.06 \min \left\{ s , \frac{IQR}{1.34} \right\} n^{-1/5}.
\]

¿Por qué es $IQR / 1.34$?


```r
s <- sd(x)
n <- length(x)
```


```r
h_normal <- 1.06 * s * n^(-1/5)

h <- h_normal

n_bins <- floor(diff(range(x))/h)
f_hist <- hist(x, breaks = n_bins, plot = FALSE)
f_epa <- as.data.frame(bkde(x, kernel = "epa", bandwidth = h))

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = f_epa, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-49-1} \end{center}


```r
h_iqr <- 1.06 * min(s, IQR(x)/1.34) * n^(-1/5)

h <- h_iqr

n_bins <- floor(diff(range(x))/h)
f_hist <- hist(x, breaks = n_bins, plot = FALSE)
f_epa <- as.data.frame(bkde(x, kernel = "epa", bandwidth = h))

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = f_epa, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-50-1} \end{center}

Una librería más especializada es \texttt{np} (non-parametric).


```r
library(np)

x.eval <- seq(-0.2, 0.2, length.out = 200)

h_normal_np <- npudensbw(dat = x, bwmethod = "normal-reference")

dens.ksum <- npksum(txdat = x, exdat = x.eval, bws = h_normal_np$bw)$ksum/(n * 
    h_normal_np$bw[1])

dens.ksum.df <- data.frame(x = x.eval, y = dens.ksum)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h_normal_np$bw, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = dens.ksum.df, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-51-1} \end{center}

### Validación cruzada

La forma que vimos en clase es la de validación cruzada por mínimos
cuadrados``least-square cross validation'' la cual se puede ejecutar
con este comando.


```r
h_cv_np_ls <- npudensbw(dat = x, bwmethod = "cv.ls", 
    ckertype = "epa", ckerorder = 2)
```

```
## Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 /Multistart 1 of 1 |Multistart 1 of 1 |                   
```

```r
dens.np <- npudens(h_cv_np_ls)

plot(dens.np, type = "b")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-52-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h_cv_np_ls$bw, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = dens.np.df, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-53-1} \end{center}

### Temas adicionales

** Reducción del sesgo **
Como lo mencionamos en el texto, una forma de mejorar el sesgo en la estimación es suponer que la función de densidad es más veces diferenciable.

Esto se logra asumiendo que el Kernel es más veces diferenciable.


```r
h_cv_np_ls <- npudensbw(dat = x, bwmethod = "cv.ls", 
    ckertype = "epa", ckerorder = 4)
```

```
## Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 /Multistart 1 of 1 |Multistart 1 of 1 |                   
```

```r
dens.np <- npudens(h_cv_np_ls)

plot(dens.np, type = "b", lwd = 2)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-54-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h_cv_np_ls$bw, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = dens.np.df, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-55-1} \end{center}

**Otra forma de estimar el ancho de banda** Otra forma de estimar ancho de bandas óptimos es usando máxima verosimilitud. Les dejo de tarea revisar la sección 1.1 del artículo de [@Hall1987] para entender su estructura.


```r
h_cv_np_ml <- npudensbw(dat = x, bwmethod = "cv.ml", 
    ckertype = "epanechnikov")
```

```
## Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 /Multistart 1 of 1 |Multistart 1 of 1 |                   
```

```r
dens.np <- npudens(h_cv_np_ml)

plot(dens.np, type = "b")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-56-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h_cv_np_ml$bw, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = dens.np.df, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-57-1} \end{center}


```r
h_cv_np_ml <- npudensbw(dat = x, bwmethod = "cv.ml", 
    ckertype = "epanechnikov", ckerorder = 4)
```

```
## Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 |Multistart 1 of 1 /Multistart 1 of 1 |Multistart 1 of 1 |                   
```

```r
dens.np <- npudens(h_cv_np_ml)

plot(dens.np, type = "b")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-58-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..), 
    binwidth = h_cv_np_ml$bw, col = "black", fill = "white") + 
    stat_function(fun = dnorm, args = list(mean = mu, 
        sd = sigma), color = "red") + geom_line(data = dens.np.df, 
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-59-1} \end{center}


```r
fani <- tibble()

for (b in seq(0.001, 0.05, length.out = 40)) {
    f <- npudens(tdat = x, ckertype = "epanechnikov", 
        bandwidth.compute = FALSE, bws = b)
    fani <- fani %>% bind_rows(tibble(xreal = sort(x), 
        x = f$eval$x, y = f$dens, bw = b))
}

ggplot(data = fani) + geom_line(aes(x, y), color = "blue") + 
    labs(title = paste0("Ancho de banda = {closest_state}")) + 
    theme_minimal(base_size = 20) + transition_states(bw) + 
    view_follow()

# anim_save('manual_figure/bandwidth-animation-np.gif')
```


<!-- \includemedia[ -->
<!-- label=bandwidth, -->
<!-- width=0.6\linewidth,height=0.45\linewidth, -->
<!-- addresource=manual_figure/bandwidth-animation-np.mp4, -->
<!-- transparent, -->
<!-- %transparent player background -->
<!-- activate=pageopen, -->
<!-- %show VPlayer's right-click menu -->
<!-- flashvars={ -->
<!-- source=manual_figure/bandwidth-animation-np.mp4 -->
<!-- &loop=true -->
<!-- % loop video -->
<!-- } -->
<!-- ]{}{VPlayer.swf} -->

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-61"><strong>(\#exr:unnamed-chunk-61) </strong></span>Implementar el intervalo confianza visto en clase para estimadores de densidades por núcleos y visualizarlo de en ggplot. 

**Si se atreven: ¿Se podría hacer una versión animada de ese gráfico para visualizar el significado real de este el intervalo de confianza?**</div>\EndKnitrBlock{exercise}

## Ejercicios 

Del libro de [@Hardle2004] hagan los siguientes ejercicios

1. **Sección 2:** 1, 2, 3, 5, 7, 14
2. **Sección 3:** 4, 8, 10, 11, 16, 

<!--chapter:end:01-estimacion-densidades-no-parametricas.Rmd-->


# Jacknife y Bootstrap

Suponga que se quiere estimar un intervalo de confianza para la media
\(\mu\) desconocida de un conjunto de datos \(X_{1},\ldots, X_{n}\)
que tiene distribución  \(\mathcal{N}\left(\mu ,\sigma^{2}\right)\).

Primero se  conoce que

\begin{equation*}
\sqrt{n}\left( \hat{\mu} - \mu \right)
\xrightarrow{\mathcal{L}} \mathcal{N}\left(0,\sigma^{2}\right),
\end{equation*}

y esto nos permite escribir el intervalo de confianza como

\begin{equation*}
\left[ \hat{\mu} - \hat{\sigma}z_{1-\frac{\alpha}{2}} ,
\hat{\mu} + \hat{\sigma}z_{1-\frac{\alpha}{2}}\right]
\end{equation*}

donde \(z_{1-\frac{\alpha}{2}}\) es el cuantil \(1-\frac{\alpha}{2}\)
de una normal estándar.

La expresión anterior es posible ya que el supuesto es que la
distribución de \(\hat{\theta}\) es normal.

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Qué pasaría si este supuesto es falso o al menos no conocemos la
distribución de \(\hat{\theta}\)?
  
¿Cómo podemos encontrar ese intervalo de confianza?</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Para una muestra fija, el estimador anterior  \(\hat{\mu}\)
solamente un valor.  No se conoce la distribución de \(\hat{\mu}\). Lo
único que se puede estimar son valores puntuales como la media,
varianza, mediana, etc, pero no sabemos nada de su distribución.</div>\EndKnitrBlock{remark}

## Caso concreto

Suponga que tenemos la siguiente tabla de datos, que representa una
muestra de tiempos y distancias de viajes en Atlanta.

Cargamos la base de la siguiente forma:


```r
CommuteAtlanta <- read.csv2("data/CommuteAtlanta.csv")
```



\begin{tabular}{l|r|r|r|l}
\hline
City & Age & Distance & Time & Sex\\
\hline
Atlanta & 19 & 10 & 15 & M\\
\hline
Atlanta & 55 & 45 & 60 & M\\
\hline
Atlanta & 48 & 12 & 45 & M\\
\hline
Atlanta & 45 & 4 & 10 & F\\
\hline
Atlanta & 48 & 15 & 30 & F\\
\hline
Atlanta & 43 & 33 & 60 & M\\
\hline
\end{tabular}


Para este ejemplo tomaremos la variable \texttt{Time} que la
llamaremos \texttt{x} para ser más breves. En este caso note que


```r
x <- CommuteAtlanta$Time
```

La media es 29.11  y su varianza 429.2483968. Para efectos de lo que sigue, asignaremos la varianza a la variable \(T_n\)


```r
Tn <- var(x)
```

A partir de estos dos valores, ¿Cuál sería un intervalo de confianza
para la media?

Note que esta pregunta es difícil ya que no tenemos ningún tipo de
información adicional.

Las dos técnicas que veremos a continuación nos permitirán extraer
_información adicional_ de la muestra.

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Para efectos de este capítulo, llamaremos \(T_{n}=T\left(
  X_{1},\ldots,X_{n}\right)\) al estadístico formado por la muestra de
los \(X_{i}\)'s.</div>\EndKnitrBlock{remark}



## Jacknife

Esta técnica fue propuesta por \cite{Quenouille1949} y consiste en la
siguiente observación.

Se puede probar que muchos de los estimadores tiene la propiedad que

\begin{equation}
\operatorname{Sesgo}\left(T_{n}\right)=\frac{a}{n}+\frac{b}{n^{2}}+O\left(\frac{1}{n^{3}}\right)
\end{equation}

para algún $a$ and $b$.

Por ejemplo $\sigma^{2}=\mathrm{Var}\left(X_{i}\right)$ y sea
$\widehat{\sigma}_{n}^{2}=n^{-1} \sum_{i=1}^{n}\left(X_{i}-\right.$
$\bar{X})^{2}$. Entonces,

\begin{equation*}
\mathbb{E}\left(\widehat{\sigma}_{n}^{2}\right)=
\frac{n-1}{n}\sigma^{2}
\end{equation*}

por lo tanto

\begin{equation*}
\mathrm{Sesgo} = -\frac{\sigma^{2}}{n}
\end{equation*}

Por lo tanto en este caso $a=-\sigma^{2}$ y $b=0$.

Defina \(T_{(-i)}\) como el estimador \(T_{n}\) pero eliminando el
\(i\)-ésimo término.

Es claro que en este contexto, se tiene que

\begin{equation}
\operatorname{Sesgo}\left(T_{(-i)}\right)=\frac{a}{n-1}+\frac{b}{(n-1)^{2}}+O\left(\frac{1}{(n-1)^{3}}\right)
\end{equation}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-67"><strong>(\#exr:unnamed-chunk-67) </strong></span>Una forma fácil de construir los \(T_{(-i)}\) es primero replicando
la matriz de datos múltiple veces usando el producto de kronecker</div>\EndKnitrBlock{exercise}


```r
n <- length(x)
jackdf <- kronecker(matrix(1, 1, n), x)
```



\begin{tabular}{r|r|r|r|r|r|r|r|r|r}
\hline
15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15\\
\hline
60 & 60 & 60 & 60 & 60 & 60 & 60 & 60 & 60 & 60\\
\hline
45 & 45 & 45 & 45 & 45 & 45 & 45 & 45 & 45 & 45\\
\hline
10 & 10 & 10 & 10 & 10 & 10 & 10 & 10 & 10 & 10\\
\hline
30 & 30 & 30 & 30 & 30 & 30 & 30 & 30 & 30 & 30\\
\hline
60 & 60 & 60 & 60 & 60 & 60 & 60 & 60 & 60 & 60\\
\hline
45 & 45 & 45 & 45 & 45 & 45 & 45 & 45 & 45 & 45\\
\hline
10 & 10 & 10 & 10 & 10 & 10 & 10 & 10 & 10 & 10\\
\hline
25 & 25 & 25 & 25 & 25 & 25 & 25 & 25 & 25 & 25\\
\hline
15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15\\
\hline
\end{tabular}



Y luego se elimina la diagonal


```r
diag(jackdf) <- NA
```



\begin{tabular}{r|r|r|r|r|r|r|r|r|r}
\hline
NA & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15\\
\hline
60 & NA & 60 & 60 & 60 & 60 & 60 & 60 & 60 & 60\\
\hline
45 & 45 & NA & 45 & 45 & 45 & 45 & 45 & 45 & 45\\
\hline
10 & 10 & 10 & NA & 10 & 10 & 10 & 10 & 10 & 10\\
\hline
30 & 30 & 30 & 30 & NA & 30 & 30 & 30 & 30 & 30\\
\hline
60 & 60 & 60 & 60 & 60 & NA & 60 & 60 & 60 & 60\\
\hline
45 & 45 & 45 & 45 & 45 & 45 & NA & 45 & 45 & 45\\
\hline
10 & 10 & 10 & 10 & 10 & 10 & 10 & NA & 10 & 10\\
\hline
25 & 25 & 25 & 25 & 25 & 25 & 25 & 25 & NA & 25\\
\hline
15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & 15 & NA\\
\hline
\end{tabular}


Cada columna contiene toda la muestra excepto el \(i\)-ésimo
elemento. Solo basta estimar la media de cada columna:


```r
T_i <- apply(jackdf, 2, var, na.rm = TRUE)
```



\begin{tabular}{r}
\hline
x\\
\hline
429.7098\\
\hline
428.1905\\
\hline
429.6023\\
\hline
429.3756\\
\hline
430.1087\\
\hline
428.1905\\
\hline
429.6023\\
\hline
429.3756\\
\hline
430.0764\\
\hline
429.7098\\
\hline
\end{tabular}



Definamos el sesgo _jackife_ como



\begin{equation*}
b_{jack} = (n-1) (\overline{T}_{n} - T_{n})
\end{equation*}

donde
\begin{equation*}
\overline{T}_{n} = \frac{1}{n} \sum_{i=1}^{n} T_{(-i)}
\end{equation*}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-71"><strong>(\#exr:unnamed-chunk-71) </strong></span>En nuestro caso tendríamos lo siguiente:</div>\EndKnitrBlock{exercise}


```r
(bjack <- (n - 1) * (mean(T_i) - Tn))
```

```
## [1] 0
```

Es decir, que los \texttt{T\_i} generan estimadores de \texttt{T\_n}
que contienen el mismo sesgo.


Observe que \(b_{jack}\) tiene la siguiente propiedad


\begin{align*}
\mathbb{E}\left(b_{\text {jack}}\right)
&= (n-1)\left(\mathbb{E}\left[\overline{T}_{n}\right] -
\mathbb{E}\left[T_{n}\right]\right) \\
&= (n-1)\left(\mathbb{E}\left[\overline{T}_{n}\right] - \theta +
\theta - \mathbb{E}\left[T_{n}\right]\right) \\
& =(n-1)\left(\mathrm{Sesgo} \left(\overline{T}_{n}\right)
-\mathrm{Sesgo}\left(T_{n}\right)\right) \\
& =(n-1)\left[\left(\frac{1}{n-1}
-\frac{1}{n}\right)
a+\left(\frac{1}{(n-1)^{2}}
-\frac{1}{n^{2}}\right) b+O\left(\frac{1}{n^{3}}\right)\right] \\
& =\frac{a}{n}
+\frac{(2 n-1) b}{n^{2}(n-1)}
+O\left(\frac{1}{n^{2}}\right) \\
& =\operatorname{Sesgo}\left(T_{n}\right)
+O\left(\frac{1}{n^{2}}\right)\\
\end{align*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Es decir, en general, el estimador \(b_{\text{jack}}\)  aproxima
correctamente \(\mathrm{Sesgo}\left( T_{n} \right)\) hasta con un
error del \(n^{-2}\).</div>\EndKnitrBlock{remark}


Podemos usar los $T\_i$ para generar muestras adicionales para
estimar el parámetro \(\theta\).

En este caso  defina el siguiente estimador:

\[
\widetilde{T}_{i}=n T_{n}-(n-1) T_{(-i)}.
\]

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}A \(\widetilde{T}_{i}\) se le llaman **pseudo-valores** y
representa el aporte o peso que tiene la variable \(X_{i}\) para
estimar \(T_{n}\).</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-75"><strong>(\#exr:unnamed-chunk-75) </strong></span>Usado un cálculo similar para el \(b_{jack}\) pruebe que

\[
\operatorname{Sesgo}\left(T_{\text {jack}
}\right)=-\frac{b}{n(n-1)}+O\left(\frac{1}{n^{2}}\right)=O\left(\frac{1}{n^{2}}\right).
\]

¿Qué conclusión se obtiene de este cálculo?</div>\EndKnitrBlock{exercise}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-76"><strong>(\#exr:unnamed-chunk-76) </strong></span>Los pseudo-valores se estiman de forma directa como,</div>\EndKnitrBlock{exercise}


```r
pseudo <- n * Tn - (n - 1) * T_i

pseudo[1:10]
```

```
##  [1] 199.02972209 957.16225222 252.64417993 365.79679037  -0.06666345
##  [6] 957.16225222 252.64417993 365.79679037  16.09799519 199.02972209
```


Lo importante acá es notar la similitud que tiene con los datos
reales,


```r
plot(x = x, y = pseudo)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-78-1} \end{center}



Con estos pseudo-valores, es posible estimar la media y la varianza de
\(T_{n}\) con sus respectivos estimadores:

\[
T_{\text {jack }}=\frac{1}{n} \sum_{i=1}^{n} \widetilde{T}_{i}
\]

donde

\[
v_{jack}=\frac{\sum_{i=1}^{n}\left(\widetilde{T}_{i}-\frac{1}{n}
\sum_{i=1}^{n} \widetilde{T}_{i}\right)^{2}}{n(n-1)}.
\]



\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}
Sin embargo, se puede demostrar fácilmente que se pueden usar
pseudovalores para construir una prueba normal de hipótesis. Dado que
cada pseudovalor es independiente e idénticamente distribuido (iid),
se deduce que su promedio se ajusta a una distribución normal a medida
que el tamaño de la muestra aumenta. El promedio de los pseudovalores
es solo \(T_ {jack}\) y el valor esperado de ese promedio, debido a la
construcción a la imparcialidad del estimador, es el parámetro bajo
investigación, \(\theta \). Por lo tanto, tenemos que
\[
  \frac{\sqrt{n}\left(T_{jack}-\theta\right)}{\sqrt{v_{jack}}}
  \rightarrow N(0,1).
\]</div>\EndKnitrBlock{remark}


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-80"><strong>(\#exr:unnamed-chunk-80) </strong></span></div>\EndKnitrBlock{exercise}

```r
(Tjack <- mean(pseudo))
```

```
## [1] 429.2484
```



```r
(Vjack <- var(pseudo, na.rm = TRUE))
```

```
## [1] 2701991
```



```r
(sdjack <- sqrt(Vjack))
```

```
## [1] 1643.774
```



```r
(z <- qnorm(1 - 0.05/2))
```

```
## [1] 1.959964
```



```r
c(Tjack - z * sdjack/sqrt(n), Tjack + z * sdjack/sqrt(n))
```

```
## [1] 285.1679 573.3289
```









## Bootstrap


Este método es un poco más sencillo de implementar que Jacknife y es
igualmente de eficaz propuesto por \cite{Efron1979}.

Primero recordemos que estamos estimando una estadístico a partir de
una muestra de modo que \(T_{n}=g\left( X_{1},\ldots,X_{n} \right)\)
donde \(g\) es cualquier función (media, varianza, quantiles, etc).


Supongamos que conocemos la distribución real de los \(X\)'s, llamada \(F(x)\). Si uno
quisiera estimar la varianza de \(X\) basta con hacer

\begin{equation*}
\mathrm{Var}_{F}\left(T_{n}\right)
= \frac{\sigma^{2}}{n}=\frac{\int x^{2}  dF(x)-\left(\int x
dF(x)\right)^{2}}{n}
\end{equation*}



donde \(\sigma^{2} = \mathrm{Var}\left(X\right)\) y el subindice \(F\) es solo para indicar la dependencia con la distribución real.

Ahora dado que no tenemos la distribución  real \(F(x)\), una opción es encontrar un estimador de esta llamado \(\hat{F}_n\).

La técnica de boostrap se basa en extraer muchas muestras iid de la distribución \(\hat{F}_n\) de modo que se pueda conocer su varianza.

En simple pasos la técnica es

1.  Seleccione \(X_{1}^{*}, \ldots, X_{n}^{*} \sim \widehat{F}_{n}\)
2.  Estime \(T_{n}^{*}=g\left(X_{1}^{*}, \ldots, X_{n}^{*}\right)\)
3.  Repita los Pasos 1 y 2, \(B\) veces para obtener \(T_{n, 1}^{*}, \ldots, T_{n, B}^{*}\)
4.  Estime
\[
v_{\mathrm{boot}}=\frac{1}{B} \sum_{b=1}^{B}\left(T_{n, b}^{*}-\frac{1}{B} \sum_{r=1}^{B} T_{n, r}^{*}\right)^{2}
\]


Por la ley de los grandes números tenemos que

\begin{equation}
v_{\mathrm{boot}} \stackrel{\mathrm{a.s.}}{\longrightarrow} \mathbb{V}_{\widehat{F}_{n}}\left(T_{n}\right), \text {\quad si } B \rightarrow \infty.
\end{equation}

además llamaremos,

\begin{equation*}
\widehat{\mathrm{se}}_{\mathrm{boot}}=\sqrt{v_{\mathrm{boot}}}
\end{equation*}

En pocas palabras lo que tenemos es que


\begin{align*}
\text  {Mundo Real: }
& F
& \Longrightarrow  X_{1}, \ldots, X_{n}
& \Longrightarrow
& T_{n} = g\left(X_{1}, \ldots, X_{n}\right) \\
\text {Mundo Bootstrap: }
& \widehat{F}_{n}
& \Longrightarrow  X_{1}^{*}, \ldots, X_{n}^{*}
& \Longrightarrow
& T_{n}^{*}=g\left(X_{1}^{*}, \ldots, X_{n}^{*}\right)
\end{align*}

En términos de convergencia lo que se tiene es que
\[
\mathrm{Var}_{F}\left(T_{n}\right) \overbrace{\approx}^{O(1 / \sqrt{n})} \mathrm{Var}_{\widehat{F}_{n}}\left(T_{n}\right) \overbrace{\approx}^{O(1 / \sqrt{B})} v_{b o o t}
\]

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}¿Cómo extraemos una muestra de \(\hat{F}_n\)?</div>\EndKnitrBlock{remark}
  
  
Recuerden que \(\hat{F}_{n}\) asigna la probabilidad de \(\frac{1}{n}\) a cada valor usado para construirla.
  
Por lo tanto, todos los puntos originales \(X_{1},\ldots,X_{n}\) tienen probabilidad \(\frac{1}{n}\) de ser escogidos, que resulta ser equivalente a un muestreo con remplazo \(n\)-veces.
  
Así que basta cambiar el punto 1. del algoritmo mencionando anteriormente con
  

1. Seleccione una muestra con remplazo  \(X_{1}^{*}, \ldots, X_{n}^{*}\) de  \(X_{1},\ldots,X_{n}\).

  
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-87"><strong>(\#exr:unnamed-chunk-87) </strong></span>En este ejemplo podemos tomar \(B=1000\) y construir esa cantidad de veces nuestro estimador.
</div>\EndKnitrBlock{exercise}

```r
B <- 1000
Tboot_b <- NULL

for (b in 1:B) {
    xb <- sample(x, size = n, replace = TRUE)
    Tboot_b[b] <- var(xb)
}

Tboot_b[1:10]
```

```
##  [1] 345.1819 493.5279 273.3998 446.3071 426.0340 384.2662 383.2132 455.8139
##  [9] 462.3363 594.5774
```
  

```r
plot(Tboot_b)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-89-1} \end{center}
  
  Por supuesto podemos encontrar los estadísticos usuales para esta nueva muestra


```r
(Tboot <- mean(Tboot_b))
```

```
## [1] 428.066
```
  

```r
(Vboot <- var(Tboot_b))
```

```
## [1] 5504.701
```
  

```r
(sdboot <- sqrt(Vboot))
```

```
## [1] 74.19367
```

``` ```

### Intervalos de confianza



\subsubsection{Intervalo Normal}

Este es el más sencillo y se escribe como

\begin{equation}
T_{n} \pm z_{\alpha / 2} \widehat{\mathrm{Se}}_{\mathrm{boot}}
\end{equation}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Este intervalo solo funciona si la distribución de \(T_{n}\) es normal.</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-94"><strong>(\#exr:unnamed-chunk-94) </strong></span>El cálculo de este intervalo es</div>\EndKnitrBlock{exercise}

```r
c(Tn - z * sdboot, Tn + z * sdboot)
```

```
## [1] 283.8315 574.6653
```

``` ```

\subsubsection{Intervalo pivotal}

Sea  \(\theta=T(F)\) y  \(\widehat{\theta}_{n}=T\left(\widehat{F}_{n}\right)\) y defina la cantidad pivotal  \(R_{n}=\widehat{\theta}_{n}-\theta .\)

Sea  \(H(r)\) la función de distribución del pivote:
\[
H(r)=\mathbb{P}_{F}\left(R_{n} \leq r\right).
\]

Además considere  \(C_{n}^{\star}=(a, b)\)  donde
\[
a=\widehat{\theta}_{n}-H^{-1}\left(1-\frac{\alpha}{2}\right) \quad \text { y } \quad b=\widehat{\theta}_{n}-H^{-1}\left(\frac{\alpha}{2}\right).
\]

Se sigue que
\begin{align*}
\mathbb{P}(a \leq \theta \leq b)
&=\mathbb{P}\left(\widehat{\theta}_{n}-b \leq R_{n} \leq \widehat{\theta}_{n}-a\right) \\
&=H\left(\widehat{\theta}_{n}-a\right)-H\left(\widehat{\theta}_{n}-b\right) \\
&=H\left(H^{-1}\left(1-\frac{\alpha}{2}\right)\right)-H\left(H^{-1}\left(\frac{\alpha}{2}\right)\right) \\
&=1-\frac{\alpha}{2}-\frac{\alpha}{2}=1-\alpha
\end{align*}
\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}\(C_{n}^{\star}=(a, b)\)  es un intervalo de confianza al \(1-\alpha\) de confianza.

El problema es que este intervalo depende de \(H\) desconocido.
</div>\EndKnitrBlock{remark}


Para resolver este problema, se puede construir una versión _bootstrap_ de \(H\) usando lo que sabemos hasta ahora.

\[
\widehat{H}(r)=\frac{1}{B} \sum_{b=1}^{B} I\left(R_{n, b}^{*} \leq r\right)
\]
donde \(R_{n, b}^{*}=\widehat{\theta}_{n, b}^{*}-\widehat{\theta}_{n}\).

Sea  \(r_{\beta}^{*}\) el cuantil muestral de tamaño  \(\beta\) de  \(\left(R_{n, 1}^{*}, \ldots, R_{n, B}^{*}\right)\) y sea \(\theta_{\beta}^{*}\) el cuantil muestral de tamaño  \(\beta\) de \(\left(\theta_{n, 1}^{*}, \ldots, \theta_{n, B}^{*}\right)\).

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Según la notación anterior note que
\begin{equation*}
r_{\beta}^{*}= \theta_{\beta}^{*}-\widehat{\theta}_{n}
\end{equation*}</div>\EndKnitrBlock{remark}



Con estas observaciones
It follows that an approximate \(1-\alpha\) confidence interval is \(C_{n}=(\widehat{a}, \widehat{b})\) where

\begin{align*}
\widehat{a}
&= \widehat{\theta}_{n}-\widehat{H}^{-1}\left(1-\frac{\alpha}{2}\right)
&= \widehat{\theta}_{n}-r_{1-\alpha / 2}^{*}
&= \widehat{\theta}_{n}-\theta_{1-\alpha / 2}^{*} + \widehat{\theta}_{n}
&=2 \widehat{\theta}_{n}-\theta_{1-\alpha / 2}^{*} \\
\widehat{b} &=\widehat{\theta}_{n}-\widehat{H}^{-1}\left(\frac{\alpha}{2}\right)
&=\widehat{\theta}_{n}-r_{\alpha / 2}^{*}
&= \widehat{\theta}_{n}-\theta_{\alpha / 2}^{*} + \widehat{\theta}_{n}
&=2 \widehat{\theta}_{n}-\theta_{\alpha / 2}^{*}
\end{align*}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}El intervalo de confianza pivotal de tamaño \(1-\alpha\) es
\[
  C_{n}=\left(2 \widehat{\theta}_{n}-\widehat{\theta}_{((1-\alpha / 2) B)}^{*}, 2 \widehat{\theta}_{n}-\widehat{\theta}_{((\alpha / 2) B)}^{*}\right)
  \]</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-99"><strong>(\#exr:unnamed-chunk-99) </strong></span>El intervalo anterior para un nivel de 95\% se estima de la siguiente forma</div>\EndKnitrBlock{exercise}

```r
c(2 * Tn - quantile(Tboot_b, 1 - 0.05/2), 2 * Tn - 
    quantile(Tboot_b, 0.05/2))
```

```
##    97.5%     2.5% 
## 267.1250 552.9294
```

``` ```

### Intervalo pivotal studentizado

Una mejora del intervalo anterior sería normalizar los estimadores previamente

\[
Z_{n}=\frac{T_{n}-\theta}{\widehat{\mathrm{se}}_{\mathrm{boot}}}.
\]
Como \(\theta\) es desconocido, entonces la versión a estimar es
\[
Z_{n, b}^{*}=\frac{T_{n, b}^{*}-T_{n}}{\widehat{\mathrm{se}}_{b}^{*}}
\]
donde  \(\widehat{\mathrm{se}}_{b}^{*}\) es un estimador del error estándar de  \(T_{n, b}^{*}\) no de \(T_{n}\).

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}Esto requerira estimar la varianza de \(T_{n,b}^*\) para cada \(b\).</div>\EndKnitrBlock{remark}

Con esto se puede obtener  cantidades \(Z_{n, 1}^{*}, \ldots, Z_{n, B}^{*}\) que debería ser próximos a \(Z_{n}\).

Sea \(z_{\alpha}^{*}\) del \(\alpha\) cuantiĺ de \(Z_{n, 1}^{*}, \ldots, Z_{n, B}^{*},\) entonces  \(\mathbb{P}\left(Z_{n} \leq z_{\alpha}^{*}\right) \approx \alpha\).

Define el intervalo
\begin{equation*}
C_{n}=\left(T_{n}-z_{1-\alpha / 2}^{*} \widehat{\mathrm{se}}_{\mathrm{boot}}, T_{n}-z_{\alpha / 2}^{*} \widehat{\mathrm{se}}_{\mathrm{boot}}\right)
\end{equation*}

Justificado por el siguiente cálculo:


\begin{align*}
\mathbb{P}\left(\theta \in C_{n}\right) &=\mathbb{P}\left(T_{n}-z_{1-\alpha / 2}^{*} \widehat{\mathrm{Se}}_{\mathrm{boot}} \leq \theta \leq T_{n}-z_{\alpha / 2}^{*} \widehat{\mathrm{Se}}_{\mathrm{boot}}\right) \\
&=\mathbb{P}\left(z_{\alpha / 2}^{*} \leq \frac{T_{n}-\theta}{\mathrm{se}_{\mathrm{boot}}} \leq z_{1-\alpha / 2}^{*}\right) \\
&=\mathbb{P}\left(z_{\alpha / 2}^{*} \leq Z_{n} \leq z_{1-\alpha / 2}^{*}\right) \\
& \approx 1-\alpha
\end{align*}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-102"><strong>(\#exr:unnamed-chunk-102) </strong></span>
Note que para este caso tenemos que hacer bootstrap para cada estimador bootstrap calculado.</div>\EndKnitrBlock{exercise}

```r
B <- 1000
Tboot_b <- NULL
Tboot_bm <- NULL
sdboot_b <- NULL

for (b in 1:B) {
    xb <- sample(x, size = n, replace = TRUE)
    Tboot_b[b] <- var(xb)
    for (m in 1:B) {
        xbm <- sample(xb, size = n, replace = TRUE)
        Tboot_bm[m] <- var(xbm)
    }
    sdboot_b[b] <- sd(Tboot_bm)
}

z_star <- (Tboot_b - Tn)/sdboot_b

hist(z_star)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-103-1} \end{center}


```r
c(Tn - quantile(z_star, 1 - 0.05/2) * sdboot, Tn - 
    quantile(z_star, 0.05/2) * sdboot)
```

```
##    97.5%     2.5% 
## 317.7259 707.0044
```


``` ```


### Resumiendo


Resumiendo todos lo métodos de cálculo de intervalos obtenemos


```r
knitr::kable(data.frame(Metodo = c("Jacknife", "Bootstrap Normal", 
    "Bootstrap Pivotal", "Bootstrap Pivotal Estudentizado"), 
    Inferior = c(Tjack - z * sdjack/sqrt(n), Tn - z * 
        sdboot, 2 * Tn - quantile(Tboot_b, 1 - 0.05/2), 
        Tn - quantile(z_star, 1 - 0.05/2) * sdboot), 
    Superior = c(Tjack + z * sdjack/sqrt(n), Tn + z * 
        sdboot, 2 * Tn - quantile(Tboot_b, 0.05/2), 
        Tn - quantile(z_star, 0.05/2) * sdboot)))
```


\begin{tabular}{l|r|r}
\hline
Metodo & Inferior & Superior\\
\hline
Jacknife & 285.1679 & 573.3289\\
\hline
Bootstrap Normal & 283.8315 & 574.6653\\
\hline
Bootstrap Pivotal & 271.2827 & 551.4989\\
\hline
Bootstrap Pivotal Estudentizado & 317.7259 & 707.0044\\
\hline
\end{tabular}

## Ejercicios


1. Repita los ejercicios anteriores para calcular intervalos de confianza para la distancia promedio y la varianza del desplazamiento de las personas. Use los métodos de Jacknife y Bootstrap (con todos sus intervalos de confianza).
Dada que la distancia es una medida que puede ser influenciada por distancias muy cortas o muy largas, se puede calcular el logaritmo de esta variable para eliminar la escala de la distancias.
  
2. Verifique que esta última variable se podría estimar paramétricamente con una distribución normal.
Repita los cálculos anteriores tomando como cuantiles los de una normal con media 0 y varianza 1.

3. Compare los intervalos calculados y comente los resultados.

4. Del libro [@Wasserman2006] **Sección 3:** 2, 3, 7, 9, 11.

  

<!--chapter:end:02-jacknife-bootstrap.Rmd-->


# Estimación de densidades con Bayes

## Introducción a la estimación Bayesiana

### Preliminares

Recordemos que tenemos \(f(\theta)\) la previa, \(L(\theta)\) la
verosimilitud de los datos y \(f(\theta|\text { data })\) la posterior
ajustada a los datos.

\begin{equation*}
	f(\theta | \text { data }) \propto f(\theta) L(\theta)
\end{equation*}

Además para el caso de la binomial tenemos que

\begin{equation*}
	f(y | \theta)=\theta^{\gamma}(1-\theta)^{(1-\gamma)}
\end{equation*}

y la distribución beta se escribe de la forma

\begin{align*}
	f(\theta | a, b) & =\operatorname{beta}(\theta | a, b)         \\
	                 & =\theta^{(a-1)}(1-\theta)^{(b-1)} / B(a, b)
\end{align*}

donde

\begin{equation*}
	B(a, b)=\int_{0}^{1}  \theta^{(a-1)}(1-\theta)^{(b-1)}\mathrm{d} \theta.
\end{equation*}

Los valores de \(a\) y \(b\) controlan la forma de esta distribución

![Tomado de @Kruschke2014](manual_figures/betas.png)

Una forma alternative es \(\mu=a /(a+b)\) es la media, \(\kappa=a+b\)
es la concentración y \(\omega=(a-1) /(a+b-2)\) es la moda de la
distribución Beta, entonces se cumple que

\begin{align*}
		  & a=\mu \kappa \quad \text { y } \quad b=(1-\mu) \kappa                                         \\
		  & a=\omega(\kappa-2)+1 \quad \text { y } \quad b=(1-\omega)(\kappa-2)+1 \text { para } \kappa>2
\end{align*}

Es decir, es posible estimar \(a\) y \(b\) de \(\kappa\), \(\mu\) y \(\omega\)

De acuerdo la combinación de estas dos distribuciones forma una familia conjugada de modo que

\begin{align*}
		f(\theta | z, N)
		  & = f(z, N | \theta) f(\theta) / f(z, N)
		\quad                                              \\
		  & = \theta^{z}(1-\theta)^{(N-z)} \frac{\theta^{(a-1)}(1-\theta)^{(b-1)}}{B(a, b)} / p(z, N) \\
		  & = \theta^{z}(1-\theta)^{(N-z)} \theta^{(a-1)}(1-\theta)^{(b-1)} /[B(a, b) p(z, N)]        \\
		  & = \theta^{((z+a)-1)}(1-\theta)^{((N-z+b)-1)} /[B(a, b) p(z, N)]                           \\
		  & = \theta^{((z+a)-1)}(1-\theta)^{((N-z+b)-1)} / B(z+a, N-z+b)
\end{align*}

### Ejemplo sencillo

Suponga que se hace una encuesta a 27 estudiantes y se encuentra que
11 dicen que duermen más de 8 horas diarias y el resto no. Nuestro
objetivo es encontrar inferencias sobre la proporción \(p\) de
estudiantes que duermen al menos 8 horas diarias. El modelo más
adecuado es

\[
		f(x \vert p) \propto p^s (1-p)^f
\]

donde \(s\) es la cantidad de estudiantes que duermen más de 8 horas y
\(f\) los que duermen menos de 8 horas.

Una primera aproximación para la previa es usar una distribución
discreta. En este caso, el investigador asigna una probabilidad a
cierta cantidad de horas de sueño, según su experiencia. Así, por
ejemplo:


```r
(p <- seq(0.05, 0.95, by = 0.1))
```

```
##  [1] 0.05 0.15 0.25 0.35 0.45 0.55 0.65 0.75 0.85 0.95
```

```r
(prior <- c(1, 5.2, 8, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 
    0))
```

```
##  [1] 1.0 5.2 8.0 7.2 4.6 2.1 0.7 0.1 0.0 0.0
```

```r
(prior <- prior/sum(prior))
```

```
##  [1] 0.034602076 0.179930796 0.276816609 0.249134948 0.159169550 0.072664360
##  [7] 0.024221453 0.003460208 0.000000000 0.000000000
```

```r
plot(p, prior, type = "h", ylab = "Probabilidad Previa")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-107-1} \end{center}

El paquete `LearnBayes` tiene la función `pdisc` que estima la
distribución posterior para una previa discreta binomial. Recuerde que
el valor 11 representa la cantidad de estudiantes con más de 8 horas
de sueño y 16 lo que no duermen esa cantidad.


```r
library(LearnBayes)
data <- c(11, 16)
post <- pdisc(p, prior, data)
round(cbind(p, prior, post), 2)
```

```
##          p prior post
##  [1,] 0.05  0.03 0.00
##  [2,] 0.15  0.18 0.00
##  [3,] 0.25  0.28 0.13
##  [4,] 0.35  0.25 0.48
##  [5,] 0.45  0.16 0.33
##  [6,] 0.55  0.07 0.06
##  [7,] 0.65  0.02 0.00
##  [8,] 0.75  0.00 0.00
##  [9,] 0.85  0.00 0.00
## [10,] 0.95  0.00 0.00
```

Y podemos ver la diferencia entre la previa (negro) y la posterior
(roja),


```r
plot(p, post, type = "h", col = "red")
lines(p + 0.01, prior, type = "h")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-109-1} \end{center}

¿Qué se puede deducir de estos resultados?

### Datos reales

Continuemos el ejercicio pero esta vez usando datos reales.

Carguemos los datos `studdendata` del paquete `LearnBayes`. Esta base
son preguntas que se le hicieron a un grupo de estudiantes de  Bowling
Green State University. Para mayor información use `?studentdata`.


```r
data("studentdata")
```

Como solo se tiene la hora de dormir y la hora de despertarse, se debe tomar la diferencia.


```r
horas_sueno <- studentdata$WakeUp - studentdata$ToSleep
horas_sueno <- na.omit(horas_sueno)
summary(horas_sueno)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   2.500   6.500   7.500   7.385   8.500  12.500
```

```r
hist(horas_sueno, main = "")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-111-1} \end{center}

Ahora supongamos que se tiene quiere ajustar una previa continua a este modelo. Para esto usaremos una distribución Beta con parámetros \(a\) y \(b\), de la forma

\[
	f(p\vert \alpha, \beta) \propto p^{1-a} (1-p)^{1-b}.
\]

El ajuste de los parámetros de la Beta depende mucho de la información
previa que se tenga del modelo. Una forma fácil de estimarlo es a
través de cuantiles con los cuales se puede reescribir estos
parámetros. En particular, suponga que se cree que el \(50\%\) de las
observaciones la proporción será menor que 0.3 y  el \(90\%\) será menor
que 0.5.

Para esto ajustaremos los siguientes parámetros


```r
quantile2 <- list(p = 0.9, x = 0.5)
quantile1 <- list(p = 0.5, x = 0.3)
ab <- beta.select(quantile1, quantile2)

a <- ab[1]
b <- ab[2]
s <- 11
f <- 16
```

En este caso se obtendra la distribución posterior Beta con paramétros
\(\alpha + s\) y \(\beta + f\),


```r
curve(dbeta(x, a + s, b + f), from = 0, to = 1, xlab = "p", 
    ylab = "Densidad", lty = 1, lwd = 4)
curve(dbeta(x, s + 1, f + 1), add = TRUE, lty = 2, 
    lwd = 4)
curve(dbeta(x, a, b), add = TRUE, lty = 3, lwd = 4)
legend(0.7, 4, c("Previa", "Verosimilitud", "Posterior"), 
    lty = c(3, 2, 1), lwd = c(3, 3, 3))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-113-1} \end{center}

En particular, si estamos interesados en \(\mathbb{P}(p>=.5 | \text {
		data })\) se puede estimar con


```r
1 - pbeta(0.5, a + s, b + f)
```

```
## [1] 0.0690226
```

y el intervalo de confianza correspondiente a esta distribución sería


```r
qbeta(c(0.05, 0.95), a + s, b + f)
```

```
## [1] 0.2555267 0.5133608
```

Otra opción para estimar este intervalo es simular 1000 veces la
distribución beta y observar su comportamiento en los cuantiles


```r
ps <- rbeta(1000, a + s, b + f)
hist(ps, xlab = "p", main = "")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-116-1} \end{center}

La probabilidad que este valor sea mayor que 0.5 es


```r
sum(ps >= 0.5)/1000
```

```
## [1] 0.069
```


```r
quantile(ps, c(0.05, 0.95))
```

```
##        5%       95% 
## 0.2520157 0.5196835
```

## Previa de histograma

El caso anterior funciona perfecto dada la combinación Binomial-Beta.

¿Qué pasaría si nuestra previa no está basada beta, sino que
quisiéramos extraerla directamente de los datos?

El método que usaremos será el siguiente:

- Elija una cuadrícula de valores de \(p\) sobre un intervalo que cubra
la densidad posterior.
- Calcule el producto de la probabilidad \(L (p)\) y el \(f (p)\) sobre
esa grilla.
- Normalice dividiendo cada producto por la suma de los productos. En
esto paso, estamos aproximando la densidad posterior por una
probabilidad discreta Distribución en la grilla.
- Usando el comando `sample` de `R`, tome una muestra aleatoria con
reemplazo de la distribución discreta.

El resultado nos debe arrojar una muestra de la distribución posterior
sobre la grilla

Suponga nuevamente que tenemos las mismas previas dadas al inicio del
capítulo


```r
midpt <- seq(0.05, 0.95, by = 0.1)
prior <- c(1, 5.2, 8, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 0)
prior <- prior/sum(prior)
```

Con la función  `histprior` construye los valores de \(p\) sobre una
grilla.


```r
curve(histprior(x, midpt, prior), from = 0, to = 1, 
    ylab = "Densidad previa", ylim = c(0, 0.3))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-120-1} \end{center}

Luego recordando que nuestra posterior es \(beta(s+1,f+1)\) tenemos que


```r
curve(histprior(x, midpt, prior) * dbeta(x, s + 1, 
    f + 1), from = 0, to = 1, ylab = "Densidad posterior")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-121-1} \end{center}

Para conseguir la distribución posterior, solo debemos de construirla para una secuencia ordenada de valores \(p\)


```r
p = seq(0, 1, length = 1000)
post = histprior(p, midpt, prior) * dbeta(p, s + 1, 
    f + 1)
post = post/sum(post)
```

Finalmente basta con tomar el muestreo de la posterior


```r
ps <- sample(p, replace = TRUE, prob = post)
hist(ps, xlab = "p", main = "")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-123-1} \end{center}

## Métodos Monte Carlo 

## Una moneda
El tratamiento clásico de la estimación de parámetros bayesiana nos dice que si tenemos una densidad previa y la ``combinamos'' con la verosimilitud de los datos, estos nos dará una densidad con más información. Se podría repetir el proceso varias veces para tratar de ajustar mejor la densidad posterior.

Sin embargo, se podría usar potencia de los métodos Monte Carlo para que esta búsqueda sea muy efectiva para encontrar los parámetros adecuados.

### Ejemplo del viajero

Suponga que tenemos un viajero que quiere estar en 7 lugares distintos (suponga que están en línea recta) y la probabilidad de pasar a un lugar a otro se decide tirando una moneda no sesgada (50\% a la derecha y 50\% a la izquierda).

Este caso sería una simple caminata aleatoria sin ningún interés en particular.

Suponga además, que el viajero quiere estar más tiempo donde haya una mayor cantidad de personas \(P\) pero siguiendo ese patrón aleatorio. Entonces la forma de describir su decisión de moverse sería:


* Tira la moneda y decide si va a la izquierda o la derecha.
    1. Si el lugar nuevo tiene \textbf{MÁS} personas que el actual salta a ese lugar. 
    2. Si el lugar nuevo tiene \textbf{MENOS} personas entonces el viajero         tiene que decidir si se queda o se mueve. | calcula la probabilidad         de moverse como $p_{moverse} = P_{nuevo}/P_{actual}$.
    
        **Tira un número aleatorio entre 0 y 1 $r$**
        
        1. Si $p_{moverse}>r$ entonces se mueve. 
        2. Sino, se queda donde está. 
        



```r
P <- 1:7

pos_actual <- sample(P, 1)
pos_nueva <- pos_actual

n_pasos <- 50000
trayectoria <- numeric(n_pasos)

trayectoria[1] <- pos_actual

for (k in 2:n_pasos) {
    # Tira la moneda para decidir
    
    moneda <- rbinom(1, 1, 0.5)
    # moneda es 0 o 1
    pos_nueva <- pos_actual
    if (moneda == 1 & (pos_actual + 1) <= 7) {
        pos_nueva = pos_actual + 1
    } else if (moneda == 0 & (pos_actual - 1) >= 1) {
        pos_nueva <- pos_actual - 1
    }
    
    p_moverse <- min(pos_nueva/pos_actual, 1)
    
    hay_movimiento <- 1 - p_moverse <= runif(1)
    
    if (hay_movimiento) {
        pos_actual <- pos_nueva
    }
    
    trayectoria[k] <- pos_nueva
}
```


```r
df <- data.frame(x = 1:n_pasos, P = trayectoria)

ggplot(df[1:200, ]) + geom_line(aes(x, P)) + coord_flip() + 
    theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-125-1} \end{center}

```r
ggplot(df) + geom_histogram(aes(P), stat = "count") + 
    theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-125-2} \end{center}


```r
mean(trayectoria)
```

```
## [1] 4.86008
```

```r
sd(trayectoria)
```

```
## [1] 1.798412
```

### Cadenas de Markov

Recuerde que estamos buscando el "camino" que el viajero tomará para pasar la mayor parte del tiempo de en los lugares más poblados (con mayor \(\theta\)).  

\begin{equation*}
\theta_{1} \curvearrowright \theta_{2} \curvearrowright \ldots \curvearrowright \theta_{50000}.
\end{equation*}

Denotamos \(\theta_{1}\to\theta_{2}\) si el viajero pasó de \(\theta_{1}\) hacia \(\theta_{2}\). 

Entonces 

- \(\mathbb{P}\left(\theta \rightarrow \theta+1\right)=0.5  \min \left(\frac{P(\theta+1)}{P(\theta)} / , 1\right)\)
- \(\mathbb{P}\left(\theta + 1 \rightarrow \theta\right)=0.5  \min \left(\frac{P(\theta)}{P(\theta+1)} / , 1\right)\)

Entonces la razón entre estas dos probabilidades es 

\begin{align*}
	\frac{\mathbb{P}\left(\theta \rightarrow \theta+1\right)}{\mathbb{P}\left(\theta +1 \rightarrow \theta\right)}
	  & =\frac{0.5 \min (P(\theta+1) / P(\theta), 1)}{0.5 \min (P(\theta) / P(\theta+1), 1)} \\
	  & =\left\{\begin{array}{ll}
		\frac{P(\theta+1)}{P(\theta) }
		  & \text { si } P(\theta+1)>P(\theta) \\
		\frac{P(\theta+1) }{P(\theta)}
		  & \text { si } P(\theta+1)<P(\theta)
	\end{array}\right.                                             \\
	\, & =\frac{P(\theta+1)}{P(\theta)}.
\end{align*}

Es decir que la razón de las probabilidades es equivalente a la razón entre las proporción de las poblaciones. Por lo tanto la mayoría de las veces se estará en los lugares con mayor población. 

Esta cadena se puede escribir usando una matriz de transición de la forma 


\begin{equation*}
T= \left(\begin{array}{ccccc}
\ddots & \mathbb{P}(\theta-2 \rightarrow \theta-1) & 0 & 0 & 0 \\
\ddots & \mathbb{P}(\theta-1 \rightarrow \theta-1) & \mathbb{P}(\theta-1 \rightarrow \theta) & 0 & 0 \\
0 & \mathbb{P}(\theta \rightarrow \theta-1) & \mathbb{P}(\theta \rightarrow \theta) & \mathbb{P}(\theta \rightarrow \theta+1) & 0 \\
0 & 0 & \mathbb{P}(\theta+1 \rightarrow \theta) & \mathbb{P}(\theta+1 \rightarrow \theta+1) & \ddots \\
0 & 0 & 0 & \mathbb{P}(\theta+2 \rightarrow \theta+1) & \ddots
\end{array}\right)
\end{equation*}


La matriz \(T\)  tiene las propiedades 

1. Existencia de una única distribución estacionaria (llamada \(f\) más adelante). 
2. Es ergódica, i.e., es aperíodica y positiva recurrente. Recuerde que una cadena de markov es érgodica si siempre se puede pasar de un estado a otro (no necesariamente en 1 paso). Otra forma de verlo es que la para alguna potencia de \(T\) todos los sus elementos serán positivos estrictos.  



### El algoritmo de Metropolis-Hasting

El ejemplo anterior era bastante sencillo pero demuestra que se puede
encontrar el mejor estimador posible simplemente ejecutando una y otra
vez maximizando la estadía en los lugares más poblados.

En este ejemplo la función a maximizar es la cantidad de personas
\(P(\theta)=\theta\), pero en general nuestro objetivo será maximizar
la distribución posterior \(f(\theta| \text{ datos })\).

En palabras simples el algoritmo de Metropoli Hasting es

1. Simule un valor \(\theta^{*}\) de una densidad de propuesta
\(p\left(\theta^{*} | \theta^{t-1}\right)\)
2. Estime la razón
\[
	R=\frac{f\left(\theta^{*}\right) L\left(\theta^{t-1} |
		\theta^{*}\right)}{f\left(\theta^{t-1}\right) L\left(\theta^{*} |
		\theta^{t-1}\right)}
\]
3. Estima la probabilidad de aceptación \(	p_{\text {moverse }}=\min \{R, 1\}\).
4. Tome \(\theta^{t}\) tal que \(\theta^{t}=\theta^{*}\)
con probabilidad \(	p_{\text {moverse }}\); en otro caso \(\theta^{t}=\) \(\theta^{t-1}\)

El algoritmo de Metropolis-Hastings se puede construir de muchas
formas, dependiendo de la densidad de proposición

Si esta es independiente de las elecciones anteriores entonces,
\[
	L\left(\theta^{*} | \theta^{t-1}\right)=L\left(\theta^{*}\right)
\]

Otras formas es escoger
\[
	L\left(\theta^{*} |
	\theta^{t-1}\right)=h\left(\theta^{*}-\theta^{t-1}\right)
\]
donde \(h\) es simétrica alrededor del origen. En este tipo de
cadenas, la razón \(R\) tiene la forma
\[
	R=\frac{f\left(\theta^{*}\right)}{f\left(\theta^{t-1}\right)}
\]

Una última opción es tomar
\[
	\theta^{*}=\theta^{t-1}+ Z
\]

donde \(Z\) es una normal centrada con cierta estructura de varianza.


###  ¿Por qué el algoritmo de Metropolis Hasting funciona?


\begin{equation}
\mathbb{P}\left(\theta_{\star} | \theta^{(t)}\right)=L\left(\theta_{\star} | \theta^{(t)}\right) \cdot \min \left\{1, \frac{f\left(\theta_{\star}\right) L\left(\theta^{(t)} | \theta_{\star}\right)}{f\left(\theta^{(t)}\right) L\left(\theta_{\star} | \theta^{(t)}\right)}\right\}
\end{equation}

Si se comienza en \(f\left(\theta^{(t)}\right)\) entonces

\begin{align}
\begin{array}{l}
f\left(\theta^{(t)}\right) \mathbb{P}\left(\theta_{\star} | \theta^{(t)}\right) \\
\quad=\quad f\left(\theta^{(t)}\right) L\left(\theta_{\star} | \theta^{(t)}\right) \min \left\{1, \frac{f\left(\theta_{\star}\right) L\left(\theta^{(t)} | \theta_{\star}\right)}{f\left(\theta^{(t)}\right) L\left(\theta_{\star} | \theta^{(t)}\right)}\right\} \\
\quad=\min \left\{f\left(\theta^{(t)}\right) L\left(\theta_{\star} | \theta^{(t)}\right), f\left(\theta_{\star}\right) L\left(\theta^{(t)} | \theta_{\star}\right)\right\} \\
\quad=\quad f\left(\theta_{\star}\right) L\left(\theta^{(t)} | \theta_{\star}\right) \min \left\{\frac{f\left(\theta^{(t)}\right) L\left(\theta_{\star} | \theta^{(t)}\right)}{f\left(\theta_{\star}\right) L\left(\theta^{\left(t | \theta_{\star}\right)}\right.}, 1\right\} \\
\quad=f\left(\theta_{\star}\right) \mathbb{P}\left(\theta^{(t)} | \theta_{\star}\right)
\end{array}
\end{align}

Asumiendo que existe una cantidad finita de estados \(\theta_{1}, \ldots, \theta_{M}\), entonces. 

\begin{equation*}
f\left(\theta_{j}\right) = \underbrace{\sum_{i=1}^{M} f\left(\theta_{i}\right) \mathbb{P} \left(\theta_{j} | \theta_{i}\right)}_{\text {Probabilidad total  }}=\sum_{i=1}^{M} f\left(\theta_{j}\right) \mathbb{P} \left(\theta_{i} | \theta_{j}\right)
\end{equation*}

\begin{equation}
f(\boldsymbol{\theta})^\top T =   f(\boldsymbol{\theta})
\end{equation}

Cual indica que no importa donde empecemos siempre llegaremos a la densidad estacionaria \(f\). 

[https://www.ece.iastate.edu/~namrata/EE527_Spring08/l4c.pdf#page=32](https://www.ece.iastate.edu/~namrata/EE527_Spring08/l4c.pdf#page=32)

### Extensión al caso del viajero

Retomemos el ejemplo del viajero. Supongamos que ahora existen una
cantidad infinita de lugares a los que puede ir y que la población de
cada isla es proporcional a la densidad posterior. Además, el viajero
podría saltar a cualquier isla que quisiera y su probabilidad de 
salto cae de forma continua en el intervalo \([0,1]\).

Para hacer este ejemplo concreto, el viajero no conoce cuál es su 
probabilidad de salto \(\theta\) pero sabe que ha tirado la
moneda \(N\) veces y observado \(z\) exitos. Por lo tanto tendremos
una verosimilitud de \(L(z, N |
\theta)=\theta^{z}(1-\theta)^{(N-z)}\).

La  previa será dada por \(f(\theta)=\operatorname{beta}(\theta | a,
b)\).

Los saltos serán gobernados por una normal centrada con media
\(\sigma\) de modo que \(\Delta \theta \sim
\mathcal{N}\left(0,\sigma^{2}\right)\).

Entonces el algoritmo de Metropolis Hasting se puede reformular como

1. Simule un valor de salto\(\Delta \theta \sim
\mathcal{N}\left(0,\sigma^{2}\right)\) y denote \(\theta^{t} =
\theta^{t} + \Delta\theta\).
2. Probabilidad de aceptación \(	p_{\text {moverse }}\)
\begin{align*}
	p_{\text {moverse }}
	  & =\min \left(1, \frac{P\left(\theta_{\ast}\right)}{P\left(\theta_{t-1}\right)}\right) \\
				  & =\min \left(1, \frac{p\left(D |
		\theta_{\ast}\right) p\left(\theta_{\ast}\right)}{p\left(D | \theta_{t-1}\right)
		p\left(\theta_{t-1}\right)}\right) \\
	  & =\min \left(1, \frac{\operatorname{Bernoulli}\left(z, N |
		\theta_{\ast}\right)
		\operatorname{beta}\left(\theta_{\ast} | a,
		b\right)}{\operatorname{Bernoulli}\left(z, N |
		\theta_{t-1}\right)
		\operatorname{beta}\left(\theta_{t-1} | a, b\right)}\right) \\
	  & =\min \left(1,
	\frac{\theta_{\ast}^{z}\left(1-\theta_{\ast}\right)^{(N-z)}
			\theta_{\ast} \left(1-\theta_{\ast}\right)^{(b-1)}
			/ B(a,b)}{\theta_{t-1}^{z}\left(1-\theta_{t-1}\right)^{(N-z)}
			\theta_{t-1}^{(a-1)}\left(1-\theta_{t-1}\right)^{(b-1)}
			/ B(a, b)}\right)
\end{align*}

3. Tome \(\theta_{t}\) tal que \(\theta_{t}=\theta_{*}\)
con probabilidad \(	p_{\text {moverse }} ;\) en otro caso \(\theta_{t}=\) \(\theta_{t-1}\)



En el ejemplo del viajero queremos ver la probabilidad \(\theta\) de 
que salte al siguiente destino. Tomemos \(\sigma=0.2\) y supongamos 
que se ha visto que el viajero de \(N=20\) y \(z=14\) éxitos.  Por 
cuestiones de practicidad se tomará \(\theta_0 = 0.1\).






```r
# Carga de datos observados
datos_observados <- c(rep(0, 6), rep(1, 14))

# Función de verosimilitud Binomial
verosimilitud <- function(theta, data) {
    z <- sum(data)
    N <- length(data)
    pDatosDadoTheta <- theta^z * (1 - theta)^(N - z)
    # Es para asegurarse que los datos caigan en [0,1].
    pDatosDadoTheta[theta > 1 | theta < 0] <- 0
    return(pDatosDadoTheta)
}

# densidad previa
previa <- function(theta) {
    pTheta <- dbeta(theta, 1, 1)
    # Es para asegurarse que los datos caigan en [0,1].
    pTheta[theta > 1 | theta < 0] <- 0
    return(pTheta)
}

# densidad posterior
posterior <- function(theta, data) {
    posterior <- verosimilitud(theta, data) * previa(theta)
    return(posterior)
}

n_pasos <- 50000

trayectoria <- rep(0, n_pasos)

# Valor inicial
trayectoria[1] <- 0.01

n_aceptados <- 0
n_rechazados <- 0


sigma <- 0.2

for (t in 2:(n_pasos - 1)) {
    pos_actual <- trayectoria[t]
    
    salto_propuesto <- rnorm(1, mean = 0, sd = sigma)
    
    proba_aceptacion <- min(1, posterior(pos_actual + 
        salto_propuesto, datos_observados)/posterior(pos_actual, 
        datos_observados))
    
    # Aceptamos el salto?
    if (runif(1) < proba_aceptacion) {
        # Aceptados
        trayectoria[t + 1] <- pos_actual + salto_propuesto
        n_aceptados <- n_aceptados + 1
    } else {
        # Rechazos
        trayectoria[t + 1] <- pos_actual
        n_rechazados <- n_rechazados + 1
    }
}
```


Obtenemos una tasa de aceptación del 49.4 y tasa de rechazo del 50.59

Podemos desechar los primeros 500 pasos (por ejemplo) del proceso ya que estos son de "calentamiento". De esta forma podremos estimar la media y la varianza de las trayectoria. 


```r
mean(trayectoria[500:n_pasos])
```

```
## [1] 0.6808914
```

```r
sd(trayectoria[500:n_pasos])
```

```
## [1] 0.09721105
```





```r
df <- data.frame(x = 1:n_pasos, P = trayectoria)

ggplot(df[1:500, ]) + geom_line(aes(x, P), size = 0.5) + 
    coord_flip() + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-129-1} \end{center}

```r
ggplot(df[500:n_pasos, ]) + geom_histogram(aes(P, y = ..density..), 
    color = "white") + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-129-2} \end{center}

## Dos monedas

Un problema con el algoritmo de Metropolis-Hastings (M-H) es que solo funciona para la estimación de un solo parámetro.  


El muestreo de Gibbs está pensado en el caso de la estimación de muchos parámetros de forma bastante ordenada.  

Supongamos que tenemos dos monedas y queremos ver la proporción de escudos generados entre las dos monedas: 

Tenemos: 

- Parámetros: \(\theta_{1}\) y \(\theta_{2}\). 
- Datos: \(N_{1}\) tiradas de la moneda 1 y \(N_{2}\) tiradas de la moneda 2. (cada una tuvo \(z_{1}\) y \(z_{2}\) éxitos). 
3. Verosimilitud: Bernoulli. 
\begin{equation*}
y_{1}^{i}\sim \mathrm{Bernoulli}(\theta_{1}) 
\quad 
y_{2}^{i}\sim \mathrm{Bernoulli}(\theta_{2}) 
\end{equation*}


4. Previa: Beta independiente para cada \(\theta\). 
\begin{equation*}
\theta_{1}\sim \mathrm{Beta}(a_{1},b_{1}) 
\quad 
\theta_{2}\sim \mathrm{Beta}(a_{2},b_{2}) 
\end{equation*}

La distribución posterior se puede escribir como 

\begin{align*}
f\left(\theta_{1}, \theta_{2} | D\right) 
&=f\left(D | \theta_{1}, \theta_{2}\right) \frac{f\left(\theta_{1}, \theta_{2}\right)}{f(D)} \\
&=\theta_{1}^{z_{1}}\left(1-\theta_{1}\right)^{N_{1}-z_{1}} \theta_{1}^{z_{2}}\left(1-\theta_{2}\right)^{N_{2}-z_{2}} \frac{f\left(\theta_{1}, \theta_{2}\right)}{f(D)}  \\
&=\frac{\theta_{1}^{z_{1}}\left(1-\theta_{1}\right)^{N_{1}-z_{1}} \theta_{1}^{z_{2}}\left(1-\theta_{2}\right)^{N_{2}-z_{2}} \theta_{1}^{a_{1}-1}\left(1-\theta_{1}\right)^{b_{1}-1} \theta_{2}^{a_{2}-1}\left(1-\theta_{2}\right)^{b_{2}-1}}{f(D) B\left(a_{1}, b_{1}\right) B\left(a_{2}, b_{2}\right)} \\
&=\frac{\theta_{1}^{z_{1}+a_{1}-1}\left(1-\theta_{1}\right)^{N_{1}-z_{1}+b_{1}-1} \theta_{2}^{z_{2}+a_{2}-1}\left(1-\theta_{2}\right)^{N_{2}-z_{2}+b_{2}-1}}{f(D) B\left(a_{1}, b_{1}\right) B\left(a_{2}, b_{2}\right)}
\end{align*}
Entonces la distribución posterior de \(\left(\theta_{1}, \theta_{2}\right)\) son dos distribuciones independientes Betas:
\(\operatorname{Beta}\left(z_{1}+a, N_{1}-z_{1}+b_{1}\right)\) y \(\operatorname{Beta}\left(z_{2}+a, N_{2}-z_{2}+b_{2}\right)\)


Tratemos de encontrar los parámetros para la distribución posterior usando un algoritmo de Metropolis-Hasting. [Función tomada de Kruschke-Notes ](https://rpruim.github.io/Kruschke-Notes/markov-chain-monte-carlo-mcmc.html#metropolis)


```r
metro_2coins <- function(
  z1, n1,              # z = successes, n = trials
  z2, n2,              # z = successes, n = trials
  size  = c(0.1, 0.1), # sds of jump distribution
  start = c(0.5, 0.5), # value of thetas to start at
  num_steps = 5e4,     # number of steps to run the algorithm
  prior1 = dbeta,      # function describing prior
  prior2 = dbeta,      # function describing prior
  args1 = list(),      # additional args for prior1
  args2 = list()      # additional args for prior2
  ) {
  
  theta1            <- rep(NA, num_steps)  # trick to pre-alocate memory
  theta2            <- rep(NA, num_steps)  # trick to pre-alocate memory
  proposed_theta1   <- rep(NA, num_steps)  # trick to pre-alocate memory
  proposed_theta2   <- rep(NA, num_steps)  # trick to pre-alocate memory
  move              <- rep(NA, num_steps)  # trick to pre-alocate memory
  theta1[1]         <- start[1]
  theta2[1]         <- start[2]

  size1 <- size[1] 
  size2 <- size[2] 
  
  for (i in 1:(num_steps-1)) {
    # head to new "island"
    proposed_theta1[i + 1] <- rnorm(1, theta1[i], size1)
    proposed_theta2[i + 1] <- rnorm(1, theta2[i], size2)
    
    if (proposed_theta1[i + 1] <= 0 ||
        proposed_theta1[i + 1] >= 1 ||
        proposed_theta2[i + 1] <= 0 ||
        proposed_theta2[i + 1] >= 1) {
      proposed_posterior <- 0  # because prior is 0
    } else {
      current_prior <- 
        do.call(prior1, c(list(theta1[i]), args1)) *
        do.call(prior2, c(list(theta2[i]), args2))
      current_likelihood  <- 
        dbinom(z1, n1, theta1[i]) *
        dbinom(z2, n2, theta2[i])
      current_posterior   <- current_prior * current_likelihood
      
      proposed_prior <- 
        do.call(prior1, c(list(proposed_theta1[i+1]), args1)) *
        do.call(prior2, c(list(proposed_theta2[i+1]), args2))
      proposed_likelihood  <- 
        dbinom(z1, n1, proposed_theta1[i+1]) *
        dbinom(z2, n2, proposed_theta2[i+1])
      proposed_posterior   <- proposed_prior * proposed_likelihood
    }
    prob_move           <- proposed_posterior / current_posterior
    
    # sometimes we "sail back"
    if (runif(1) > prob_move) { # sail back
       move[i + 1] <- FALSE
      theta1[i + 1] <- theta1[i]
      theta2[i + 1] <- theta2[i]
    } else {                    # stay
       move[i + 1] <- TRUE
      theta1[i + 1] <- proposed_theta1[i + 1]
      theta2[i + 1] <- proposed_theta2[i + 1]
    }
  }
  
  tibble(
    step = 1:num_steps, 
    theta1 = theta1,
    theta2 = theta2,
    proposed_theta1 = proposed_theta1,
    proposed_theta2 = proposed_theta2,
    move = move, 
    size1 = size1,
    size2 = size2
  )
}
```


```r
Metro_2coinsA <- metro_2coins(z1 = 6, n1 = 8, z2 = 2, 
    n2 = 7, size = c(0.02, 0.02), args1 = list(shape1 = 2, 
        shape2 = 2), args2 = list(shape1 = 2, shape2 = 2))

Metro_2coinsA %>% gf_density2d(theta2 ~ theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-131-1} \end{center}

```r
Metro_2coinsA %>% gf_density(~(theta2 - theta1))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-131-2} \end{center}

```r
acf(Metro_2coinsA$theta2 - Metro_2coinsA$theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-131-3} \end{center}



```r
Metro_2coinsA %>% filter(step < 500) %>% gf_path(theta2 ~ 
    theta1, color = ~step, alpha = 0.5, arrow = arrow(type = "open", 
    angle = 30, length = unit(0.1, "inches"))) + theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-132-1} \end{center}


```r
library(gganimate)
Metro_2coinsAplot <- Metro_2coinsA %>% filter(step < 
    500) %>% gf_path(theta2 ~ theta1, color = ~step, 
    alpha = 0.5, arrow = arrow(type = "open", angle = 30)) + 
    theme_minimal() + transition_reveal(step)

animate(Metro_2coinsAplot, fps = 1)
```





```r
Metro_2coinsB <- metro_2coins(z1 = 6, n1 = 8, z2 = 2, 
    n2 = 7, size = c(0.2, 0.2), args1 = list(shape1 = 2, 
        shape2 = 2), args2 = list(shape1 = 2, shape2 = 2))

Metro_2coinsB %>% gf_density2d(theta2 ~ theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-135-1} \end{center}

```r
acf(Metro_2coinsB$theta2 - Metro_2coinsB$theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-135-2} \end{center}


```r
Metro_2coinsB %>% filter(step < 500) %>% gf_path(theta2 ~ 
    theta1, color = ~step, alpha = 0.5, arrow = arrow(type = "open", 
    angle = 30, length = unit(0.1, "inches"))) + theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-136-1} \end{center}


```r
Metro_2coinsBplot <- Metro_2coinsA %>% filter(step < 
    500) %>% gf_path(theta2 ~ theta1, color = ~step, 
    alpha = 0.5, arrow = arrow(type = "open", angle = 30)) + 
    theme_minimal() + transition_reveal(step)

animate(Metro_2coinsBplot, fps = 1)
```


### Muestreo de Gibbs

Para este ejemplo \(\left( \theta_{1},\theta_{2} \right)\), entonces la forma de escoger la posteriores en cada paso sería de la forma:

1. Tome al azar un \(\boldsymbol{\theta}^{0} = \left( \theta_{1}^{0},\theta_{2}^{0} \right)\).
2. Escoja \(\theta_{1}^{1}\) a partir de la distribución
\(f\left(\theta_{1} \vert \theta_{1}=\theta_{1}^{0}, \theta_{2}=\theta_{2}^{0}, \boldsymbol{X}   \right)\).
3. Escoja \(\theta_{2}^{1}\) a partir de la distribución
\(f\left(\theta_{2} \vert \theta_{1}=\theta_{1}^{1}, \theta_{2}=\theta_{2}^{0}, \boldsymbol{X}   \right)\).

Esto completa un ciclo del muestreo. Cada ciclo genera nuevos  \(\boldsymbol{\theta}^{i} = \left( \theta_{1}^{i},\theta_{2}^{i} \right)\) hasta que el proceso converja.


\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Nota: </em></span>  \fi{}En realidad el muestreo de Gibbs se basa en el algoritmo de M-H, con la diferencia que la elección de los parámetros se escogen teniendo en cuanta los datos y fijando los otros parámetros. Es decir,

\begin{align*}
&{\left[\theta_{1} | \theta_{2}, \ldots, \theta_{M}, datos \right]} \\
&{\left[\theta_{2} | \theta_{1}, \theta_{3}, \ldots, \theta_{M}, datos \right]} \\
&{\left[\theta_{M} | \theta_{1}, \ldots, \theta_{M-1}, datos \right]}
\end{align*}
</div>\EndKnitrBlock{remark}

El tratamiento teórico puede ser consultado [https://www.ece.iastate.edu/~namrata/EE527_Spring08/l4c.pdf#page=16](https://www.ece.iastate.edu/~namrata/EE527_Spring08/l4c.pdf#page=16)

\begin{align*}
f\left(\theta_{1} | \theta_{2}, D\right) 
&= \frac{f\left(\theta_{1}, \theta_{2} | D\right)}{f\left(\theta_{2} | D\right)}  \\
&= \frac{f\left(\theta_{1}, \theta_{2} | D\right)}{\int f\left(\theta_{1}, \theta_{2} | D\right)d \theta_{1}}   \\
&=\frac{\operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right) \cdot \operatorname{dbeta}\left(\theta_{2}, z_{2}+a_{2}, N_{2}-z_{2}+b_{2}\right)}{\int  \operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right) \cdot \operatorname{dbeta}\left(\theta_{2} | z_{2}+a_{2}, N_{2}-z_{2}+b_{2}\right)d \theta_{1}} \\
&=\frac{\operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right) \cdot \operatorname{dbeta}\left(\theta_{2}, z_{2}+a_{2}, N_{2}-z_{2}+b_{2}\right)}{\operatorname{dbeta}\left(\theta_{2} | z_{2}+a_{2}, N_{2}-z_{2}+b_{2}\right) \int  \operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right)d \theta_{1}} \\
&=\frac{\operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right)}{\int  \operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right)d \theta_{1}} \\
&=\operatorname{dbeta}\left(\theta_{1}, z_{1}+a_{1}, N_{1}-z_{1}+b_{1}\right)
\end{align*}


```r
gibbs_2coins <- function(
  z1, n1,              # z = successes, n = trials
  z2, n2,              # z = successes, n = trials
  start = c(0.5, 0.5), # value of thetas to start at
  num_steps = 1e4,     # number of steps to run the algorithm
  a1, b1,              # params for prior for theta1
  a2, b2               # params for prior for theta2
  ) {
  
  theta1            <- rep(NA, num_steps)  # trick to pre-alocate memory
  theta2            <- rep(NA, num_steps)  # trick to pre-alocate memory
  theta1[1]         <- start[1]
  theta2[1]         <- start[2]
  
  for (i in 1:(num_steps-1)) {
    if (i %% 2 == 1) { # update theta1
      theta1[i+1] <- rbeta(1, z1 + a1, n1 - z1 + b1)
      theta2[i+1] <- theta2[i]
    } else {           # update theta2
      theta1[i+1] <- theta1[i]
      theta2[i+1] <- rbeta(1, z2 + a2, n2 - z2 + b2)
    }
  }
  
  tibble(
    step = 1:num_steps, 
    theta1 = theta1,
    theta2 = theta2,
  )
}
```



```r
Gibbs <- gibbs_2coins(z1 = 6, n1 = 8, z2 = 2, n2 = 7, 
    a1 = 2, b1 = 2, a2 = 2, b2 = 2)

Gibbs %>% gf_density2d(theta2 ~ theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-140-1} \end{center}

```r
Gibbs %>% gf_dens(~theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-140-2} \end{center}

```r
acf(Gibbs$theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-140-3} \end{center}



```r
Gibbs %>% filter(step < 500) %>% gf_path(theta2 ~ theta1, 
    color = ~step, alpha = 0.5, arrow = arrow(type = "open", 
        angle = 30, length = unit(0.1, "inches"))) + 
    theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-141-1} \end{center}


```r
Gibbsplot <- Gibbs %>% filter(step < 500) %>% gf_path(theta2 ~ 
    theta1, color = ~step, alpha = 0.5, arrow = arrow(type = "open", 
    angle = 30)) + theme_minimal() + transition_reveal(step)

animate(Gibbsplot, fps = 1)
```




Ciclos completos 


```r
Gibbs %>% filter(step%%2 == 0) %>% gf_density2d(theta2 ~ 
    theta1)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-143-1} \end{center}

```r
Gibbs %>% filter(step%%2 == 0) %>% gf_density(~(theta2 - 
    theta1))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-143-2} \end{center}

```r
Gibbs %>% filter(step%%2 == 0) %>% mutate(difference = theta2 - 
    theta1) %>% pull(difference) %>% acf()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-143-3} \end{center}


```r
Gibbs %>% filter(step < 500, step%%2 == 0) %>% gf_path(theta2 ~ 
    theta1, color = ~step, alpha = 0.5, arrow = arrow(type = "open", 
    angle = 30, length = unit(0.1, "inches"))) + theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-144-1} \end{center}


```r
Gibbsplot2 <- Gibbs %>% filter(step < 500, step%%2 == 
    0) %>% gf_path(theta2 ~ theta1, color = ~step, 
    alpha = 0.5, arrow = arrow(type = "open", angle = 30)) + 
    theme_minimal() + transition_reveal(step)

animate(Gibbsplot2, fps = 1)
```

## Uso de JAGS 


El paquete que usaremos en esta sección es `R2jags` y `coda`. Los cargamos con las instrucciones



```r
remotes::install_github("rpruim/CalvinBayes")
```


```r
library(R2jags)
library(coda)
library(CalvinBayes)
```





```r
bernoulli <- read.csv(file = "data/bernoulli.csv", 
    sep = "")
tibble::glimpse(bernoulli)
```

```
## Rows: 50
## Columns: 1
## $ y <int> 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0,...
```

```r
mean(bernoulli$y)
```

```
## [1] 0.3
```

```r
sd(bernoulli$y)
```

```
## [1] 0.46291
```
En el lenguaje usual de JAGS, el modelo debe escribirse de la forma: 

```
model
{
    for (i in 1:N) {
        y[i] ~ dbern(theta)
    }
    theta ~ dbeta(1, 1)
}

```

donde `dbern` y `dbeta` son las densidades de una bernoulli y beta respectivamente. En este lenguage no existen versiones vectorizadas de las funciones por lo que todo debe llenarse usando `for`'s.  Una revisión completa de este lenguage la pueden econtrar en su manual de uso ^[[http://web.sgh.waw.pl/~atoroj/ekonometria_bayesowska/jags_user_manual.pdf](http://web.sgh.waw.pl/~atoroj/ekonometria_bayesowska/jags_user_manual.pdf)]

El paquete `R2jags` tiene la capacidad que en lugar de usar este tipo de sintaxis, se pueda usar el lenguaje natural para escribir el modelo. Note el uso de `function` en este caso. 



```r
bern_model <- function() {
    for (i in 1:N) {
        y[i] ~ dbern(theta)
    }
    theta ~ dbeta(1, 1)
}
```




```r
bern_jags <- jags(data = list(y = bernoulli$y, N = nrow(bernoulli)), 
    model.file = bern_model, parameters.to.save = c("theta"))
```

```
## Compiling model graph
##    Resolving undeclared variables
##    Allocating nodes
## Graph information:
##    Observed stochastic nodes: 50
##    Unobserved stochastic nodes: 1
##    Total graph size: 53
## 
## Initializing model
```

Veamos el resultado 


```r
bern_jags
```

```
## Inference for Bugs model at "/tmp/RtmpEajct8/model3d86204b61d.txt", fit using jags,
##  3 chains, each with 2000 iterations (first 1000 discarded)
##  n.sims = 3000 iterations saved
##          mu.vect sd.vect   2.5%    25%    50%    75%  97.5%  Rhat n.eff
## theta      0.307   0.064  0.189  0.264  0.305  0.349  0.438 1.001  3000
## deviance  62.069   1.368 61.087 61.189 61.530 62.403 65.725 1.001  3000
## 
## For each parameter, n.eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor (at convergence, Rhat=1).
## 
## DIC info (using the rule, pD = var(deviance)/2)
## pD = 0.9 and DIC = 63.0
## DIC is an estimate of expected predictive error (lower deviance is better).
```


```r
head(posterior(bern_jags))
```

```
## Error in verosimilitud(theta, data): argument "data" is missing, with no default
```


```r
gf_dhistogram(~theta, data = posterior(bern_jags), 
    bins = 50) %>% gf_dens(~theta, size = 1.5, alpha = 0.8) %>% 
    gf_dist("beta", shape1 = 16, shape2 = 36, color = "red")
```

```
## Error in verosimilitud(theta, data): argument "data" is missing, with no default
```


```r
bern_mcmc <- as.mcmc(bern_jags)
plot(bern_mcmc)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-154-1} \end{center}


```r
library(bayesplot)
mcmc_areas(bern_mcmc, pars = c("theta"), prob = 0.9)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-155-1} \end{center}


```r
mcmc_trace(bern_mcmc, pars = "theta")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-156-1} \end{center}


```r
mcmc_trace(bern_mcmc, pars = "theta") %>% gf_facet_grid(Chain ~ 
    .) %>% gf_refine(scale_color_viridis_d())
```

```
## Error: At least one layer must contain all faceting variables: `Chain`.
## * Plot is missing `Chain`
## * Layer 1 is missing `Chain`
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-157-1} \end{center}


```r
plot_post(bern_mcmc[, "theta"], main = "theta", xlab = expression(theta), 
    cenTend = "median", compVal = 0.5, ROPE = c(0.45, 
        0.55), credMass = 0.9, quietly = TRUE)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-158-1} \end{center}


```r
twobernoulli <- read.csv("data/2bernoulli.csv")

knitr::kable(twobernoulli)
```


\begin{tabular}{r|l}
\hline
y & s\\
\hline
1 & Reginald\\
\hline
0 & Reginald\\
\hline
1 & Reginald\\
\hline
1 & Reginald\\
\hline
1 & Reginald\\
\hline
1 & Reginald\\
\hline
1 & Reginald\\
\hline
0 & Reginald\\
\hline
0 & Tony\\
\hline
0 & Tony\\
\hline
1 & Tony\\
\hline
0 & Tony\\
\hline
0 & Tony\\
\hline
1 & Tony\\
\hline
0 & Tony\\
\hline
\end{tabular}

```r
Target <- twobernoulli %>% rename(hit = y, subject = s)

Target %>% group_by(subject) %>% summarise(prop_0 = sum(1 - 
    hit)/n(), prop_1 = sum(hit)/n(), attemps = n())
```

```
## # A tibble: 2 x 4
##   subject  prop_0 prop_1 attemps
##   <chr>     <dbl>  <dbl>   <int>
## 1 Reginald  0.25   0.75        8
## 2 Tony      0.714  0.286       7
```


```r
bern2_model <- function() {
    for (i in 1:Nobs) {
        # each response is Bernoulli with the appropriate
        # theta
        hit[i] ~ dbern(theta[subject[i]])
    }
    for (s in 1:Nsub) {
        theta[s] ~ dbeta(2, 2)  # prior for each theta
    }
}
```


```r
TargetList <- list(Nobs = nrow(Target), Nsub = 2, hit = Target$hit, 
    subject = as.numeric(as.factor(Target$subject)))
TargetList
```

```
## $Nobs
## [1] 15
## 
## $Nsub
## [1] 2
## 
## $hit
##  [1] 1 0 1 1 1 1 1 0 0 0 1 0 0 1 0
## 
## $subject
##  [1] 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2
```


```r
bern2_jags <- jags(data = TargetList, model = bern2_model, 
    parameters.to.save = "theta")
```

```
## Compiling model graph
##    Resolving undeclared variables
##    Allocating nodes
## Graph information:
##    Observed stochastic nodes: 15
##    Unobserved stochastic nodes: 2
##    Total graph size: 35
## 
## Initializing model
```



```r
bern2_mcmc <- as.mcmc(bern2_jags)

mcmc_acf(bern2_mcmc)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-163-1} \end{center}

```r
mcmc_combo(bern2_mcmc, combo = c("dens", "dens_overlay", 
    "trace", "scatter"), pars = c("theta[1]", "theta[2]"))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-163-2} \end{center}

## Uso de STAN

STAN^[[https://mc-stan.org/](https://mc-stan.org/)] es otro tipo de lenguaje para definir modelos bayesiano. El lenguaje es un poco más sencillo, pero es particularmente útil para modelos bastante complejos. 

STAN no usa el muestreo de Gibbs, sino en el método de Monte-Carlo Hamiltoniano. En el artículo [@Hoffman2014]  se propone el método NUTS para mejorar el muestreo de Gibbs. 

En este curso no nos referiremos a este procedimiento, pero si veremos un poco de la sintaxis del lenguaje STAN.


```stan
data {
  int<lower=0> N;               // number of trials
  int<lower=0, upper=1> y[N];   // success on trial n
}

parameters {
  real<lower=0, upper=1> theta; // chance of success
}

model {
  theta ~ uniform(0, 1);        // prior
  y ~ bernoulli(theta);         // likelihood
}
```





```r
library(rstan)

fit <- stan(model_code = bern_stan@model_code, data = list(y = bernoulli$y, 
    N = nrow(bernoulli)), iter = 5000)
```

```
## 
## SAMPLING FOR MODEL '4584de91ce47196187979d2da8a67926' NOW (CHAIN 1).
## Chain 1: 
## Chain 1: Gradient evaluation took 1.5e-05 seconds
## Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.15 seconds.
## Chain 1: Adjust your expectations accordingly!
## Chain 1: 
## Chain 1: 
## Chain 1: Iteration:    1 / 5000 [  0%]  (Warmup)
## Chain 1: Iteration:  500 / 5000 [ 10%]  (Warmup)
## Chain 1: Iteration: 1000 / 5000 [ 20%]  (Warmup)
## Chain 1: Iteration: 1500 / 5000 [ 30%]  (Warmup)
## Chain 1: Iteration: 2000 / 5000 [ 40%]  (Warmup)
## Chain 1: Iteration: 2500 / 5000 [ 50%]  (Warmup)
## Chain 1: Iteration: 2501 / 5000 [ 50%]  (Sampling)
## Chain 1: Iteration: 3000 / 5000 [ 60%]  (Sampling)
## Chain 1: Iteration: 3500 / 5000 [ 70%]  (Sampling)
## Chain 1: Iteration: 4000 / 5000 [ 80%]  (Sampling)
## Chain 1: Iteration: 4500 / 5000 [ 90%]  (Sampling)
## Chain 1: Iteration: 5000 / 5000 [100%]  (Sampling)
## Chain 1: 
## Chain 1:  Elapsed Time: 0.016561 seconds (Warm-up)
## Chain 1:                0.015825 seconds (Sampling)
## Chain 1:                0.032386 seconds (Total)
## Chain 1: 
## 
## SAMPLING FOR MODEL '4584de91ce47196187979d2da8a67926' NOW (CHAIN 2).
## Chain 2: 
## Chain 2: Gradient evaluation took 5e-06 seconds
## Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.05 seconds.
## Chain 2: Adjust your expectations accordingly!
## Chain 2: 
## Chain 2: 
## Chain 2: Iteration:    1 / 5000 [  0%]  (Warmup)
## Chain 2: Iteration:  500 / 5000 [ 10%]  (Warmup)
## Chain 2: Iteration: 1000 / 5000 [ 20%]  (Warmup)
## Chain 2: Iteration: 1500 / 5000 [ 30%]  (Warmup)
## Chain 2: Iteration: 2000 / 5000 [ 40%]  (Warmup)
## Chain 2: Iteration: 2500 / 5000 [ 50%]  (Warmup)
## Chain 2: Iteration: 2501 / 5000 [ 50%]  (Sampling)
## Chain 2: Iteration: 3000 / 5000 [ 60%]  (Sampling)
## Chain 2: Iteration: 3500 / 5000 [ 70%]  (Sampling)
## Chain 2: Iteration: 4000 / 5000 [ 80%]  (Sampling)
## Chain 2: Iteration: 4500 / 5000 [ 90%]  (Sampling)
## Chain 2: Iteration: 5000 / 5000 [100%]  (Sampling)
## Chain 2: 
## Chain 2:  Elapsed Time: 0.015872 seconds (Warm-up)
## Chain 2:                0.019947 seconds (Sampling)
## Chain 2:                0.035819 seconds (Total)
## Chain 2: 
## 
## SAMPLING FOR MODEL '4584de91ce47196187979d2da8a67926' NOW (CHAIN 3).
## Chain 3: 
## Chain 3: Gradient evaluation took 8e-06 seconds
## Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.08 seconds.
## Chain 3: Adjust your expectations accordingly!
## Chain 3: 
## Chain 3: 
## Chain 3: Iteration:    1 / 5000 [  0%]  (Warmup)
## Chain 3: Iteration:  500 / 5000 [ 10%]  (Warmup)
## Chain 3: Iteration: 1000 / 5000 [ 20%]  (Warmup)
## Chain 3: Iteration: 1500 / 5000 [ 30%]  (Warmup)
## Chain 3: Iteration: 2000 / 5000 [ 40%]  (Warmup)
## Chain 3: Iteration: 2500 / 5000 [ 50%]  (Warmup)
## Chain 3: Iteration: 2501 / 5000 [ 50%]  (Sampling)
## Chain 3: Iteration: 3000 / 5000 [ 60%]  (Sampling)
## Chain 3: Iteration: 3500 / 5000 [ 70%]  (Sampling)
## Chain 3: Iteration: 4000 / 5000 [ 80%]  (Sampling)
## Chain 3: Iteration: 4500 / 5000 [ 90%]  (Sampling)
## Chain 3: Iteration: 5000 / 5000 [100%]  (Sampling)
## Chain 3: 
## Chain 3:  Elapsed Time: 0.020457 seconds (Warm-up)
## Chain 3:                0.017149 seconds (Sampling)
## Chain 3:                0.037606 seconds (Total)
## Chain 3: 
## 
## SAMPLING FOR MODEL '4584de91ce47196187979d2da8a67926' NOW (CHAIN 4).
## Chain 4: 
## Chain 4: Gradient evaluation took 4e-06 seconds
## Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.04 seconds.
## Chain 4: Adjust your expectations accordingly!
## Chain 4: 
## Chain 4: 
## Chain 4: Iteration:    1 / 5000 [  0%]  (Warmup)
## Chain 4: Iteration:  500 / 5000 [ 10%]  (Warmup)
## Chain 4: Iteration: 1000 / 5000 [ 20%]  (Warmup)
## Chain 4: Iteration: 1500 / 5000 [ 30%]  (Warmup)
## Chain 4: Iteration: 2000 / 5000 [ 40%]  (Warmup)
## Chain 4: Iteration: 2500 / 5000 [ 50%]  (Warmup)
## Chain 4: Iteration: 2501 / 5000 [ 50%]  (Sampling)
## Chain 4: Iteration: 3000 / 5000 [ 60%]  (Sampling)
## Chain 4: Iteration: 3500 / 5000 [ 70%]  (Sampling)
## Chain 4: Iteration: 4000 / 5000 [ 80%]  (Sampling)
## Chain 4: Iteration: 4500 / 5000 [ 90%]  (Sampling)
## Chain 4: Iteration: 5000 / 5000 [100%]  (Sampling)
## Chain 4: 
## Chain 4:  Elapsed Time: 0.01831 seconds (Warm-up)
## Chain 4:                0.015764 seconds (Sampling)
## Chain 4:                0.034074 seconds (Total)
## Chain 4:
```

```r
print(fit, probs = c(0.1, 0.9))
```

```
## Inference for Stan model: 4584de91ce47196187979d2da8a67926.
## 4 chains, each with iter=5000; warmup=2500; thin=1; 
## post-warmup draws per chain=2500, total post-warmup draws=10000.
## 
##         mean se_mean   sd    10%    90% n_eff Rhat
## theta   0.31    0.00 0.06   0.23   0.39  3136    1
## lp__  -32.60    0.01 0.72 -33.49 -32.11  4750    1
## 
## Samples were drawn using NUTS(diag_e) at Wed Jun 17 15:30:58 2020.
## For each parameter, n_eff is a crude measure of effective sample size,
## and Rhat is the potential scale reduction factor on split chains (at 
## convergence, Rhat=1).
```

```r
theta_draws <- extract(fit)$theta

mean(theta_draws)
```

```
## [1] 0.3074515
```

```r
quantile(theta_draws, probs = c(0.1, 0.9))
```

```
##       10%       90% 
## 0.2282770 0.3911384
```



```r
shinystan::launch_shinystan(fit)
```


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-167"><strong>(\#exr:unnamed-chunk-167) </strong></span>
Replique los resultados anteriores pero para el caso de 2 monedas y comente los resultados. 
</div>\EndKnitrBlock{exercise}



## Ejercicios 

1. Del libro [@Albert2009] 
   - **Sección 3:** 3, 7.
   - **Sección 6:** 1, 3.
2. Del libro [@Kruschke2014] 
   - **Sección 6:** 2.
   - **Sección 7:** 2.

<!--chapter:end:03-estimacion-densidades-bayes.Rmd-->

---
output:
  pdf_document: default
  html_document: default
---

# Métodos lineares de regresión

**NOTA: Para los siguientes capítulos nos basaremos en los libros [@Hastie2009a] y [@James2013b].**


## Introducción 

Supongamos que tenemos \(p\) variables de entrada que mezcladas  con alguna relación desconocida y que provocan una respuesta \(Y\) de salida. 

\begin{equation}
Y = f(X_{1},\ldots,X_{p}) + \varepsilon
(\#eq:regresion-general)
\end{equation}


Aquí \(f\) es deconocida, las variables \(X\)'s son las variables de entrada y  \(\varepsilon\) es el error cometido por hacer esta aproximación.  



Hay dos motivos para estimar \(f\)

1. **Predicción:** Si se estima \(f\) con \(\hat{f}\) entonces
\begin{equation*}
\hat{Y} = \hat{f}(X_{1},\ldots,X_{p}). 
\end{equation*}

Y si tuvieramos valores nuevos de los \(X\)'s entonces podríamos estimar el valor que el corresponde a \(Y\). 

Aquí lo importante es que los resultados sean preciso: 

  a. **Error reducible:** Error de \(\hat{f}\) alrededor de \(f\). 
  a. **Error irreducible:** Error propio de las observaciones (muestreo). 

\begin{align*}
\mathbb{E}\left[\hat{Y}-Y\right] 
&=  \mathbb{E}\left[\left(  f(X_{1},\ldots,X_{p}) + \varepsilon - \hat{f}(X_{1},\ldots,X_{p}) \right)^{2}  \right] \\
&= \underbrace{\left( f(X_{1},\ldots,X_{p})- \hat{f}(X_{1},\ldots,X_{p})  \right) ^{2} }_{\text{Reducible}}
+\underbrace{\mathrm{Var}\left(\varepsilon\right)}_{\text{irreducible}}. 
\end{align*}


2. **Inferencia:**  Entender la relación entre \(X\) y \(Y\). 

- ¿Cuál es la relación entre las variables predictoras y la respuesta?
- ¿Cuáles son más importantes?
- ¿El modelo es correcto?

## Regresión lineal

El caso más sencillo es cuando esta relación es lineal y se describe de la siguiente forma 

\begin{equation*}
Y = \beta_{0} + \beta_{1}X_{1} + \cdots +  \beta_{1}X_{1} + \varepsilon.
\end{equation*} 
 
 Aquí los valores \(\beta\)'s son constantes a estimar, las variables \(X\)'s son las variables de entrada y  \(\varepsilon\) es el error cometido por hacer esta aproximación. 
 

Los \(X\)'s pueden ser 

1. Cuantitativos o Transformaciones. 
1. Cualitativos. 

En el caso de ser cualititativos existe un truco para incluirlos dentro de la regresión 

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:unnamed-chunk-169"><strong>(\#exm:unnamed-chunk-169) </strong></span>Se tiene la variable \(G\) codificada con Casado (1), Soltero (2), Divorciado (3) y Unión Libre (4). Si queremos meter esta variable en una regresión debemos tomarla de la forma 

\begin{equation*}
X_{j} = \mathbf{1}_{\{G=j+1\}} 
\end{equation*} 

que resulta en la matriz 

\begin{equation*}
\begin{matrix}
X_{1} & X_{2} & X_{3}\\
0 & 0 & 0 \\
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1 \\
\end{matrix}
\end{equation*}

Existen otras formas de codificar este tipo de variables, pero esa es la más común. 
</div>\EndKnitrBlock{example}


### Forma matricial

Podemos escribir la regresión de la forma 

\begin{equation*}
\boldsymbol{Y} = \boldsymbol{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}
\end{equation*}

donde 

\begin{multline*}
\boldsymbol{Y} = 
\begin{pmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{pmatrix}_{n\times 1} 
\quad 
\boldsymbol{Y} = 
\begin{pmatrix}
1 & X_{1,1} & \cdots & X_{p,1} \\
\vdots & \vdots & \cdots & \vdots\\
1 & X_{1,n}& \cdots & X_{p,n}
\end{pmatrix}_{n\times (p+1)}
\\
\boldsymbol{\varepsilon} = 
\begin{pmatrix}
\varepsilon_{1} \\
\vdots \\
\varepsilon_{n}
\end{pmatrix}_{n\times 1} 
\quad 
\boldsymbol{\beta} = 
\begin{pmatrix}
\beta_{0} \\
\beta_{1} \\
\vdots \\
\beta_{p}
\end{pmatrix}_{(p+1)\times 1} 
\end{multline*}

Suponemos que \(\mathbb{E}\left[\varepsilon_{i}\right] = 0\) y \(\mathrm{Var}\left(\varepsilon_{i}\right) = \sigma^{2}\)

La forma de resolver este problema es  por minimos cuadrados.  Es decir, buscamos el \(\hat{\beta}\) que cumpla lo siguiente:


\begin{align}
\hat{\beta} &= 
 \operatorname{argmin}_\beta (\boldsymbol{Y} - \boldsymbol{X} \boldsymbol{\beta})^{\top} (\boldsymbol{Y} - \boldsymbol{X} \boldsymbol{\beta})\\
 &=  \operatorname{argmin}_\beta \sum_{i=1}^n \left( Y_{i} -\beta_{0} - \sum_{j=1}^p X_{j,i} \beta_{j} \right) 
 (\#eq:minimos-cuadrados)
 \end{align}


![Tomado de https://www.wikiwand.com/en/Ordinary_least_squares](manual_figures/ols.png)

Suponga que \(\gamma\) es un vector cualquiera en \(\mathbb{R}^{p+1}\)  y tenemos a \(V = \{\boldsymbol{X}\boldsymbol{\gamma}, \gamma \in \mathbb{R}^{p+1}\}\).

\begin{align*}
\boldsymbol{X}\boldsymbol{\beta}
 &= \operatorname{Proy}_{V} \boldsymbol{Y}
\end{align*}

Entonces dado que 
\begin{equation*}
\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta} \perp V \\
\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta} \perp \boldsymbol{X}\boldsymbol{\gamma}, \forall \boldsymbol{\gamma} \in \mathbb{R}^{p+1}.
\end{equation*}


\begin{align*}
<\boldsymbol{X}\boldsymbol{\gamma}, \boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta} > &=  0 \\
 \boldsymbol{\gamma}^{\top}\boldsymbol{X}^{\top}(\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta}) &=  0 \\
 \boldsymbol{\gamma}^{\top}\boldsymbol{X}^{\top}\boldsymbol{Y} &= \boldsymbol{\gamma}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X}\boldsymbol{\beta}  \\
  \boldsymbol{X}^{\top}\boldsymbol{Y} &=  \boldsymbol{X}^{\top} \boldsymbol{X}\boldsymbol{\beta}  \\
  \boldsymbol{\beta}  &=  (\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\boldsymbol{Y} 
\end{align*}

Donde \(\boldsymbol{X}^{\top} \boldsymbol{X}\) debe ser invertible. Si no es así, se puede construir su inversa generalizada pero no garantiza la unicidad de los \(\beta\)'s. Es decir, puede existir \(\hat{\beta} \neq \tilde{\beta}\) tal que \(\boldsymbol{X}\boldsymbol{\hat{\beta}} = \boldsymbol{X}\boldsymbol{\tilde{\beta}} \)



En el caso de predicción tenemos que 

\begin{align*}
\hat{Y} &=  X\beta \\
&= \boldsymbol{X}(\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\boldsymbol{Y} \\
&=  H \boldsymbol{Y} 
\end{align*}

Donde \(H\) es la matriz "techo" o  "hat". Es la proyección de Y al espacio de las columnas de \(X\).

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-170"><strong>(\#exr:unnamed-chunk-170) </strong></span>Suponga que tenemos la regresión simple

\begin{equation*}
Y = \beta_{0} + \beta_{1}X_{1}+\varepsilon.
\end{equation*}


Muestre que \(\beta_{0}\) y \(\beta_{1}\) son 

Para el caso de la regresión simple tenemos que 

\begin{align*}
\hat{\beta}_{1}&= \frac{\sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)\left(Y_{i}-\overline{Y}\right)}{\sum_{i=1}^{n}\left(X_{i}-\overline{x}\right)^{2}} \\ 
\hat{\beta}_{0}&= \bar{Y}-\widehat{\beta}_{1} \bar{X}
\end{align*}

usando los siguiente métodos:

1. El método de proyecciones. 
2. Minimizando el criterio de mínimos cuadrados. Ecuación \@ref(eq:minimos-cuadrados).
</div>\EndKnitrBlock{exercise}

### Laboratorio

Usemos la base `mtcars` para los siguientes ejemplos. Toda la información de esta base se encuentra en `?mtcars`. 



```r
mtcars <- within(mtcars, {
    vs <- factor(vs, labels = c("V-Shape", "Straight-Line"))
    am <- factor(am, labels = c("automatic", "manual"))
    cyl <- factor(cyl)
    gear <- factor(gear)
    carb <- factor(carb)
})

head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec            vs        am
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46       V-Shape    manual
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02       V-Shape    manual
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61 Straight-Line    manual
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44 Straight-Line automatic
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02       V-Shape automatic
## Valiant           18.1   6  225 105 2.76 3.460 20.22 Straight-Line automatic
##                   gear carb
## Mazda RX4            4    4
## Mazda RX4 Wag        4    4
## Datsun 710           4    1
## Hornet 4 Drive       3    1
## Hornet Sportabout    3    2
## Valiant              3    1
```

```r
summary(mtcars)
```

```
##       mpg        cyl         disp             hp             drat      
##  Min.   :10.40   4:11   Min.   : 71.1   Min.   : 52.0   Min.   :2.760  
##  1st Qu.:15.43   6: 7   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080  
##  Median :19.20   8:14   Median :196.3   Median :123.0   Median :3.695  
##  Mean   :20.09          Mean   :230.7   Mean   :146.7   Mean   :3.597  
##  3rd Qu.:22.80          3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920  
##  Max.   :33.90          Max.   :472.0   Max.   :335.0   Max.   :4.930  
##        wt             qsec                   vs             am     gear  
##  Min.   :1.513   Min.   :14.50   V-Shape      :18   automatic:19   3:15  
##  1st Qu.:2.581   1st Qu.:16.89   Straight-Line:14   manual   :13   4:12  
##  Median :3.325   Median :17.71                                     5: 5  
##  Mean   :3.217   Mean   :17.85                                           
##  3rd Qu.:3.610   3rd Qu.:18.90                                           
##  Max.   :5.424   Max.   :22.90                                           
##  carb  
##  1: 7  
##  2:10  
##  3: 3  
##  4:10  
##  6: 1  
##  8: 1
```

Observemos las relaciones generales de las variables de esta base de datos 


```r
ggplot(mtcars) + geom_point(aes(wt, mpg)) + theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-172-1} \end{center}

El objetivo es tratar la eficiencia del automovil `mpg` con respecto a su peso `wt`. 


Usaremos una regresión lineal para encontrar los coeficientes. 

Primero hay que construir la matriz de diseño


```r
X <- mtcars$wt
head(X)
```

```
## [1] 2.620 2.875 2.320 3.215 3.440 3.460
```

```r
Y <- mtcars$mpg
head(Y)
```

```
## [1] 21.0 21.0 22.8 21.4 18.7 18.1
```

```r
(beta1 <- solve(t(X) %*% X) %*% t(X) %*% Y)
```

```
##          [,1]
## [1,] 5.291624
```

```r
dfreg <- data.frame(x = X, yreg = X %*% beta1) %>% 
    arrange(x)
```

```r
ggplot(data = data.frame(x = X, y = Y)) + geom_point(aes(x, 
    y)) + geom_line(data = dfreg, aes(x, yreg), color = "red") + 
    theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-174-1} \end{center}



```r
X <- cbind(1, mtcars$wt)
head(X)
```

```
##      [,1]  [,2]
## [1,]    1 2.620
## [2,]    1 2.875
## [3,]    1 2.320
## [4,]    1 3.215
## [5,]    1 3.440
## [6,]    1 3.460
```

```r
Y <- mtcars$mpg
head(Y)
```

```
## [1] 21.0 21.0 22.8 21.4 18.7 18.1
```

```r
(beta01 <- solve(t(X) %*% X) %*% t(X) %*% Y)
```

```
##           [,1]
## [1,] 37.285126
## [2,] -5.344472
```

```r
dfreg <- data.frame(x = X, yreg = X %*% beta01) %>% 
    arrange(x.2)
```

```r
ggplot(data = data.frame(x0 = X[, 1], x1 = X[, 2], 
    y = Y)) + geom_point(aes(x1, y)) + geom_line(data = dfreg, 
    aes(x.2, yreg), color = "red") + theme_minimal()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-176-1} \end{center}

Ojo obviamente esto se puede hacer más fácil con los siguientes comandos


```r
lm(mpg ~ -1 + wt, data = mtcars)
```

```
## 
## Call:
## lm(formula = mpg ~ -1 + wt, data = mtcars)
## 
## Coefficients:
##    wt  
## 5.292
```

```r
lm(mpg ~ wt, data = mtcars)
```

```
## 
## Call:
## lm(formula = mpg ~ wt, data = mtcars)
## 
## Coefficients:
## (Intercept)           wt  
##      37.285       -5.344
```

Suponga que queremos incluir una variable categorica como `cyl` (Número de cilindros).  Lo que se debe hacer es convertir esta variable a dummy. 


```r
X <- model.matrix(mpg ~ cyl, data = mtcars)

head(X)
```

```
##                   (Intercept) cyl6 cyl8
## Mazda RX4                   1    1    0
## Mazda RX4 Wag               1    1    0
## Datsun 710                  1    0    0
## Hornet 4 Drive              1    1    0
## Hornet Sportabout           1    0    1
## Valiant                     1    1    0
```

```r
(betas <- solve(t(X) %*% X) %*% t(X) %*% Y)
```

```
##                   [,1]
## (Intercept)  26.663636
## cyl6         -6.920779
## cyl8        -11.563636
```

```r
(cylreg <- lm(mpg ~ cyl, data = mtcars))
```

```
## 
## Call:
## lm(formula = mpg ~ cyl, data = mtcars)
## 
## Coefficients:
## (Intercept)         cyl6         cyl8  
##      26.664       -6.921      -11.564
```

```r
(betaslm <- coefficients(cylreg))
```

```
## (Intercept)        cyl6        cyl8 
##   26.663636   -6.920779  -11.563636
```


```r
# Efecto cyl4: cyl4 = 1, cyl6 = 0, cyl8 = 0

betaslm[1]
```

```
## (Intercept) 
##    26.66364
```

```r
# Efecto cyl6: cyl4 = 1, cyl6 = 1, cyl8 = 0

betaslm[1] + betaslm[2]
```

```
## (Intercept) 
##    19.74286
```

```r
# Efecto cyl8: cyl4 = 1, cyl6 = 0, cyl8 = 1

betaslm[1] + betaslm[3]
```

```
## (Intercept) 
##        15.1
```



## Propiedades estadísticas 

Uno de los supuestos fundamentales de regresión lineal es que 

\begin{equation*}
\varepsilon\sim \mathcal{N}\left(0,\sigma^{2}I\right)
\end{equation*} . 

En ese caso 

\begin{equation*}
Y = X\beta + \varepsilon \sim \mathcal{N}\left(X\beta,\sigma^{2}I\right)
\end{equation*} 

Y además 

\begin{align*}
\hat{\beta} &=  (X^{\top}X)^{-1}X^{\top}Y \\
&\sim  \mathcal{N}\left((X^{\top}X)^{-1}X^{\top}X\beta,((X^{\top}X)^{-1}X^{\top})\sigma I ((X^{\top}X)^{-1}X^{\top})^{\top}\right) \\
&\sim  \mathcal{N}\left(\beta,\sigma (X^{\top}X)^{-1}\right) \\
\end{align*}

Es decir, que 

\begin{align*}
\mathbb{E}\left[\hat{\beta}\right] &= \beta \\
\operatorname{Var}(\hat{\beta}) &=  \sigma^{2}\left(X^{\top} X\right)^{-1}
\end{align*}

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-180"><strong>(\#exr:unnamed-chunk-180) </strong></span>Encuentre la varianza para \(\beta_{0}\) y \(\beta_{1}\) para el caso de la regresión simple. </div>\EndKnitrBlock{exercise}
 
 La estimación de \(\sigma^{2}\) 
 
 \begin{align*}
 \hat{\sigma}^{2} 
 &=  \frac{1}{n-p-1} \sum_{i=1}^{n} \left( Y_{i} - \hat{Y}_{i}\right)^{2} \\
 &= \frac{1}{n-p-1}\left\Vert Y - X\hat{\beta} \right\Vert^{2} \\
 &=   \frac{1}{n-p-1} \left\Vert Y-\operatorname{Proy}_{V}Y \right\Vert^{2} 
 \end{align*}
 
 Otra forma de verlo es 
 \begin{align*}
Y-\operatorname{Proy}_{V}Y  
&= X\beta + \varepsilon -  \operatorname{Proy}_{V}( X\beta + \varepsilon) \\
&= X\beta - \operatorname{Proy}_{V}( \underbrace{X\beta}_{\in V}) + \varepsilon - \underbrace{\operatorname{Proy}_{V}( \varepsilon)}_{=0} \\
&= X\beta -X\beta + \varepsilon \\
&=  \operatorname{Proy}_{V^{\top}}( \varepsilon)
 \end{align*}

\begin{equation*}
\hat{\sigma}^{2} 
= \frac{1}{dim(V^{\top})}\left\Vert \operatorname{Proy}_{V^{\top}}\varepsilon\right\Vert \\
\end{equation*}
 
 
 Cumple con la propiedad que \(\mathbb{E}\left[\hat{\sigma}^{}\right] = \sigma^{2}\). 
 
 Y además \((n-p-1)\hat{\sigma}^{2} \sim \sigma^{2} \chi^{2}_{n-p-1}.\)
 
 
### Prueba \(t\)
 
 Dado que los coeficientes \(\beta\) son normales, se puede hacer la prueba de hipotesis 
 
 \begin{equation*}
 H_{0}: \beta_{j} = 0 \quad \text{ vs } \quad H_{1}:\beta_{j}\neq 0.
 \end{equation*}
 
 El estadístico es 
 
 \begin{equation*}
 z_{j} = \frac{\hat{\beta}_{j}}{\hat{\sigma} \sqrt{v_{j}}} 
 \end{equation*}
 
 donde \(v_{j}\) es el \(j\)-esimo elemento de la diagonal de \((X^{\top}X)^{-1}\).
 
 Bajo \(H_{0}\) \(z_{j} \sim t_{n-p-1}\) y se rechaza \(H_{0}\) si 
 
 \begin{equation*}
 \left\vert z_{j} \right\vert > t_{n-p-1, 1-\frac{\alpha}{2}} 
 \end{equation*}
 
### Prueba \(F\)
 
 \begin{equation*}
 H_{0}: \beta_{1} = \cdots =\beta_{p} = 0 \quad 
 \text{  vs   }\quad H_{1}: \text{ al menos un \(\beta\) no es cero}.
 \end{equation*}
 
 
 En este caso queremos comparar el modelo  nulo \(Y=\beta_{0}+\varepsilon\) contra el modelo completo \(Y=\beta_{0}+ \beta_{1}X_{1} + \cdots + \beta_{p}X_{p} + \varepsilon\). 
 
 Defina 
 
 \begin{align*}
 TSS &= \sum_{i=1}^{n} \left( Y_{i} -\overline{Y} \right)^{2} \\
 RSS &= \sum_{i=1}^{n} \left( Y_{i} -\overline{Y} \right)^{2} \\
 \end{align*}
 
 TSS = Total sum of squares 
 
 RSS =  Residual sum of squares 
 
 Entonces 
 
 \begin{equation*}
 F = \frac{\frac{TSS-RSS}{p}}{\frac{RSS}{n-p-1}} \sim \frac{\chi^{2}_{p}}{\chi^{2}_{n-p-1}}.
 \end{equation*}
 
 Rechazamos \(H_{0}\) si 
 
 \begin{equation*}
 F > F_{p, n-p-1, 1-\alpha}.
 \end{equation*}
 
###  Laboratorio


Siguiendo con nuestro ejemplo, vamos a explorar un poco más la función `lm`. 

```r
fit <- lm(mpg ~ wt, data = mtcars)
summary(fit)
```

```
## 
## Call:
## lm(formula = mpg ~ wt, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
## 
## Coefficients:
##             Estimate Std. Error t value             Pr(>|t|)    
## (Intercept)  37.2851     1.8776  19.858 < 0.0000000000000002 ***
## wt           -5.3445     0.5591  -9.559       0.000000000129 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.046 on 30 degrees of freedom
## Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7446 
## F-statistic: 91.38 on 1 and 30 DF,  p-value: 0.0000000001294
```

```r
fit <- lm(mpg ~ wt + cyl, data = mtcars)
summary(fit)
```

```
## 
## Call:
## lm(formula = mpg ~ wt + cyl, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5890 -1.2357 -0.5159  1.3845  5.7915 
## 
## Coefficients:
##             Estimate Std. Error t value             Pr(>|t|)    
## (Intercept)  33.9908     1.8878  18.006 < 0.0000000000000002 ***
## wt           -3.2056     0.7539  -4.252             0.000213 ***
## cyl6         -4.2556     1.3861  -3.070             0.004718 ** 
## cyl8         -6.0709     1.6523  -3.674             0.000999 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.557 on 28 degrees of freedom
## Multiple R-squared:  0.8374,	Adjusted R-squared:   0.82 
## F-statistic: 48.08 on 3 and 28 DF,  p-value: 0.00000000003594
```

```r
fit <- lm(mpg ~ ., data = mtcars)
summary(fit)
```

```
## 
## Call:
## lm(formula = mpg ~ ., data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.5087 -1.3584 -0.0948  0.7745  4.6251 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)  
## (Intercept)     23.87913   20.06582   1.190   0.2525  
## cyl6            -2.64870    3.04089  -0.871   0.3975  
## cyl8            -0.33616    7.15954  -0.047   0.9632  
## disp             0.03555    0.03190   1.114   0.2827  
## hp              -0.07051    0.03943  -1.788   0.0939 .
## drat             1.18283    2.48348   0.476   0.6407  
## wt              -4.52978    2.53875  -1.784   0.0946 .
## qsec             0.36784    0.93540   0.393   0.6997  
## vsStraight-Line  1.93085    2.87126   0.672   0.5115  
## ammanual         1.21212    3.21355   0.377   0.7113  
## gear4            1.11435    3.79952   0.293   0.7733  
## gear5            2.52840    3.73636   0.677   0.5089  
## carb2           -0.97935    2.31797  -0.423   0.6787  
## carb3            2.99964    4.29355   0.699   0.4955  
## carb4            1.09142    4.44962   0.245   0.8096  
## carb6            4.47757    6.38406   0.701   0.4938  
## carb8            7.25041    8.36057   0.867   0.3995  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.833 on 15 degrees of freedom
## Multiple R-squared:  0.8931,	Adjusted R-squared:  0.779 
## F-statistic:  7.83 on 16 and 15 DF,  p-value: 0.000124
```

## Medida de bondad de ajuste

La prueba $F$ nos dice si un modelo es nulo o no, pero no nos dice si tengo dos modelos cuál es mejor que otro. 

Hay varias medidas para comparar modelos (la veremos con más detalle en otro capítulo):

- Error estándar residual (\(\sigma\))
- $R^{2}$ y $R^{2}$ ajustado
- \(C_{p}\) de Mallows
- Akaike Information Criterion (AIC)
- Bayesian Information Criterion (BIC)

Los índices \(C_{p}\) de Mallows, AIC y BIC los veremos después. 

Error estándar residual
: Se define como 

\begin{align*}
\mathrm{RSE} 
&=  \sqrt{\hat{\sigma^{2}}}\\
&= \sqrt{\frac{1}{n-p-1} \sum_{i=1}^{n} \left( Y_{i} - \hat{Y}_{i}\right)^{2}} \\
&= \sqrt{\frac{\mathrm{RSS}}{n-p-1}}
\end{align*}

Entre más pequeño mejor, pero **depende de las unidades de \(Y\)**.

Estadístico \(R^{2}\) 
: 
\begin{equation*}
R^{2} = \frac{\mathrm{TSS}-\mathrm{RSS}}{\mathrm{TSS}} = 1-\frac{\mathrm{RSS}}{\mathrm{TSS}}
\end{equation*}

- **RSS:** Varianza sin explicar por el modelo __completo__.
- **TSS:** Varianza sin explicar por el modelo __nulo__.

Estadístico \(R^{2}\) ajustado
: 
\begin{equation*}
R^{2}_{adj} = 1-\frac{\frac{\mathrm{RSS}}{n-p-1}}{\frac{\mathrm{TSS}}{n-1}}
\end{equation*}


### Laboratorio


```r
# Número de datos
n <- 1000
# Número de variables
p <- 2

x1 <- rnorm(1000)
x2 <- runif(1000)
y <- 1 + x1 + x2 + rnorm(1000, sd = 0.5)

fit <- lm(y ~ x1 + x2)
```


#### $R^2$

```r
(TSS <- sum((y - mean(y))^2))
```

```
## [1] 1402.26
```

```r
(RSS <- sum((y - fitted(fit))^2))
```

```
## [1] 250.6091
```

```r
1 - RSS/TSS
```

```
## [1] 0.821282
```

Otra forma de entender el $R^2$ es notando que 


```r
cor(y, fitted(fit))^2
```

```
## [1] 0.821282
```



#### $R^2$ ajustado

```r
(TSS_adj <- TSS/(n - 1))
```

```
## [1] 1.403663
```

```r
(RSS_adj <- RSS/(n - p - 1))
```

```
## [1] 0.2513632
```

```r
1 - RSS_adj/TSS_adj
```

```
## [1] 0.8209235
```


#### `summary`

```r
summary(fit)
```

```
## 
## Call:
## lm(formula = y ~ x1 + x2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.44716 -0.34692 -0.01095  0.34280  1.53693 
## 
## Coefficients:
##             Estimate Std. Error t value            Pr(>|t|)    
## (Intercept)  0.94616    0.03196   29.60 <0.0000000000000002 ***
## x1           1.03322    0.01614   64.02 <0.0000000000000002 ***
## x2           1.09560    0.05491   19.95 <0.0000000000000002 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5014 on 997 degrees of freedom
## Multiple R-squared:  0.8213,	Adjusted R-squared:  0.8209 
## F-statistic:  2291 on 2 and 997 DF,  p-value: < 0.00000000000000022
```



 
## Predicción 

Hay dos tipos de errores que se deben considerar en regresones lineales: 

1. **Error Reducible:** Recuerde que \(\hat{Y} = \hat{X}\hat{\beta} \) es el estimador de la función \(f(X)=X\beta = \beta_{0} + \beta_{1}X_{1}+\cdots+\beta_{p}X_{p}\). 

Por lo tanto su error (reducible) es: 

\begin{equation*}
\left(  f(X) - \hat{Y}\right) ^{2}. 
\end{equation*}

Para un conjunto de datos \(X_{0}\), tenemos que  

\begin{align*}
 & \hat{\beta} \sim  \mathcal{N}\left(\beta, \sigma^{2}\left( (X_{0}^{\top}X_{0})^{-1} \right)\right) \\
 \implies & \hat{Y} = \hat{X_{0}}\hat{\beta} \sim \mathcal{N}\left(\hat{X_{0}}\beta , \sigma^{2}X_{0}^{\top}((X_{0}^{\top}X_{0})^{-1}X_{0}  \right)
\end{align*}

Por lo tanto un **intervalo de confianza** al \(1-\alpha\) para \(X\beta\) es 

\begin{equation*}
X_{0}\beta \pm z_{1-\frac{\alpha}{2}} \hat{\sigma} \sqrt{X_{0}^{\top}(X_{0}^{\top}X_{0})^{-1}X_{0}}.
\end{equation*}

2. **Error irreducible:** Aún conociendo perfectamente los \(\beta\)'s, existe  el error desconocido \(\varepsilon\sim \mathcal{N}\left(0,\sigma^{2}\right)\) del modelo 

\begin{equation*}
Y = X\beta + \varepsilon.
\end{equation*} 

Entonces la varianza total de la predicción sería 

\begin{equation*}
\sigma^{2} +  \sigma^{2}X_{0}^{\top}( (X_{0}^{\top}X_{0})^{-1}X_{0} 
\end{equation*}


Entonces un **intervalo de predicción** al \(1-\alpha\) debe tomar en cuenta ese error  y por lo tanto 

\begin{equation*}
X_{0}\beta \pm z_{1-\frac{\alpha}{2}} \hat{\sigma} \sqrt{1+X_{0}^{\top}(X_{0}^{\top}X_{0})^{-1}X_{0}}.
\end{equation*}


Resumiendo 

- **Intervalo de confianza:** es la incertidumbre que existe alrededor de la línea de regresión.
- **Intervalo de predicción:** es la incertidumbre que existe alrededor del proceso general que generararon los datos bajo el supuesto de linealidad. 

### Laboratorio 


```r
lm.r <- lm(mpg ~ wt, data = mtcars)

range(mtcars$wt)
```

```
## [1] 1.513 5.424
```

```r
(datos_nuevos <- data.frame(wt = c(2.5, 3, 3.5)))
```

```
##    wt
## 1 2.5
## 2 3.0
## 3 3.5
```

```r
predict(object = lm.r, newdata = datos_nuevos, interval = "confidence")
```

```
##        fit      lwr      upr
## 1 23.92395 22.55284 25.29506
## 2 21.25171 20.12444 22.37899
## 3 18.57948 17.43342 19.72553
```

```r
predict(object = lm.r, newdata = datos_nuevos, interval = "prediction")
```

```
##        fit      lwr      upr
## 1 23.92395 17.55411 30.29378
## 2 21.25171 14.92987 27.57355
## 3 18.57948 12.25426 24.90469
```




####  Ajuste de la regresión sin intervalos de confianza


```r
p <- ggplot(mtcars, aes(x = wt, y = mpg)) 
p <- p + geom_point(size = 2)       # Use circulos de tamaño 2
p <- p + geom_smooth(method = lm,   # Agregar la línea de regresión 
              se = FALSE,           # NO incluir el intervalo de confianza   
              size = 1,
              col = "red")          # Línea de color rojo 
p <- p + theme_bw()                 # Tema de fondo blanco
p <- p + theme(axis.text = element_text(size = 20),  # Aumentar el tamaño 
               axis.title = element_text(size = 20)) # de letra en los ejes

# Dibujar el gráfico
p   
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-188-1} \end{center}

```r
# # Guardar el gráfico en un archivo pdf
# ggsave(filename = 'linear_reg_sin_IC.pdf') # 
```

#### Ajuste de la regresión con intervalos de confianza


```r
p <- ggplot(mtcars, aes(x = wt, y = mpg)) 
p <- p + geom_point(size = 2)       # Use circulos de tamaño 2
p <- p + geom_smooth(method = lm,   # Agregar la línea de regresión 
              se = TRUE,            # Incluir el intervalo de confianza   
              size = 1,
              col = "red")          # Línea de color rojo 
p <- p + theme_bw()                 # Tema de fondo blanco
p <- p + theme(axis.text = element_text(size = 20),  # Aumentar el tamaño 
               axis.title = element_text(size = 20)) # de letra en los ejes

# Dibujar el gráfico
p   
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-189-1} \end{center}

```r
# # Guardar el gráfico en un archivo pdf
# ggsave(filename = 'linear_reg_con_IC.pdf') # 
```

#### Ajuste de la regresión con intervalos de confianza y predicción


```r
# Agregamos a mtcars el intervalo de predicción
# para cada dato
mtcars.pred <- data.frame(mtcars, predict(lm.r, interval = "prediction"))

p <- ggplot(mtcars.pred, aes(x = wt, y = mpg))
# Use circulos de tamaño 2
p <- p + geom_point(size = 2)
# Agregue una banda de tamaño [lwr, upr] para cada
# punto y llamela 'predicción'
p <- p + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = "predicción"), 
    alpha = 0.3)
# Agregue el intervalo de confianza usual y llame a
# ese intervalo 'confianza'
p <- p + geom_smooth(method = lm, aes(fill = "confianza"), 
    size = 1, col = "red")
# Para agregar bien las leyendas
p <- p + scale_fill_manual("Intervalos", values = c("green", 
    "yellow"))
p <- p + theme_bw()
p <- p + theme(axis.text = element_text(size = 20), 
    axis.title = element_text(size = 20))

# Dibujar el gráfico
p
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-190-1} \end{center}

```r
# # Guardar el gráfico en un archivo pdf
# ggsave(filename = 'linear_reg_con_IC_IP.pdf') #
```


Repitamos el mismo ejercicio anterior pero con un caso más sencillo. 


```r
n <- 1000

X <- runif(n, 0, 10)
Y <- 10 + sin(5 * X) + X + rnorm(1000, 0, 1)
toyex.initial <- data.frame(X, Y) %>% arrange(X)

plot(toyex.initial)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-191-1} \end{center}



```r
lm.toyex.initial <- lm(Y ~ X, data = toyex.initial)

summary(lm.toyex.initial)
```

```
## 
## Call:
## lm(formula = Y ~ X, data = toyex.initial)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.1440 -0.8238  0.0088  0.8823  3.0482 
## 
## Coefficients:
##             Estimate Std. Error t value            Pr(>|t|)    
## (Intercept) 10.11325    0.07220  140.07 <0.0000000000000002 ***
## X            0.97761    0.01269   77.02 <0.0000000000000002 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.186 on 998 degrees of freedom
## Multiple R-squared:  0.856,	Adjusted R-squared:  0.8558 
## F-statistic:  5932 on 1 and 998 DF,  p-value: < 0.00000000000000022
```

```r
toyex.pred.initial <- data.frame(toyex.initial, predict(lm.toyex.initial, 
    interval = "prediction"))
```

Ahora, quisiera generar muchas muestras del mismo experimento


```r
toyex.pred <- NULL

for (i in 1:10) {
    X <- runif(n, 0, 10)
    Y <- 10 + sin(5 * X) + X + rnorm(1000, 0, 1)
    toyexi <- data.frame(im = i, X, Y)
    toyexi <- toyexi %>% arrange(X)
    toyex.pred <- bind_rows(toyex.pred, data.frame(toyexi, 
        predict(lm.toyex.initial, interval = "prediction")))
}


for (i in 1:10) {
    toyex.pred$fit <- fitted(lm(formula = Y ~ X, data = toyex.pred[toyex.pred$im == 
        i, ]))
}

toyex.pred$im <- as.factor(toyex.pred$im)
```



```r
library(gganimate)

ggplot(data = toyex.pred, aes(x = X, y = Y)) + geom_point(size = 1) + 
    geom_smooth(data = toyex.initial, method = lm, 
        mapping = aes(fill = "confianza"), size = 1, 
        col = "red") + geom_ribbon(data = toyex.pred.initial, 
    mapping = aes(x = X, ymin = lwr, ymax = upr, fill = "predicción", 
        ), alpha = 0.3) + labs(title = paste0("Muestra #: {closest_state}")) + 
    scale_fill_manual("Intervalos", values = c("green", 
        "yellow")) + theme_bw() + theme(axis.text = element_text(size = 20), 
    axis.title = element_text(size = 20)) + transition_states(im)
```

## Interacciones 

En el modelo clásico 

\begin{equation*}
Y = \beta_{0} + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon
\end{equation*}

Aumentemos en 1 unidad \(X_{1}\) y rescribamos el modelo original 

\begin{align*}
Y &=  \beta_{0} + \beta_{1} (X_{1}+1) + \beta_{2} X_{2} + \varepsilon \\
Y &=  (\beta_{0} + \beta_{1}) + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon \\
Y &=  \tilde{\beta_{0}} + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon \\
\end{align*}

Es decir, el modelo original sigue siendo el mismo aunque hayamos cambiado el \(X_1\). Este fenómeno ocurre siempre bajo transformaciones lineales de las variables. 


Ahora suponga que tenemos el siguiente modelo y aumentamos en 1 el \(X_1\)

\begin{align*}
Y &=  \beta_{0} + \tilde{\beta_{1}} X_{1} X_{2} +\varepsilon \\
\implies Y &=  \beta_{0} + \beta_{1} (X_{1}+1) X_{2} +\varepsilon \\
\implies Y &=  \beta_{0} + \beta_{1}X_{2} +  \beta_{1} X_{1} X_{2} +\varepsilon \\
\end{align*}


OJO. Terminamos con un modelo diferente con el que empezamos. Esto es indeseable ya que no hay consistencia en la modelación, 


Una forma de arreglar el problema es incluir las interacciones junto con todos sus efectos directos. 


\begin{equation*}
Y =  \beta_{0} + \beta_{1}X_{1} + \beta_{2} X_{2} +  \beta_{3} X_{1} X_{2} +\varepsilon \\
\end{equation*}

**Esto se le conoce como principio de jerarquía**. No es importante si los efectos directos son relevante o no dentro del modelo, siempre se deben de incluir para manter la consistencia. 


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-195"><strong>(\#exr:unnamed-chunk-195) </strong></span>Compruebe que para el caso anterior, si aumenta en una unidad \(X_{1}\), el modelo se mantiene. </div>\EndKnitrBlock{exercise}

### Laboratorio


Generamos una base de datos nueva con solamente `wt` centrado


```r
# La función across y where solo funciona solo para
# dplyr 1.0 Si tienen otra versión, pueden usar
# mutate_if

mtcars_centered <- mtcars %>% mutate(across("wt", scale, 
    scale = FALSE, center = TRUE))

# Si no se tiene dplyr 1.0

mtcars_centered <- mtcars %>% mutate_at("wt", scale, 
    scale = FALSE, center = TRUE)
```


Compare lo que ocurre con los coeficientes de la base original y la nueva base. 


```r
summary(lm(mpg ~ wt + disp, data = mtcars))
```

```
## 
## Call:
## lm(formula = mpg ~ wt + disp, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.4087 -2.3243 -0.7683  1.7721  6.3484 
## 
## Coefficients:
##             Estimate Std. Error t value             Pr(>|t|)    
## (Intercept) 34.96055    2.16454  16.151 0.000000000000000491 ***
## wt          -3.35082    1.16413  -2.878              0.00743 ** 
## disp        -0.01773    0.00919  -1.929              0.06362 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.917 on 29 degrees of freedom
## Multiple R-squared:  0.7809,	Adjusted R-squared:  0.7658 
## F-statistic: 51.69 on 2 and 29 DF,  p-value: 0.0000000002744
```

```r
summary(lm(mpg ~ wt + disp, data = mtcars_centered))
```

```
## 
## Call:
## lm(formula = mpg ~ wt + disp, data = mtcars_centered)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.4087 -2.3243 -0.7683  1.7721  6.3484 
## 
## Coefficients:
##             Estimate Std. Error t value         Pr(>|t|)    
## (Intercept) 24.18011    2.18221  11.081 0.00000000000612 ***
## wt          -3.35082    1.16413  -2.878          0.00743 ** 
## disp        -0.01773    0.00919  -1.929          0.06362 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.917 on 29 degrees of freedom
## Multiple R-squared:  0.7809,	Adjusted R-squared:  0.7658 
## F-statistic: 51.69 on 2 and 29 DF,  p-value: 0.0000000002744
```


Supongamos que formamos un modelo con solo la interacción y no incluimos los efectos directos. 


```r
summary(lm(mpg ~ wt * disp - wt - disp, data = mtcars))
```

```
## 
## Call:
## lm(formula = mpg ~ wt * disp - wt - disp, data = mtcars)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.259 -2.603 -1.657  2.165  8.589 
## 
## Coefficients:
##               Estimate Std. Error t value             Pr(>|t|)    
## (Intercept) 26.2621926  1.0418029  25.208 < 0.0000000000000002 ***
## wt:disp     -0.0072897  0.0009721  -7.499         0.0000000233 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.614 on 30 degrees of freedom
## Multiple R-squared:  0.6521,	Adjusted R-squared:  0.6405 
## F-statistic: 56.24 on 1 and 30 DF,  p-value: 0.00000002329
```

```r
summary(lm(mpg ~ wt * disp - wt - disp, data = mtcars_centered))
```

```
## 
## Call:
## lm(formula = mpg ~ wt * disp - wt - disp, data = mtcars_centered)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -5.878 -2.775 -1.162  2.409 11.150 
## 
## Coefficients:
##              Estimate Std. Error t value             Pr(>|t|)    
## (Intercept) 21.460008   0.859706  24.962 < 0.0000000000000002 ***
## wt:disp     -0.013127   0.002714  -4.837            0.0000369 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.592 on 30 degrees of freedom
## Multiple R-squared:  0.4382,	Adjusted R-squared:  0.4195 
## F-statistic:  23.4 on 1 and 30 DF,  p-value: 0.00003686
```


El modelo correcto sería el siguiente:


```r
summary(lm(mpg ~ wt + disp + wt * disp, data = mtcars))
```

```
## 
## Call:
## lm(formula = mpg ~ wt + disp + wt * disp, data = mtcars)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -3.267 -1.677 -0.836  1.351  5.017 
## 
## Coefficients:
##              Estimate Std. Error t value           Pr(>|t|)    
## (Intercept) 44.081998   3.123063  14.115 0.0000000000000296 ***
## wt          -6.495680   1.313383  -4.946 0.0000321670456650 ***
## disp        -0.056358   0.013239  -4.257            0.00021 ***
## wt:disp      0.011705   0.003255   3.596            0.00123 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.455 on 28 degrees of freedom
## Multiple R-squared:  0.8501,	Adjusted R-squared:  0.8341 
## F-statistic: 52.95 on 3 and 28 DF,  p-value: 0.00000000001158
```

```r
summary(lm(mpg ~ wt + disp + wt * disp, data = mtcars_centered))
```

```
## 
## Call:
## lm(formula = mpg ~ wt + disp + wt * disp, data = mtcars_centered)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -3.267 -1.677 -0.836  1.351  5.017 
## 
## Coefficients:
##              Estimate Std. Error t value          Pr(>|t|)    
## (Intercept) 23.183772   1.857605  12.480 0.000000000000587 ***
## wt          -6.495680   1.313383  -4.946 0.000032167045665 ***
## disp        -0.018699   0.007741  -2.416           0.02248 *  
## wt:disp      0.011705   0.003255   3.596           0.00123 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.455 on 28 degrees of freedom
## Multiple R-squared:  0.8501,	Adjusted R-squared:  0.8341 
## F-statistic: 52.95 on 3 and 28 DF,  p-value: 0.00000000001158
```


:::{.exercise data-latex=""}

Repita los comandos anteriores con la siguiente base de datos y explique los resultados. 

```r
mtcars_scaled <- mtcars %>% mutate(across(c("wt", "disp"), 
    scale, scale = TRUE, center = TRUE))
```

:::


<!-- Y aumentamos -->


<!--  aumenta en 1 unidad   y denotamos  -->

<!-- \begin{equation*} -->
<!-- Y_{+1} = \beta_{0} + \beta_{1} (X_{1}+1) + \beta_{2} X_{2} + \varepsilon -->
<!-- \end{equation*} -->

<!-- vemos que  -->
<!-- \begin{align*} -->
<!-- Y_{+1} -Y &=  \beta_{0} + \beta_{1} (X_{1}+1) + \beta_{2} X_{2} + \varepsilon \\ -->
<!-- & -(\beta_{0} + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon) \\ -->
<!-- &= \beta_{1}. -->
<!-- \end{align*} -->

<!-- Entonces \(\beta_{1}\) es la __razon de cambio__ discreta de aumentar 1 unidad en \(X_{1}\) con respecto a \(Y\).  -->


<!-- En otras palabras,  -->

<!-- Ahora suponga que tenemos los modelos: -->

<!-- \begin{align*} -->
<!-- Y &=  \beta_{0} + \tilde{\beta_{1}} X_{1} X_{2} +\varepsilon\\ -->
<!-- Y_{+1} &=  \beta_{0} + \tilde{\beta_{1}} (X_{1}+1) X_{2}+\varepsilon \\ -->
<!-- \end{align*} -->

<!-- y hacemos el mismo cálculo que antes:  -->

<!-- \begin{align*} -->
<!-- Y_{+1} -Y &=  \beta_{0} + \tilde{\beta_{1}} (X_{1}+1) X_{2}+\varepsilon \\ -->
<!-- & -(\beta_{0} + \tilde{\beta_{1}} X_{1} X_{2} +\varepsilon) \\ -->
<!-- &=  \tilde{\beta_{1}} X_{2} -->
<!-- \end{align*} -->

<!-- Es decir esa razón de cambio depende  -->






## Hipotesis en regresión lineal 


Hasta ahora hemos visto el modelo de regresión como un conjunto de partes separadas.


### Hipotésis

Independencia lineal
: El supuesto es que el modelo es lineal. 

Errores con esperanza nula
: Esto quiere decir que $\mathbb{E}(\varepsilon_i) = 0$.

Homocedasticidad
: $\text{Var}(\varepsilon_t) = \mathbb{E}(\varepsilon_t - \mathbb{E} \varepsilon_t)^2 = \mathbb{E} \varepsilon_t^2 = \sigma^2$ para todo $t$. Es decir, la varianza del modelo no depende de las variables independientes u otro factor. En otras palabras, el **error irreducible** es completamente ajeno a las variables independientes del modelo.

Normalidad de los residuos
: $\varepsilon \sim N(0, \sigma^2 )$.

Independencia de los erroes
: $\text{Cov}(\varepsilon_t,\varepsilon_s ) = \mathbb{E} (\varepsilon_t - \mathbb{E} \varepsilon_t) (\varepsilon_s - \mathbb{E} \varepsilon_s) = \mathbb{E} \varepsilon_t \varepsilon_s = 0$ para todo $t,s$ con $t\neq s$. Esto es una extensión del supuesto anterior y quiere decir, que además de los errores no depende de las variables, tampoco pueden depender entre si. Es decir, si para una observación dada existe un error, este no debe depender del error de otra observación.

Esto puede provocar que los errores usados para  intervalos de confianza y predicción sean subestimados. Es decir que un intervalo del 95\% tendrá menos confianza y se rechazaría más fácilmente la hipotesis nula de las pruebas $t$ y $F$.

Multicolineaidad 
: Se asume que cada una de las variables es independiente de las otras. Es decir que cada variable explica "un aspecto o característica" del modelo. Sin embargo puede pasar que varias variables expliquen la misma característica y el modelo tenga que volverse __inestable__ por decidir entre las dos variables. Por ejemplo: la temperatura en grados centigrados y fareheint. 

En este caso habría dos columnas linealmente dependientes y por lo tanto  \((X^{\top}X)^{-1}\)  se acercaría a una matriz singular con determinante cercano a 0. 

Esto generaría que \(\mathrm{Var}\left(\beta\right)\) sea alto ya que 
\begin{equation*}
\beta =  (X^{\top}X)^{-1} X^{\top}Y.
\end{equation*}


Más observaciones que predictores
: En este caso siempre podremos construir correctamente la regresión y sus indices. (Volveremos a esto cuando veamos selección de modelos)


### Chequeos básicos de las hipótesis de regresión lineal 

#### Independencia lineal, Errores con esperanza nula, Homocedasticidad

Estos supuestos se puede constantar a partir de un gráfico  de residuos ya que en el caso ideal  \(e_{i} = \hat{Y}_{i}- Y_{i}  \perp \hat{Y}_{i}\). Entonces si este gráfico presenta patrones, quiere indicar que la regresión, no es lineal, que los errores no tienen esperanza nula y que la varianza no es constante. 

Se pueden aplicar transformaciones para resolver estos problemas. Normalmente se usan transformaciones como raiz cuadrada o logaritmos. 


:::{.example data-latex=""}


**Caso ideal**

```r
x <- rnorm(1000)
y <- x + rnorm(1000, sd = 0.5)

fit <- lm(y ~ x)
plot(x, y)
abline(a = coef(fit)[1], b = coef(fit)[2], col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-201-1} \end{center}



```r
plot(fitted(fit), residuals(fit))
abline(h = 0, col = "red")
```

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/grafico-residuos-lineal-1} 

}

\caption{Gráfico de residuos caso lineal}(\#fig:grafico-residuos-lineal)
\end{figure}



**Caso no-lineal**

```r
x <- exp(rnorm(1000))
y <- log(x) + rnorm(1000, sd = 0.5)

fit <- lm(y ~ x)
plot(x, y)
abline(a = coef(fit)[1], b = coef(fit)[2], col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-202-1} \end{center}



```r
plot(fitted(fit), residuals(fit))
abline(h = 0, col = "red")
```

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/grafico-residuos-no-lineal-1} 

}

\caption{Gráfico de residuos caso no-lineal}(\#fig:grafico-residuos-no-lineal)
\end{figure}


**Caso no-lineal transformado**


```r
xt <- log(x)


fit <- lm(y ~ xt)
plot(xt, y)
abline(a = coef(fit)[1], b = coef(fit)[2], col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-203-1} \end{center}

```r
plot(fitted(fit), residuals(fit))
abline(h = 0, col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-203-2} \end{center}
:::


#### Independencia de los erroes

En este caso defina $\rho(k) = \text{Cov}(\varepsilon_i,\varepsilon_{i+k} )$. Si los residuos son independientes, entonces debe ocurrir que 

\begin{equation*}
\rho(k) = \begin{cases}
1 & k=0\\
0 & k\neq 0.
\end{cases}  
\end{equation*}

Se calcula la función de autocorrelación y se gráfica para analizar su comportamiento 

**Caso ideal**

```r
x <- rnorm(1000)
y <- 1 + x + rnorm(1000, sd = 1)
```



```r
fit <- lm(y ~ x)
plot(x, y)
abline(a = coef(fit)[1], b = coef(fit)[2], col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-205-1} \end{center}



```r
summary(fit)
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.2665 -0.6871  0.0002  0.6670  2.9410 
## 
## Coefficients:
##             Estimate Std. Error t value            Pr(>|t|)    
## (Intercept)  1.04643    0.03183   32.87 <0.0000000000000002 ***
## x            0.95650    0.03287   29.10 <0.0000000000000002 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.007 on 998 degrees of freedom
## Multiple R-squared:  0.4589,	Adjusted R-squared:  0.4584 
## F-statistic: 846.6 on 1 and 998 DF,  p-value: < 0.00000000000000022
```

```r
acf(residuals(fit))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-206-1} \end{center}

**Caso errores auto-correlacionados**


```r
x <- rnorm(1000)
y <- 1 + x + diffinv(rnorm(999, sd = 1), lag = 1)
```



```r
fit <- lm(y ~ x)
plot(x, y)
abline(a = coef(fit)[1], b = coef(fit)[2], col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-208-1} \end{center}



```r
summary(fit)
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -45.109 -13.583   3.439  11.036  26.104 
## 
## Coefficients:
##             Estimate Std. Error t value             Pr(>|t|)    
## (Intercept)  43.4918     0.4791  90.787 < 0.0000000000000002 ***
## x             1.5347     0.4771   3.217              0.00134 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.15 on 998 degrees of freedom
## Multiple R-squared:  0.01026,	Adjusted R-squared:  0.00927 
## F-statistic: 10.35 on 1 and 998 DF,  p-value: 0.001339
```

```r
acf(residuals(fit))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-209-1} \end{center}


#### Normalidad de los errores 

Este hipótesis es crucial para hacer las pruebas $t$ y $F$ que vimos anteriormente. 

Para revisar si se cumple solo basta hacer una `qqplot` de los residuos. 


**Caso ideal**

```r
x <- rnorm(1000)
y <- 1 + x + rnorm(1000, sd = 1)
fit <- lm(y ~ x)
```



```r
qqnorm(residuals(fit), asp = 1)
qqline(residuals(fit), col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-211-1} \end{center}

**Caso errores auto-correlacionados**


```r
x <- rnorm(1000)
y <- 1 + x + diffinv(rnorm(999, sd = 1), lag = 1)
fit <- lm(y ~ x)
```



```r
qqnorm(residuals(fit), asp = 0)
qqline(residuals(fit), col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-213-1} \end{center}

**Caso no-lineal**


```r
x <- rnorm(1000)
y <- x^2 + rnorm(1000, sd = 0.5)
fit <- lm(y ~ x)
```



```r
qqnorm(residuals(fit), asp = 0)
qqline(residuals(fit), col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-215-1} \end{center}


```r
x <- rnorm(1000)
y <- x^2 + rnorm(1000, sd = 0.5)
fit <- lm(y ~ x + I(x^2))
summary(fit)
```

```
## 
## Call:
## lm(formula = y ~ x + I(x^2))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.84371 -0.30372 -0.01256  0.32728  1.68466 
## 
## Coefficients:
##             Estimate Std. Error t value            Pr(>|t|)    
## (Intercept)  0.01010    0.01979   0.511              0.6098    
## x           -0.03009    0.01587  -1.896              0.0582 .  
## I(x^2)       0.99172    0.01196  82.906 <0.0000000000000002 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5001 on 997 degrees of freedom
## Multiple R-squared:  0.8734,	Adjusted R-squared:  0.8731 
## F-statistic:  3438 on 2 and 997 DF,  p-value: < 0.00000000000000022
```



```r
qqnorm(residuals(fit), asp = 0)
qqline(residuals(fit), col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-217-1} \end{center}

#### Multicolinealidad


Hay dos formas de detectar multicolinealidad 

1. Analizar la matriz de correlaciones de las variables (solamente detecta colinealidad entre pares). 

2. Analizar la correlación multiple entre un predictor y el resto.


Defina \(R^{2}_{X_{j}\vert X_{-j}}\) como el \(R^{2}\) de la regresión multiple entre \(X_{j}\) vs el resto de covariables. 

Si \(R^{2}_{X_{j}\vert X_{-j}}\) es cercano a 1 entonces hay alta correlación entre \(X_j\) y el resto. 

Defina el factor de inflación de la varianza como:

\begin{equation*}
 \mathrm{VIF}(\hat{\beta}_{j}) = \frac{1}{1-R^{2}_{X_{j}\vert X_{-j}}}
\end{equation*}


Si \(\mathrm{VIF}\) es alto 

- Quitar las variables 
- Combinar variables




Hay muchos paquetes que tienen implementado la función `vif` (car, rms, entre otros).


**Caso variables colineales**


La variable `wt` está en unidades de 1000lb. La convertimos a Kilogramos. 


```r
mtcars_kg <- mtcars %>% mutate(wt_kg = wt * 1000 * 
    0.4535 + rnorm(32))


fit_kg <- lm(mpg ~ disp + wt + wt_kg, data = mtcars_kg)
summary(fit_kg)
```

```
## 
## Call:
## lm(formula = mpg ~ disp + wt + wt_kg, data = mtcars_kg)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.0609 -1.8566 -0.6442  1.1658  6.1471 
## 
## Coefficients:
##               Estimate Std. Error t value             Pr(>|t|)    
## (Intercept)  36.263681   2.143546  16.918 0.000000000000000311 ***
## disp         -0.016980   0.008712  -1.949               0.0614 .  
## wt          455.378192 220.448899   2.066               0.0482 *  
## wt_kg        -1.012338   0.486488  -2.081               0.0467 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.762 on 28 degrees of freedom
## Multiple R-squared:  0.8103,	Adjusted R-squared:  0.7899 
## F-statistic: 39.86 on 3 and 28 DF,  p-value: 0.0000000003079
```


```r
library(car)
options(scipen = 1000)

VIFs <- vif(fit_kg)

VIFs <- as.data.frame(VIFs) %>% rownames_to_column(var = "vars")

ggplot(VIFs, aes(x = vars, y = VIFs, group = 1)) + 
    geom_point() + geom_line() + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-219-1} \end{center}





### Otros chequeos importantes 

#### Puntos extremos 

Estos puntos son aquellos que $Y_i$ esta lejos de $\hat{Y}_i$. Otra forma de verlo son aquellos puntos que tienen residuos muy altos. 


Se puede hacer un gráfico de los residuos vs los valores ajustados como en \@ref(fig:grafico-residuos-lineal) y \@ref(fig:grafico-residuos-no-lineal). 


¿Qué tan grande deben ser los residuos?

**Solución:** Se debe escalar los residuos adecuadamente. 

Se construyen los residuos semi-studendizados 

\begin{equation*}
r_{i}^{s} = \frac{e_{i}}{\sqrt{\mathrm{Var}\left(e_{i}\right)}} 
\end{equation*}


Como \(H=X(X^{\top}X)^{-1}X^{\top}\) es la matriz de proyección entonces sabemos que 

\begin{align*}
\hat{Y}&=  H Y \\
e &= Y - \hat{Y}  
\end{align*}

Entonces tenemos que 

\begin{align*}
\mathrm{Var}\left(e\right) 
&=  \mathrm{Var}\left((I-H)Y\right)\\
&= (I-H)^{2}\mathrm{Var}\left(Y\right)\\
&= (I-H) \sigma^{2} \text{ (\(I-H\) es idempotente)}
\end{align*} 


Por lo tanto 

\begin{equation*}
\mathrm{Var}\left(e_{i}\right) = (1-h_{ii}) \sigma^{2}
\end{equation*}

Para cada observación se calcula los residuos de la forma 

\begin{equation*}
r_{i}^{s} = \frac{e_i}{\sqrt{(1-h_{ii}) \sigma^{2}}}
\end{equation*}

**Caso sin valores extremos**

```r
x <- rnorm(1000)
y <- 1 + x + rnorm(1000, sd = 0.5)
fit <- lm(y ~ x)

X <- model.matrix(y ~ x)
H <- X %*% solve(t(X) %*% X) %*% t(X)
I <- diag(1, nrow = 1000)
I_H <- I - H
r_sdnt <- residuals(fit)/sqrt(diag(I_H) * var(y))
plot(fitted(fit), r_sdnt)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-220-1} \end{center}

```r
fit
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Coefficients:
## (Intercept)            x  
##      0.9893       0.9701
```

**Caso con valores extremos*


```r
x <- rnorm(1000)
y <- 1 + x + rnorm(1000, sd = 0.5)
y[1:5] <- runif(5, 30, 40)
fit <- lm(y ~ x)

X <- model.matrix(y ~ x)
H <- X %*% solve(t(X) %*% X) %*% t(X)
I <- diag(1, nrow = 1000)
I_H <- I - H
r_sdnt <- residuals(fit)/sqrt(diag(I_H) * var(y))
plot(fitted(fit), r_sdnt)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-221-1} \end{center}

```r
fit
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Coefficients:
## (Intercept)            x  
##      1.1505       0.9397
```

#### Puntos de apalancamiento (leverage)


Un outlier puede ser detectado pero aún así este puede no afectar el modelo como un todo. 

El $r_{i}^s$ puede ser alto por 2 razones: 

1. los residuos $e_i$ son altos (un outlier)
2. el valor $h_{ii}$ es cercano a 1. (Se tiene que $0\leq h_{ii}\leq 1$). 

Los valores donde $h_{ii}\approx 1$ se les denomina de **gran apalancamiento**. 

La regla empirica dice que 

\begin{equation*}
\sum_{i=1}^{n} h_{ii} = p +1 \text{  (Los predictores más el intercepto)   }
\end{equation*}

**Regla empírica:** Si \(h_{ii}>\frac{p+1}{n}\) entonces decimos que el punto de **gran apalancamiento**.


##### Distancia de Cook. 
La distancia de Cook mide la influencia de las observaciones con respecto al ajuste del modelo lineal con $p$ variables. Esta se define como: 

\[
\displaystyle D_i = \frac{\sum\limits_{j=1}^n (\hat{Y}_j - \hat{Y}_{j(-i)})^2}{(p+1) \sigma^2}
\]

donde $\hat{Y}_{j(-i)}$ significa el ajuste del modelo lineal, removiendo la observación $i$-ésima. 

**Caso base**

```r
set.seed(42)
apa_df = data.frame(x = 1:10, y = 10:1 + rnorm(n = 10))
```



```r
modelo <- lm(y ~ x, data = apa_df)
coef(modelo)
```

```
## (Intercept)           x 
##  11.3801152  -0.9696033
```



```r
plot(modelo, 5, col = c(rep("black", 10), "red"), cex = 2, 
    pch = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-224-1} \end{center}



```r
plot(hatvalues(modelo), col = c(rep("black", 10), "red"), 
    cex = 2, pch = 16)
abline(h = 2/10, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-225-1} \end{center}



```r
plot(apa_df, col = c(rep("black", 10), "red"), cex = 2, 
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-226-1} \end{center}

**Bajo apalancamiento, residuos grandes, influencia pequeña**


```r
p_1 <- c(5.4, 11)
apa_df_1 <- rbind(apa_df, p_1)
modelo_1 <- lm(y ~ x, data = apa_df_1)
coef(modelo_1)
```

```
## (Intercept)           x 
##  11.8509232  -0.9749534
```



```r
plot(modelo_1, 5, col = c(rep("black", 10), "red"), 
    cex = 2, pch = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-228-1} \end{center}





```r
plot(hatvalues(modelo_1), col = c(rep("black", 10), 
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-229-1} \end{center}



```r
plot(apa_df_1, col = c(rep("black", 10), "red"), cex = 2, 
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_1)[1], b = coef(modelo_1)[2], 
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-230-1} \end{center}


**Alto apalancamiento, residuo pequeño, influencia pequeña** 



```r
p_2 <- c(18, -5.7)
apa_df_2 <- rbind(apa_df, p_2)
modelo_2 <- lm(y ~ x, data = apa_df_2)
coef(modelo_2)
```

```
## (Intercept)           x 
##  11.2888153  -0.9507397
```



```r
plot(modelo_2, 5, col = c(rep("black", 10), "red"), 
    cex = 2, pch = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-232-1} \end{center}



```r
plot(hatvalues(modelo_2), col = c(rep("black", 10), 
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-233-1} \end{center}



```r
plot(apa_df_2, col = c(rep("black", 10), "red"), cex = 2, 
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_2)[1], b = coef(modelo_2)[2], 
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-234-1} \end{center}


**Alto apalancamiento, residuo altos, influencia grande** 

```r
p_3 <- c(14, 5.1)
apa_df_3 <- rbind(apa_df, p_3)
modelo_3 <- lm(y ~ x, data = apa_df_3)
coef(modelo_3)
```

```
## (Intercept)           x 
##   9.6572209  -0.5892241
```



```r
plot(modelo_3, 5, col = c(rep("black", 10), "red"), 
    cex = 2, pch = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-236-1} \end{center}




```r
plot(hatvalues(modelo_3), col = c(rep("black", 10), 
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-237-1} \end{center}



```r
plot(apa_df_3, col = c(rep("black", 10), "red"), cex = 2, 
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_3)[1], b = coef(modelo_3)[2], 
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-238-1} \end{center}

```r
`?`(stats:::plot.lm)
```



```r
plot(modelo_3, which = 1:6)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-2} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-3} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-4} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-5} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-240-6} \end{center}



```r
plot(modelo, which = 1:6)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-2} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-3} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-4} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-5} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-241-6} \end{center}

## Ejercicios 

Del libro [@James2013b] 

- Capítulo 3: 1, 3, 4, 5, 8, 9

<!--chapter:end:04-metodos-lineares-regresion.Rmd-->


# Regresión Logística

Asuma que ahora la variable \(Y\) solo contiene valores 0 o 1 y queremos hacer la regresión 

\begin{equation*}
Y = \beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p} + \varepsilon.
\end{equation*} 

El problema es que \(\mathbb{E}\left[Y | \boldsymbol{X}\right] = \mathbb{P}\left(Y=1\vert \boldsymbol{X}\right)\) y se debe cumplir que 

\begin{equation*}
0\leq \mathbb{E}\left[Y | \boldsymbol{X}\right]\leq 1.
\end{equation*} 

pero el rango de \(\beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p} \) es todo \(\mathbb{R}\). 

Solución es cambiar \(Y\) por \(g(Y)\in [0,1]\). 

\begin{equation*}
g(X) = \frac{1}{1+e^{-(\beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p})}}
\end{equation*}  


```r
titanic <- read.csv("data/titanic.csv")
summary(titanic)
```

```
##   PassengerId       Survived          Pclass          Name          
##  Min.   :  1.0   Min.   :0.0000   Min.   :1.000   Length:891        
##  1st Qu.:223.5   1st Qu.:0.0000   1st Qu.:2.000   Class :character  
##  Median :446.0   Median :0.0000   Median :3.000   Mode  :character  
##  Mean   :446.0   Mean   :0.3838   Mean   :2.309                     
##  3rd Qu.:668.5   3rd Qu.:1.0000   3rd Qu.:3.000                     
##  Max.   :891.0   Max.   :1.0000   Max.   :3.000                     
##                                                                     
##      Sex                 Age            SibSp           Parch       
##  Length:891         Min.   : 0.42   Min.   :0.000   Min.   :0.0000  
##  Class :character   1st Qu.:20.12   1st Qu.:0.000   1st Qu.:0.0000  
##  Mode  :character   Median :28.00   Median :0.000   Median :0.0000  
##                     Mean   :29.70   Mean   :0.523   Mean   :0.3816  
##                     3rd Qu.:38.00   3rd Qu.:1.000   3rd Qu.:0.0000  
##                     Max.   :80.00   Max.   :8.000   Max.   :6.0000  
##                     NA's   :177                                     
##     Ticket               Fare           Cabin             Embarked        
##  Length:891         Min.   :  0.00   Length:891         Length:891        
##  Class :character   1st Qu.:  7.91   Class :character   Class :character  
##  Mode  :character   Median : 14.45   Mode  :character   Mode  :character  
##                     Mean   : 32.20                                        
##                     3rd Qu.: 31.00                                        
##                     Max.   :512.33                                        
## 
```


```r
titanic <- titanic %>% select(Survived, Fare, Age) %>% 
    drop_na()

fit_lm <- lm(Survived ~ Fare + Age, data = titanic)
```



```r
library(ggiraphExtra)
ggPredict(fit_lm) + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-245-1} \end{center}



En lugar de esto, definamos el siguiente modelo 

\begin{equation*}
Y \sim Bernoulli (g_{\beta}(\boldsymbol{X})) 
\end{equation*}

con \(g_{\beta}(\boldsymbol{X}) = \mathbb{P}\left(Y=1 \vert \boldsymbol{X}\right)\).

En `R` usaremos la función `glm` 


```r
fit_glm <- glm(Survived ~ Fare + Age, data = titanic, 
    family = "binomial")
summary(fit_glm)
```

```
## 
## Call:
## glm(formula = Survived ~ Fare + Age, family = "binomial", data = titanic)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.7605  -0.9232  -0.8214   1.2362   1.7820  
## 
## Coefficients:
##              Estimate Std. Error z value        Pr(>|z|)    
## (Intercept) -0.417055   0.185976  -2.243         0.02493 *  
## Fare         0.017258   0.002617   6.596 0.0000000000423 ***
## Age         -0.017578   0.005666  -3.103         0.00192 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 964.52  on 713  degrees of freedom
## Residual deviance: 891.34  on 711  degrees of freedom
## AIC: 897.34
## 
## Number of Fisher Scoring iterations: 5
```



```r
ggPredict(fit_glm) + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-247-1} \end{center}

**Nota:** Existen otros tipos de regresión y estas se definen a través del parámetro `family`. En este curso solo nos enfocaremos en el parámetro `family="binomial"`.

## Razón de proporción 

Defina 

\begin{equation*}
O(X) = \frac{g(X)}{1-g(X)} = e^{\beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p}} \in [0,1].
\end{equation*}

Es la relación de obtener 1 ó 0. 

Por suponga que  \(\mathbb{P}\left(Y=1\vert \boldsymbol{X}\right) = g(\boldsymbol{X}) = 0.8\) es la probabilidad de pagar la tarjeta de crédito y  \(1-g(\boldsymbol{X}) = 0.2\) es  la probabilidad de no pagar.  

Se puede escribir \(O(X) = \frac{0.8}{0.2} = \frac{4}{1}\), lo que dice que es 4 veces más probable de pagar la tarjeta que no pagarla. 


## Máxima verosimilitud 

Los valores de \(\beta\) se pueden encontrar por máxima verosimilitud. 

Defina \(p(\boldsymbol{X}) = \mathbb{P}\left(Y=1\vert \boldsymbol{X}\right)\).

La verosimilitud es:

\[
L\left(\beta\right)=\prod_{i=1}^{n} p\left(\boldsymbol{X}_{i}\right)^{Y_{i}}\left(1-p\left(\boldsymbol{X}_{i}\right)\right)^{1-Y_{i}}
\]



\begin{align*}
\ell\left(\beta\right) 
&=\sum_{i=1}^{n} Y_{i} \log p\left(\boldsymbol{X}_{i}\right)+\left(1-Y_{i}\right) \log \left(1-p\left(\boldsymbol{X}_{i}\right)\right) \\
&=\sum_{i=1}^{n} \log \left(1-p\left(\boldsymbol{X}_{i}\right)\right)+\sum_{i=1}^{n} Y_{i} \log \frac{p\left(\boldsymbol{X}_{i}\right)}{1-p\left(\boldsymbol{X}_{i}\right)} \\
&=\sum_{i=1}^{n} \log \left(1-p\left(\boldsymbol{X}_{i}\right)\right)+\sum_{i=1}^{n} Y_{i}\left(\boldsymbol{X}_{i} \cdot \beta\right) \\
&=\sum_{i=1}^{n}-\log \left(1+e^{\boldsymbol{X}_{i} \cdot \beta}\right)+\sum_{i=1}^{n} Y_{i}\left(\boldsymbol{X}_{i} \cdot \beta\right)
\end{align*}


\begin{align*}
\frac{\partial \ell}{\partial \beta} 
&=-\sum_{i=1}^{n} \frac{1}{1+e^{\boldsymbol{X}_{i} \cdot \beta}} e^{\boldsymbol{X}_{i} \cdot \beta} \boldsymbol{X}_{i}+\sum_{i=1}^{n} Y_{i} \boldsymbol{X}_{i} \\
&=\sum_{i=1}^{n}\left(Y_{i}-p\left(\boldsymbol{X}_{i}\right)\right) \boldsymbol{X}_{i} \\
&= X^{\top}(Y-p(\boldsymbol{X}))
\end{align*}

**Solución:** Netwon-Raphson

:::{.exercise data-latex=""}
Muestre que 

\begin{equation*}
\frac{\partial^{2} \ell}{\partial \beta^{2}} = -\boldsymbol{X}W\boldsymbol{X} 
\end{equation*}

donde \(W = \mathrm{diag}{p(\boldsymbol{X}_{i})(1-p(X_{i}))}\).

:::


El algoritmo de Netwon-Raphson usa el hecho que 

\begin{equation*}
\beta^{(t)} = \beta ^{(t-1)} - \left(  \frac{\partial^{2} \ell}{\partial \beta^{2}}\right)^{-1} \frac{\partial \ell}{\partial \beta}  \Bigg\vert_{\beta ^{(t-1)}}
\end{equation*}

:::{.exercise data-latex=""}
Muestre que 

\begin{equation*}
\beta^{(t)} = \left( X^{\top}WX \right)^{-1}X^{\top}Z_{\beta},
\end{equation*}

donde \(Z_{\beta} = Z\beta + W^{-1}_{\beta} (Y-p(X))\).
:::


A esta técnica se le conoce como __mínimos cuadrados ponderados e iterados__ o en inglés __Iteratively Re-Weighted Least Squares__ (IRLS).

Se comienza con \(\beta^{(0)}\) cualquiera y se va iterando \(\beta^{(1)}, \beta^{(2)}, \ldots\) hasta encontrar la convergencia. 

Para cada \(t\) se resueelve el problema 

\begin{equation*}
\beta ^{t} = \operatorname{argmin}_{\beta} (Z-X\beta)^{\top}W(Z-X\beta).
\end{equation*}



### Residuos

La suma al cuadrado de los residuos  se convierte en un estadístico de pearson: 


\begin{align*}
\chi^{2}=\sum_{i=1}^{n} \frac{\left(Y_{i}-\hat{p}(X_{i})\right)^{2}}{\hat{p}(X_{i})(\hat{p}(X_{i}))}
\end{align*}

la cual es una aproximación cuadrática de la devianza (Curso pasado). 

\begin{equation*}
D = -2 \ell(\hat{\beta})
\end{equation*} 

Además tenemos los resultados que 

- \(\hat{\beta} \xrightarrow{\mathbb{P}} \beta \)
- \(\hat{\beta} \xrightarrow{\mathcal{D}} \mathcal{N}\left(\beta,(X^{\top}WX)^{-1}\right) \) (Prueba de Wald)
- Se pueden comparar un modelo completo con un reducido a través de pruebas asintóticas LRT 
\begin{equation*}
D_c -D_r \sim =\chi^{2}_{df_{c}} - \chi^{2}_{df_{r}}.
\end{equation*}


## Diágnosticos del modelo

 
 **CUIADADO: La función `glm` no tiene un equivalente de `plot` como en los modelos lineales. De esta forma, si se aplica `plot` a un objeto `glm` solo generará los mismos chequeos que el capítulo anterior. Sin embargo estos podrían estar equivocados si no se leen con cuidado.**
 
 
###  Supuesto de linealidad

Este supuesto debe ser chequeado con la función logit de las respuestas. 


```r
fit_glm <- glm(Survived ~ Fare + Age, data = titanic, 
    family = "binomial")
summary(fit_glm)
```

```
## 
## Call:
## glm(formula = Survived ~ Fare + Age, family = "binomial", data = titanic)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.7605  -0.9232  -0.8214   1.2362   1.7820  
## 
## Coefficients:
##              Estimate Std. Error z value        Pr(>|z|)    
## (Intercept) -0.417055   0.185976  -2.243         0.02493 *  
## Fare         0.017258   0.002617   6.596 0.0000000000423 ***
## Age         -0.017578   0.005666  -3.103         0.00192 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 964.52  on 713  degrees of freedom
## Residual deviance: 891.34  on 711  degrees of freedom
## AIC: 897.34
## 
## Number of Fisher Scoring iterations: 5
```


```r
probs <- predict(fit_glm, type = "response")

df <- titanic %>% select(Fare, Age) %>% mutate(logit = qlogis(probs)) %>% 
    pivot_longer(names_to = "predictores", values_to = "valores.ajustados", 
        -logit)


ggplot(df, aes(valores.ajustados, logit)) + geom_point(size = 0.5, 
    alpha = 0.5) + geom_smooth(method = "loess") + 
    theme_bw() + facet_wrap(~predictores, scales = "free")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-249-1} \end{center}



### Valor de gran influencia 


```r
plot(fit_glm, which = 4)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-1} \end{center}

```r
plot(fit_glm, which = 1:6)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-2} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-3} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-4} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-5} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-6} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-250-7} \end{center}

```r
library(broom)
fit_data <- broom::augment(fit_glm) %>% mutate(indice = 1:n())

fit_data %>% top_n(3, .cooksd)
```

```
## # A tibble: 3 x 11
##   Survived  Fare   Age .fitted .se.fit .resid    .hat .sigma .cooksd .std.resid
##      <int> <dbl> <dbl>   <dbl>   <dbl>  <dbl>   <dbl>  <dbl>   <dbl>      <dbl>
## 1        0  263     19    3.79   0.631  -2.76 0.00862   1.12   0.129      -2.77
## 2        0  248.    24    3.43   0.584  -2.63 0.0103    1.12   0.109      -2.65
## 3        0  263     64    3.00   0.615  -2.47 0.0171    1.12   0.118      -2.49
## # ... with 1 more variable: indice <int>
```


```r
ggplot(fit_data, aes(indice, .std.resid)) + geom_point(aes(color = as.factor(Survived)), 
    alpha = 0.5) + theme_bw()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-252-1} \end{center}


```r
fit_data %>% filter(abs(.std.resid) > 3)
```

```
## # A tibble: 0 x 11
## # ... with 11 variables: Survived <int>, Fare <dbl>, Age <dbl>, .fitted <dbl>,
## #   .se.fit <dbl>, .resid <dbl>, .hat <dbl>, .sigma <dbl>, .cooksd <dbl>,
## #   .std.resid <dbl>, indice <int>
```



### Multicolinealidad 

 
 

```r
car::vif(fit_glm)
```

```
##     Fare      Age 
## 1.033878 1.033878
```


## Predicción y poder de clasificación 

Si queremos predecir posibles resultados con nuestro modelo logístico, debemos asegurarnos que el error no sea "muy grande". 


Ahora el error en este caso, se interpreta diferente que en regresión lineal clásica ya que nuestra salida solamente serán 0's o 1's. 


Primero recordemos que el modelo predictivo estaría definido por 


\begin{equation*}
\hat{p}(X)=\frac{1}{1+e^{-(\hat{\beta}_{0}+\hat{\beta}_{1} X_{1}+\cdots+\hat{\beta}_{p} X_{p})}}
\end{equation*}

donde los \(\beta\)'s son estimados usando IRLS. 


Ahora imaginemos que tenemos un conjunto de datos nuevo \((X^{*}_{1},\ldots,X^{*}_{p})\) y queremos ver que tipo de respuesta \(Y^{*}\) obtenemos (0 o 1). 

Obviamente nuestro modelo puede equivocarse y darnos una respuesta errónea. Por ejemplo digamos que en el caso del `titanic` uno esperaría que personas más jóvenes y que hayan pagado más por su tiquete tengan mayor probabilidad de sobrevivencia. 

Entonces tenemos realmente 4 opciones 


|           |       |                 |                 |     |
|:---------:|:-----:|:---------------:|:---------------:|:---:|
|           |       | **Clase**       | **Predicción**  |     |
|           |       | 0               | 1               |     |
| **Clase** | 0     | Verdaderos Negativos. (TN)  | Falsos Positivos (FP) | $N$ |
| **Real**  | 1     | Falsos Negativos (FN) | Verdaderos Positivos (TP)  | $P$ |
|           | Total | \(N^{*}\)       | \(P^{*}\)       |     |




```r
predict_numeric <- predict(fit_glm, type = "response")
predict_01 <- as.numeric(predict_numeric >= 0.5)

matriz_confusion <- table(titanic$Survived, predict_01)

colnames(matriz_confusion) <- c("N", "P")
rownames(matriz_confusion) <- c("N", "P")

matriz_confusion
```

```
##    predict_01
##       N   P
##   N 380  44
##   P 201  89
```


Para entender la siguiente tabla vamos a definir los siguietes términos:

Exactitud (Accuracy)
: Es la tasa de todos los individuos bien etiquetados $(TP+TN)/(TP+TN+FN+FP)$.

Precisión
: Es la tasa de elementos etiquetados 1 correctamente con respecto a los que fueron etiquetados 1 $Precisión = TP/P^*$


Sensibilidad (Exhaustividad)
: Es la tasa de elementos etiquetados 1 correctamente con respecto a los que realmente son 1. $Sensibilidad = TP/P$

F-Score
: Es la media armónica entre la precisión y la sensibilidad. $F-Score = 2*(Sensibilidad * Precisión)/(Sensibilidad + Precisión)$

Especificidad
: Es la tasa de elementos etiquetados 0 que realmente estaban etiquetados como 1. 

Entonces esto nos da las siguientes posibilidades. 


| Tipo                          | Cálculo                                               | Sinónimos                                                      |
|:------------------------------|:------------------------------------------------------|:---------------------------------------------------------------|
| Tasa Falsos Positivos         | $FP/N$                                                | Error Tipo I, 1-Especificidad                                  |
| Tasa Verdaderos Positivos     | \(TP/P\)                                              | 1-Error Tipo II, Poder, Sensibilidad,   Exhaustividad (Recall) |
| Valor de Predicción Positivos | $TP/P^{*}$                                            | Precisión, 1 - Proporción de Falsos Descubrimientos            |
| Valor de Predicción Negativos | $TN/N^{*}$                                            |                                                                |
| F-Score                       | $\frac{2(TP/P^{*} \times TP/P )}{(TP/P^{*} + TP/P )}$ |                                                                |



**CUIDADO:**

- Exactitud funciona bien cuando los datos son simétricos (igual número de FP y FN). 
- F-Scores es cuando los datos son asimétricos
- Precisión es qué tan seguro se está de los verdaderos positivos. 
- Sensibilidad es que tan seguro es que no se está perdiendo ningún positivo. 

En un modelo se debe escoger entre sensibilidad y precisión de acuerdo a ciertas ideas:

- **Sensibilidad** es importante si la ocurrencia de **falsos negativos** es inaceptable. Por ejemplo las prueba COVID-19. Posiblemente se obtendrá más falsos positivos pero este caso es aceptable. 
- **Precisión** es importante si se quiere estar más seguro de los **verdaderos positivos**. Por ejemplo detectar __spam__ en correos electrónicos. 
- **Especificidad** es importante si lo que se quiere es cubrir todos los **verdaderos negativos**, es decir, que no se quieren falsas alarmas. Por ejemplo se hacen pruebas de detección de drogas y si es positivo va a la cárcel. Los **falsos positivos** son intolerables. 


```r
(TN <- matriz_confusion["N", "N"])
```

```
## [1] 380
```

```r
(TP <- matriz_confusion["P", "P"])
```

```
## [1] 89
```

```r
(FP <- matriz_confusion["N", "P"])
```

```
## [1] 44
```

```r
(FN <- matriz_confusion["P", "N"])
```

```
## [1] 201
```

```r
(exactitud <- (TP + TN)/(TP + TN + FP + FN))
```

```
## [1] 0.6568627
```

```r
(precision <- TP/(TP + FP))
```

```
## [1] 0.6691729
```

```r
(sensibilidad <- TP/(TP + FN))
```

```
## [1] 0.3068966
```

```r
(F_score <- 2 * (precision * sensibilidad)/(precision + 
    sensibilidad))
```

```
## [1] 0.4208038
```

```r
(especificidad <- TN/(TN + FP))
```

```
## [1] 0.8962264
```


### Curva ROC


Un excelente clasificador debería detectar correctamente los **verdaderos positivos (TP)** e ignorar los **falsos positivos (FP)**.

Puesto de otra forma, si el clasificador es malo, los **verdaderos positivos** serían indistingibles de los **falsos positivos**. 

La curva ROC (Receiver Operation Curve) gráfica la Tasa Falsos Positivos vs Sensibilidad del modelo. 




```r
library(ROCR)

logist.pred.ROCR <- prediction(predict_numeric, titanic$Survived)

logist.perf <- performance(logist.pred.ROCR, "tpr", 
    "fpr")

plot(logist.perf)
abline(0, 1, col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-257-1} \end{center}

```r
auc <- performance(logist.pred.ROCR, measure = "auc")

auc@y.values
```

```
## [[1]]
## [1] 0.7063313
```
**PELIGRO**

Aquí estamos chequeando el poder de clasificación del modelo, con los mismos datos que usamos para ajustar el modelo. Es decir, le estamos diciendo al modelo que compruebe la veracidad de la clasificación que ya hizo previamente. 

Esto es incorrecto, ya que el modelo ya sabe "las respuestas"  y no estamos midiendo su poder de clasficación. 

Para resolver esto, debemos tomar otra muestra de prueba (__training__) que nos diga si el ajuste que hicimos es correcto. 


```r
titanic$id <- 1:nrow(titanic)

train <- titanic %>% sample_frac(0.75)

test <- titanic %>% anti_join(train, by = "id")
```


```r
fit_glm <- glm(Survived ~ Fare + Age, data = train, 
    family = "binomial")
```


```r
predict_numeric <- predict(fit_glm, newdata = test, 
    type = "response")
predict_01 <- as.numeric(predict_numeric >= 0.5)

matriz_confusion <- table(test$Survived, predict_01)

colnames(matriz_confusion) <- c("N", "P")
rownames(matriz_confusion) <- c("N", "P")

matriz_confusion
```

```
##    predict_01
##      N  P
##   N 93  9
##   P 57 19
```

```r
(TN <- matriz_confusion["N", "N"])
```

```
## [1] 93
```

```r
(TP <- matriz_confusion["P", "P"])
```

```
## [1] 19
```

```r
(FP <- matriz_confusion["N", "P"])
```

```
## [1] 9
```

```r
(FN <- matriz_confusion["P", "N"])
```

```
## [1] 57
```

```r
(exactitud <- (TP + TN)/(TP + TN + FP + FN))
```

```
## [1] 0.6292135
```

```r
(precision <- TP/(TP + FP))
```

```
## [1] 0.6785714
```

```r
(sensibilidad <- TP/(TP + FN))
```

```
## [1] 0.25
```

```r
(F_score <- 2 * (precision * sensibilidad)/(precision + 
    sensibilidad))
```

```
## [1] 0.3653846
```

```r
(especificidad <- TN/(TN + FP))
```

```
## [1] 0.9117647
```




```r
logist.pred.ROCR <- prediction(predict_numeric, test$Survived)

logist.perf <- performance(logist.pred.ROCR, "tpr", 
    "fpr")

plot(logist.perf)
abline(0, 1, col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-262-1} \end{center}

```r
auc <- performance(logist.pred.ROCR, measure = "auc")

auc@y.values
```

```
## [[1]]
## [1] 0.7138803
```



## Ejercicios

- Del libro [@James2013b]: 
    - Capítulo 4: 1, 6, 10, 11. (En esta sección no vimos LDA, QDA ni k-vecinos más cercanos, así que ignoren esas partes y concentrense en hacer los análisis correctos para regresión logística).

<!--chapter:end:05-regresion-logistica.Rmd-->





# Métodos de selección de variables


Cuando se construye un modelo de regresión (lineal o logística) existe la posibilidad de que existan más variables que datos disponibles. 

Si se recuerdan del Capítulo 4, el \(R^{2}\) ajustado tenía un factor \(n-p-1\) en el denominador y si \(n>p\) este tipo de indicador no se podría estimar.  

En este capítulo veremos cómo construir modelos más pequeños y hacer comparaciones entre ellos. 

  



## Selección del mejor subconjunto.

En este caso trataremos de seleccionar el mejor subconjunto de un total de \(p\) variables. Claramente si escogieramos solo \(k\)  varibles existiría $\binom{p}{k}$ modelos diferentes que escoger. 


El algoritmo para este caso sería: 




*Algoritmo:*
1. Sea $M_0$ el modelo nulo (solo tiene constantes).
1.  Para $k=1,2,\dots,p$ (número de variables),
    a. Ajuste todos los $\binom{p}{k}$ modelos que contengan $k$ predictores.
    b. Seleccione el mejor entre esos $\binom{p}{k}$ modelos. El "mejor" es el que tenga el $RSS$ menor, o el $R^2$ más grande. Llame a este modelo $M_k$. 
1.  Seleccione el mejor modelo entre $M_0,M_1,\dots,M_p$  seleccione aquel que tenga mejor error de validación cruzada, $C_p$, $AIC$, $BIC$ o $R^2$ ajustado.

**Nota: Más adelante veremos qué es validación cruzada, \(C_p\),  \(AIC\) y \(BIC\)**

*Ejemplo:* $Y = \beta_0+\beta_1X_1+ \beta_2X_2 + \beta_3X_3$. 

Puede ser que el mejor modelo sea

* $Y = \beta_0$, 

* $Y = \beta_0+\beta_1X_1$, 

* $Y = \beta_0+\beta_2X_2$, 

* $Y = \beta_0+\beta_3X_3$,

* $Y = \beta_0+\beta_1X_1+\beta_2X_2$,

* $Y = \beta_0+\beta_1X_1+\beta_3X_3$, entre otras.

De los que tienen $k=1$ variable, hay $\binom{3}{1}$ = 3 modelos. Para $k=2$, son $\binom{3}{2}$ = 3, y para $k=3$, solo un modelo. Para $k=1$, se ajustan los 3 y al mejor se le llama $M_1$. Así para los otros $k$. Obtenidos estos modelos, se escoge el que tenga la mejor medida, con respecto a los errores antes mencionados.

*Notas:* 

- La parte 2.b. se hace con la muestra de entrenamiento. **Objetivo: Minimizar el error de entrenamiento.**
* La parte 3 se selecciona con los datos de prueba. **Objetivo: Minimizar el error de prueba**. 
- Si se usa el $RSS$ o $R^2$, siempre se selecciona el modelo con el número mayor de variables. Este es un problema de sobreajuste.
- El gran problema es la cantidad de variables y los modelos por ajustar, los cuales son \(\sum_{k=1}^n \binom{p}{k}\). Computacionalmente ineficiente. 


### Error de prueba
El problema con el error de prueba es que contiene una fuente de variabilidad no observada por el modelo. 

**2 soluciones**

a. Estimar indirectamente el error de prueba al añadirle un factor de sobreajuste. Es decir, agregarle artificialmente la variabilidad no observada, pero incluyendo más sesgo. 
b. Estimar directamente el error de prueba usando validación cruzada.


#### Validación cruzada


Dividir aleatoriamente los datos totales en 2 partes (con tamaños comparables)

- Conjunto de prueba: Se ajusta el modelo. 
- Conjunto de validación: El modelo ajustado se usa para predecir en este conjunto. 

Se usa una medida de validación en cada escogencia de los dos conjuntos (\(MSE\) en el caso cuantitativo)

1. Puede que el varianza del estimador tenga una varianza muy alta. 
2. El error de validación tiende a ser mayor que el error de entrenamiento. Puede haber sobreestimación. 

##### Validación cruzada "Leave-One-Out" (LOOCV)

Una sola observación \( \left( X_{i}, Y_{i} \right) \) se usa en el conjunto de validación. Observaciones restantes, se usan en el conjunto de entrenamiento. 

Defina 

\begin{equation*}
MSE_{i} =(Y_{i}-\hat{Y}_{i})^{2}
\end{equation*}
 
como el error cometido por usar la observación \(i\) como muestra de prueba y el resto de valores como muestra de entrenamiento. 

El estimador LOOCV es 

\begin{equation*}
CV_{n} = \frac{1}{n} \sum_{i=1}^{n} MSE_{i}
\end{equation*}


**Ventajas**

1. Menos sesgo. (Conjunto de prueba de tamaño casi igual que los datos totales). 
2. Menos varianza.

**Problema: Puede ser lento, dependiendo de la cantidad de datos.**

##### Validación cruzada \(k-\)veces

Se aplica el mismo principio que LOOCV, pero se divide la muestra en \(k\) distintas partes. 

\begin{equation*}
CV_{k} = \frac{1}{k} \sum_{i=1}^{k} MSE_{k}
\end{equation*}

**Ventajas: Es más económico**

**Desventaja: Nivel intermedio de sesgo**

\begin{equation*}
\frac{n}{2} < \frac{(k-1)n}{k} < n-1
\end{equation*}

#### Validación cruzada para clasificación

Se usa 

\begin{equation*}
CV_{n} = \frac{1}{n} \sum_{i=1}^{n} Err_{n}
\end{equation*}


donde \(Err_i = I_{Y_i \neq \hat{Y}_{i}}\)


y \(CV_{k}\) se define similar 


### Otras medidas de error de entrenamiento


* $C_p$. Se usa en ajustes con mínimos cuadrados. 
$$ C_p = \dfrac{1}{n}\left[RSS+2k\hat\sigma^2\right]$$
donde $k$ es el número de predictores y $\hat\sigma^2$ es el estimador de la varianza de los errores $\epsilon$. Si $\hat\sigma^2$ es insegado de $\sigma^2$, entonces $C_p$ es un estimador insesgado del $MSE$ de prueba. 

* $C_p$ de Mallows. Se denota $C_p'$.
$$ C_p' = \dfrac{RSS}{\hat\sigma^2} + 2k-n \implies C_p = \dfrac1n\hat\sigma^2[C_p'+n] \propto C_p'$$

* $AIC$ (Akaike Information Criterion).
$$AIC = \dfrac{1}{n\hat\sigma^2}[RSS + 2k\hat\sigma^2] \propto C_p'$$
* $MLE$: $2\ln L(\beta | x) + 2k$.

* $BIC$ (Bayesian Information Criterion).

$$BIC =  \dfrac1n[RSS+\ln(n)k\hat\sigma²]$$

* $R^2$ ajustado. Recuerde que $R^2 = 1 - \dfrac{RSS}{TSS}$. Como $RSS$ decrece si se le agrega más variables, entonces $R^2 \nearrow 1$. Vea que $RSS = \sum(y_i-\hat{y}_i)^2$ y $TSS = \sum(y_i-\bar{y}_i)^2$, entonces,
$$R^2 \text{ ajustado}= 1-\dfrac{\dfrac{RSS}{n-k-1}}{\dfrac{TSS}{n-1}}$$


Una explicación detallada de cada medida la pueden encontrar en el Capítulo 7 [@Hastie2009a].


### Selección de modelos hacia adelante (**Forward Stepwise Selection**)

1. Sea $M_0$ el modelo nulo. 
1. Para $k=0,1,\dots,p-1$,
    a. Considere los $p-k$ modelos que contenga los predictores en $M_k$ con un predictor adicional.
    a. Seleccione el mejor entre esos $p-k$ modelos usando el $R^2$ o $RSS$. Llámelo $M_{k+1}$.
1. Seleccione el mejor modelo entre $M_0,\dots, M_p$ usando $VC$, $Cp$, $AIC$, $BIC$ o $R^2$ ajustado.


*Ejemplo:*  $Y=\beta_0+\beta_1X_1+\beta_2X_2+\beta_3X_3$

* $M_0$: $Y = \beta_0$

* $M_1$: $Y = \beta_0+\beta_1X_1$, $Y = \beta_0+\beta_2X_2$ o $Y = \beta_0+\beta_3X_3$. De los tres se escoge el mejor (por ejemplo, la segundo) y se le llama $M_1$. 

* $M_2$: a $Y = \beta_0+\beta_2X_2$, que es $M_1$, se le suma una variable extra ($\beta_1X_1$ o $\beta_3X_1$) y se selecciona la mejor. 

* $M_3$: $M_2$ más la variable no incluida.

*Nota:* el número de modelos por calcular usando el mejor subconjunto  es $n^p$, mientras que usando Forward es $1+\displaystyle\sum_0^ {p-1} p-k = \dfrac{1+p(1+p)}2$.

### Selección de modelos hacia atrás (**Backward Stepwise Selection**)


1. Sea $M_p$ el modelo completo.
1. Para $k=p,p-1,\dots,1$,
    a. Considere los $k$ modelos que contienen todos excepto uno de los predictores en $M_k$ para un total de $k-1$ predictores.
    a. Seleccione el mejor entre esos $k$ modelos usando el $R^2$ o $RSS$. Llámelo $M_{k+1}$.
1. Seleccione el mejor modelo entre $M_0,\dots,M_p$ usando $VC$, $C_p$, $AIC$, $BIC$ o $R^2$ ajustado.


*Ejemplo:*  $Y=\beta_0+\beta_1X_1+\beta_2X_2+\beta_3X_3$

* $M_3$: $Y = \beta_0 +\beta_1X_1+\beta_2X_2+\beta_3X_3$.

* $M_2$: se quita una variable ($X_1$, $X_2$ o $X_3$) y se selecciona el mejor. Por ejemplo, se remueve $X_1$.

* $M_1$: A $M_{2}$ le quito otra variable. En este caso, $X_2$ o $X_3$ y se escoge el mejor.

* $M_0$: $Y=\beta_0$, el modelo nulo.

## Métodos de regularización

### Regresión Ridge

Considere 
$$ RSS = \sum_{i=1}^{n}\left(y_i-\beta\sigma\sum_{j=1}^{p}\beta_jX_{ij}\right)^2 $$
y 
\[
\hat\beta = \underset{\beta}{\mathrm{argmin}} RSS
\]


La regresión Ridge consiste en determinar

$$ \hat\beta^R_\lambda = \underset{\beta}{\mathrm{argmin}}\left[RSS + \lambda\sum_{j=1}^n\beta_j^2\right]$$

Se define:
$$\|\beta_{-0}\|^2_2 = \sum_{j=1}^{n}\beta_j^2$$

- Si $\lambda = 0$, $\hat\beta = \beta^R_\lambda$: caso de máxima varianza, con el menor sesgo posible.
- Si $\lambda \to +\infty$, $\beta \to 0$: se sacrifican todos los parámetros $\beta$. Máximo sesgo pero varianza nula.


¿Cómo se debe seleccionar el $\lambda$?
El método para seleccionarlo es por validación cruzada

#### Estimación clásica por mínimos cuadrados.
$$ \hat\beta = (X^T\cdot X)^{-1}X^Ty$$
Si se multiplica una constante $c$ a $Xi$, entonces $\hat\beta = \dfrac{\hat\beta_i}{c}$. La constante $c$ afecta directamente al $\|\beta_{-0}\|^2_2$, por lo que se recomienda estandarizar las covariables.

#### Ventajas


1. Indica el balance entre sesgo y varianza.
1. Si $p>n$ (mayor cantidad de variables que datos), al realizar mínimos cuadrados, no se puede dar una solución, pero con la forma de regresión de Ridge es posible alcanzarla.
1. Computacionalmente es más eficiente que usando selección de "todos los subconjuntos".


### Regresión Lasso
$$ \beta_{\lambda}^{LASSO} = \underset{\beta}{\mathrm{argmin}}\left(RSS + \lambda\sum_{j=1}^n |\beta_j|\right)$$
Se define
$$ \|\beta_{-0}\|_1 = \sum_{j=1}^n|\beta_j|$$
Otra formulación para los métodos vistos son:


1. \textbf{Ridge}: $\underset{\beta}{\min} RSS$, sujeto a $\displaystyle\sum_{j=1}^p\beta_j^2 \leq s$.
1. \textbf{Lasso}: $\underset{\beta}{\min} RSS$, sujeto a $\displaystyle\sum_{j=1}^p|\beta_j| \leq s$.
<!-- 1. \textbf{Mejor subconjunto}: $\underset{\beta}{\min} RSS$, sujeto a $\displaystyle\sum_{j=1}^p I_{\lbrace\beta_j \neq 0\rbrace} \leq s$. -->


### Explicación gráfica

![Tomado de [DataSklr](https://www.datasklr.com/extensions-of-ols-regression/regularization-and-shrinkage-ridge-lasso-and-elastic-net-regression)](manual_figures/ridge-lasso.png)



![Tomado de [Towards to Data Science](https://towardsdatascience.com/regularization-in-machine-learning-connecting-the-dots-c6e030bfaddd)](manual_figures/ridge-lasso2.png)

## Laboratorio

### Cross-Validation

#### Leave-one-out Cross Validation (LOOCV)

Es posible comparar distintos ajustes de modelos usando cross-validation.

Carguemos la base de datos `Auto` de `ISLR`.


```r
library(ISLR)
data("Auto")
```

Y ajustamos un modelo entre las millas por galon contra los caballos de fuerza de ciertos vehículos.


```r
glm.fit <- glm(mpg ~ horsepower, data = Auto)
summary(glm.fit)
```

```
## 
## Call:
## glm(formula = mpg ~ horsepower, data = Auto)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -13.5710   -3.2592   -0.3435    2.7630   16.9240  
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 39.935861   0.717499   55.66   <2e-16 ***
## horsepower  -0.157845   0.006446  -24.49   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 24.06645)
## 
##     Null deviance: 23819.0  on 391  degrees of freedom
## Residual deviance:  9385.9  on 390  degrees of freedom
## AIC: 2363.3
## 
## Number of Fisher Scoring iterations: 2
```

La librería `boot` tiene funciones para aplicar cross-validation. Por ejemplo,


```r
library(boot)
glm.fit <- glm(mpg ~ horsepower, data = Auto)
cv.err <- cv.glm(Auto, glm.fit)
cv.err$delta
```

```
## [1] 24.23151 24.23114
```

En particular se puede usar un `for` para aplicar este mismo procedimiento a múltiples modelos.


```r
cv.error.LOOCV = rep(0, 5)
for (i in 1:5) {
    glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
    cv.error.LOOCV[i] = cv.glm(Auto, glm.fit)$delta[1]
}
cv.error.LOOCV
```

```
## [1] 24.23151 19.24821 19.33498 19.42443 19.03321
```

```r
plot(cv.error.LOOCV, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-267-1} \end{center}

#### K-Fold Cross Validation

Este procedimiento se puede repetir con los el K-fold.


```r
set.seed(17)
cv.error.10 = rep(0, 10)
for (i in 1:10) {
    glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
    cv.error.10[i] = cv.glm(Auto, glm.fit, K = 10)$delta[1]
}
cv.error.10
```

```
##  [1] 24.27207 19.26909 19.34805 19.29496 19.03198 18.89781 19.12061 19.14666
##  [9] 18.87013 20.95520
```

```r
plot(cv.error.LOOCV, type = "l", col = "red")
lines(cv.error.10, type = "l", col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-268-1} \end{center}

### Selección de variables

Cargue los datos `Hitters` del paquete `ISLR` que representan el salario de varios jugadores de beisbol y sus estadística de juego (número de bateos, home runs, carreras, etc.).

#### Análisis exploratorio

Con esta información, haga un análisis exploratorio de los datos usando `ggpairs`.


```r
library(GGally)
ggpairs(Hitters)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-269-1} \end{center}

```r
summary(Hitters)
```

```
##      AtBat            Hits         HmRun            Runs       
##  Min.   : 16.0   Min.   :  1   Min.   : 0.00   Min.   :  0.00  
##  1st Qu.:255.2   1st Qu.: 64   1st Qu.: 4.00   1st Qu.: 30.25  
##  Median :379.5   Median : 96   Median : 8.00   Median : 48.00  
##  Mean   :380.9   Mean   :101   Mean   :10.77   Mean   : 50.91  
##  3rd Qu.:512.0   3rd Qu.:137   3rd Qu.:16.00   3rd Qu.: 69.00  
##  Max.   :687.0   Max.   :238   Max.   :40.00   Max.   :130.00  
##                                                                
##       RBI             Walks            Years            CAtBat       
##  Min.   :  0.00   Min.   :  0.00   Min.   : 1.000   Min.   :   19.0  
##  1st Qu.: 28.00   1st Qu.: 22.00   1st Qu.: 4.000   1st Qu.:  816.8  
##  Median : 44.00   Median : 35.00   Median : 6.000   Median : 1928.0  
##  Mean   : 48.03   Mean   : 38.74   Mean   : 7.444   Mean   : 2648.7  
##  3rd Qu.: 64.75   3rd Qu.: 53.00   3rd Qu.:11.000   3rd Qu.: 3924.2  
##  Max.   :121.00   Max.   :105.00   Max.   :24.000   Max.   :14053.0  
##                                                                      
##      CHits            CHmRun           CRuns             CRBI        
##  Min.   :   4.0   Min.   :  0.00   Min.   :   1.0   Min.   :   0.00  
##  1st Qu.: 209.0   1st Qu.: 14.00   1st Qu.: 100.2   1st Qu.:  88.75  
##  Median : 508.0   Median : 37.50   Median : 247.0   Median : 220.50  
##  Mean   : 717.6   Mean   : 69.49   Mean   : 358.8   Mean   : 330.12  
##  3rd Qu.:1059.2   3rd Qu.: 90.00   3rd Qu.: 526.2   3rd Qu.: 426.25  
##  Max.   :4256.0   Max.   :548.00   Max.   :2165.0   Max.   :1659.00  
##                                                                      
##      CWalks        League  Division    PutOuts          Assists     
##  Min.   :   0.00   A:175   E:157    Min.   :   0.0   Min.   :  0.0  
##  1st Qu.:  67.25   N:147   W:165    1st Qu.: 109.2   1st Qu.:  7.0  
##  Median : 170.50                    Median : 212.0   Median : 39.5  
##  Mean   : 260.24                    Mean   : 288.9   Mean   :106.9  
##  3rd Qu.: 339.25                    3rd Qu.: 325.0   3rd Qu.:166.0  
##  Max.   :1566.00                    Max.   :1378.0   Max.   :492.0  
##                                                                     
##      Errors          Salary       NewLeague
##  Min.   : 0.00   Min.   :  67.5   A:176    
##  1st Qu.: 3.00   1st Qu.: 190.0   N:146    
##  Median : 6.00   Median : 425.0            
##  Mean   : 8.04   Mean   : 535.9            
##  3rd Qu.:11.00   3rd Qu.: 750.0            
##  Max.   :32.00   Max.   :2460.0            
##                  NA's   :59
```

Para limpiar la base de datos de `NA` usamos `dplyr`.


```r
library(tidyverse)
Hitters <- Hitters %>% drop_na()
```

#### Selección del mejor subconjunto

Cargue la librería


```r
library(leaps)
```

y busque la ayuda de la función `regsubsets`. Use esta función para ajustar todo los posibles modelos de la forma `Salary ~ .`.

Puede guardar estos modelos en ciertas variables (e.g. `regfit.full`) y usar la función `plot`.


```r
library(leaps)
regfit.full <- regsubsets(Salary ~ ., Hitters)
summary(regfit.full)
```

```
## Subset selection object
## Call: regsubsets.formula(Salary ~ ., Hitters)
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 8
## Selection Algorithm: exhaustive
##          AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns CRBI
## 1  ( 1 ) " "   " "  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 2  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 3  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 4  ( 1 ) " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 5  ( 1 ) "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 6  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "   "*" 
## 7  ( 1 ) " "   "*"  " "   " "  " " "*"   " "   "*"    "*"   "*"    " "   " " 
## 8  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   " "    " "   "*"    "*"   " " 
##          CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 ) " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 ) " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 ) " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 ) " "    " "     "*"       "*"     " "     " "    " "       
## 5  ( 1 ) " "    " "     "*"       "*"     " "     " "    " "       
## 6  ( 1 ) " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 ) " "    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 ) "*"    " "     "*"       "*"     " "     " "    " "
```

Se puede incluir todas las variables con `nvmax = 19`.


```r
library(leaps)
regfit.full <- regsubsets(Salary ~ ., Hitters, nvmax = 19)
regfit.full.summary <- summary(regfit.full)
regfit.full.summary
```

```
## Subset selection object
## Call: regsubsets.formula(Salary ~ ., Hitters, nvmax = 19)
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 19
## Selection Algorithm: exhaustive
##           AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns CRBI
## 1  ( 1 )  " "   " "  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 2  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 3  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 4  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 5  ( 1 )  "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 6  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "   "*" 
## 7  ( 1 )  " "   "*"  " "   " "  " " "*"   " "   "*"    "*"   "*"    " "   " " 
## 8  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   "*"    "*"   " " 
## 9  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 10  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 11  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 12  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 13  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 14  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 15  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    "*"   " "    "*"   "*" 
## 16  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 17  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 18  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   " "    "*"   "*" 
## 19  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   "*"    "*"   "*" 
##           CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 )  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 5  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 6  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 9  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 10  ( 1 ) "*"    " "     "*"       "*"     "*"     " "    " "       
## 11  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 12  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 13  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 14  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 15  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 16  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 17  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 18  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 19  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"
```

```r
str(regfit.full.summary)
```

```
## List of 8
##  $ which : logi [1:19, 1:20] TRUE TRUE TRUE TRUE TRUE TRUE ...
##   ..- attr(*, "dimnames")=List of 2
##   .. ..$ : chr [1:19] "1" "2" "3" "4" ...
##   .. ..$ : chr [1:20] "(Intercept)" "AtBat" "Hits" "HmRun" ...
##  $ rsq   : num [1:19] 0.321 0.425 0.451 0.475 0.491 ...
##  $ rss   : num [1:19] 36179679 30646560 29249297 27970852 27149899 ...
##  $ adjr2 : num [1:19] 0.319 0.421 0.445 0.467 0.481 ...
##  $ cp    : num [1:19] 104.3 50.7 38.7 27.9 21.6 ...
##  $ bic   : num [1:19] -90.8 -128.9 -135.6 -141.8 -144.1 ...
##  $ outmat: chr [1:19, 1:19] " " " " " " " " ...
##   ..- attr(*, "dimnames")=List of 2
##   .. ..$ : chr [1:19] "1  ( 1 )" "2  ( 1 )" "3  ( 1 )" "4  ( 1 )" ...
##   .. ..$ : chr [1:19] "AtBat" "Hits" "HmRun" "Runs" ...
##  $ obj   :List of 28
##   ..$ np       : int 20
##   ..$ nrbar    : int 190
##   ..$ d        : num [1:20] 2.63e+02 1.10e+08 1.61e+05 1.85e+07 5.58e+03 ...
##   ..$ rbar     : num [1:190] 722.19 51.49 290.71 11.62 7.31 ...
##   ..$ thetab   : num [1:20] 535.926 0.382 5.509 0.306 -4.051 ...
##   ..$ first    : int 2
##   ..$ last     : int 20
##   ..$ vorder   : int [1:20] 1 10 6 17 4 8 19 16 5 15 ...
##   ..$ tol      : num [1:20] 8.11e-09 1.71e-05 7.91e-07 7.08e-06 1.94e-07 ...
##   ..$ rss      : num [1:20] 53319113 37253973 32381808 30651377 30559801 ...
##   ..$ bound    : num [1:20] 53319113 36179679 30646560 29249297 27970852 ...
##   ..$ nvmax    : int 20
##   ..$ ress     : num [1:20, 1] 53319113 36179679 30646560 29249297 27970852 ...
##   ..$ ir       : int 20
##   ..$ nbest    : int 1
##   ..$ lopt     : int [1:210, 1] 1 1 13 1 3 13 1 3 17 13 ...
##   ..$ il       : int 210
##   ..$ ier      : int 0
##   ..$ xnames   : chr [1:20] "(Intercept)" "AtBat" "Hits" "HmRun" ...
##   ..$ method   : chr "exhaustive"
##   ..$ force.in : Named logi [1:20] TRUE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..- attr(*, "names")= chr [1:20] "" "AtBat" "Hits" "HmRun" ...
##   ..$ force.out: Named logi [1:20] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   .. ..- attr(*, "names")= chr [1:20] "" "AtBat" "Hits" "HmRun" ...
##   ..$ sserr    : num 24200700
##   ..$ intercept: logi TRUE
##   ..$ lindep   : logi [1:20] FALSE FALSE FALSE FALSE FALSE FALSE ...
##   ..$ nullrss  : num 53319113
##   ..$ nn       : int 263
##   ..$ call     : language regsubsets.formula(Salary ~ ., Hitters, nvmax = 19)
##   ..- attr(*, "class")= chr "regsubsets"
##  - attr(*, "class")= chr "summary.regsubsets"
```

```r
idx <- which.max(regfit.full.summary$rsq)
plot(regfit.full.summary$rsq)
points(idx, regfit.full.summary$rsq[idx], col = "red", 
    cex = 2, pch = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-1} \end{center}

```r
idx <- which.min(regfit.full.summary$rss)
plot(regfit.full.summary$rss)
points(idx, regfit.full.summary$rss[idx], col = "red", 
    cex = 2, pch = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-2} \end{center}

```r
idx <- which.max(regfit.full.summary$adjr2)
plot(regfit.full.summary$adjr2)
points(idx, regfit.full.summary$adjr2[idx], col = "red", 
    cex = 2, pch = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-3} \end{center}

```r
idx <- which.min(regfit.full.summary$cp)
plot(regfit.full.summary$cp)
points(idx, regfit.full.summary$cp[idx], col = "red", 
    cex = 2, pch = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-4} \end{center}

```r
idx <- which.min(regfit.full.summary$bic)
plot(regfit.full.summary$bic)
points(idx, regfit.full.summary$bic[idx], col = "red", 
    cex = 2, pch = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-5} \end{center}

```r
plot(regfit.full, scale = "r2")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-6} \end{center}

```r
plot(regfit.full, scale = "bic")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-7} \end{center}

```r
plot(regfit.full, scale = "Cp")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-8} \end{center}

```r
plot(regfit.full, scale = "adjr2")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-273-9} \end{center}

```r
coef(regfit.full, 10)
```

```
##  (Intercept)        AtBat         Hits        Walks       CAtBat        CRuns 
##  162.5354420   -2.1686501    6.9180175    5.7732246   -0.1300798    1.4082490 
##         CRBI       CWalks    DivisionW      PutOuts      Assists 
##    0.7743122   -0.8308264 -112.3800575    0.2973726    0.2831680
```

#### Regresión forward y backward

La función `regsubsets` tiene un paramétro `method`. Usen los valores `forward` y `backward` y comparen los resultados.

Puede guardar estos modelos en ciertas variables (e.g. `regfit.fwd` y `regfit.bwd`) y usar la función `plot`.


```r
regfit.fwd <- regsubsets(Salary ~ ., data = Hitters, 
    nvmax = 19, method = "forward")
summary(regfit.fwd)
```

```
## Subset selection object
## Call: regsubsets.formula(Salary ~ ., data = Hitters, nvmax = 19, method = "forward")
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 19
## Selection Algorithm: forward
##           AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns CRBI
## 1  ( 1 )  " "   " "  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 2  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 3  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 4  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 5  ( 1 )  "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    " "   "*" 
## 6  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "   "*" 
## 7  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    " "   "*" 
## 8  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"   "*" 
## 9  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 10  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 11  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 12  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 13  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 14  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 15  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    "*"   " "    "*"   "*" 
## 16  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 17  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 18  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   " "    "*"   "*" 
## 19  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   "*"    "*"   "*" 
##           CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 )  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 5  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 6  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 9  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 10  ( 1 ) "*"    " "     "*"       "*"     "*"     " "    " "       
## 11  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 12  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 13  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 14  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 15  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 16  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 17  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 18  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 19  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"
```

```r
regfit.bwd <- regsubsets(Salary ~ ., data = Hitters, 
    nvmax = 19, method = "backward")
summary(regfit.bwd)
```

```
## Subset selection object
## Call: regsubsets.formula(Salary ~ ., data = Hitters, nvmax = 19, method = "backward")
## 19 Variables  (and intercept)
##            Forced in Forced out
## AtBat          FALSE      FALSE
## Hits           FALSE      FALSE
## HmRun          FALSE      FALSE
## Runs           FALSE      FALSE
## RBI            FALSE      FALSE
## Walks          FALSE      FALSE
## Years          FALSE      FALSE
## CAtBat         FALSE      FALSE
## CHits          FALSE      FALSE
## CHmRun         FALSE      FALSE
## CRuns          FALSE      FALSE
## CRBI           FALSE      FALSE
## CWalks         FALSE      FALSE
## LeagueN        FALSE      FALSE
## DivisionW      FALSE      FALSE
## PutOuts        FALSE      FALSE
## Assists        FALSE      FALSE
## Errors         FALSE      FALSE
## NewLeagueN     FALSE      FALSE
## 1 subsets of each size up to 19
## Selection Algorithm: backward
##           AtBat Hits HmRun Runs RBI Walks Years CAtBat CHits CHmRun CRuns CRBI
## 1  ( 1 )  " "   " "  " "   " "  " " " "   " "   " "    " "   " "    "*"   " " 
## 2  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"   " " 
## 3  ( 1 )  " "   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"   " " 
## 4  ( 1 )  "*"   "*"  " "   " "  " " " "   " "   " "    " "   " "    "*"   " " 
## 5  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"   " " 
## 6  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"   " " 
## 7  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"   " " 
## 8  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   " "    " "   " "    "*"   "*" 
## 9  ( 1 )  "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 10  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 11  ( 1 ) "*"   "*"  " "   " "  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 12  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 13  ( 1 ) "*"   "*"  " "   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 14  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    " "   " "    "*"   "*" 
## 15  ( 1 ) "*"   "*"  "*"   "*"  " " "*"   " "   "*"    "*"   " "    "*"   "*" 
## 16  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 17  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   " "   "*"    "*"   " "    "*"   "*" 
## 18  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   " "    "*"   "*" 
## 19  ( 1 ) "*"   "*"  "*"   "*"  "*" "*"   "*"   "*"    "*"   "*"    "*"   "*" 
##           CWalks LeagueN DivisionW PutOuts Assists Errors NewLeagueN
## 1  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 2  ( 1 )  " "    " "     " "       " "     " "     " "    " "       
## 3  ( 1 )  " "    " "     " "       "*"     " "     " "    " "       
## 4  ( 1 )  " "    " "     " "       "*"     " "     " "    " "       
## 5  ( 1 )  " "    " "     " "       "*"     " "     " "    " "       
## 6  ( 1 )  " "    " "     "*"       "*"     " "     " "    " "       
## 7  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 8  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 9  ( 1 )  "*"    " "     "*"       "*"     " "     " "    " "       
## 10  ( 1 ) "*"    " "     "*"       "*"     "*"     " "    " "       
## 11  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 12  ( 1 ) "*"    "*"     "*"       "*"     "*"     " "    " "       
## 13  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 14  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 15  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 16  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    " "       
## 17  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 18  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"       
## 19  ( 1 ) "*"    "*"     "*"       "*"     "*"     "*"    "*"
```

```r
par(mfrow = c(1, 2))
plot(regfit.fwd, scale = "r2")
plot(regfit.bwd, scale = "r2")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-274-1} \end{center}

```r
par(mfrow = c(1, 2))
plot(regfit.fwd, scale = "bic")
plot(regfit.bwd, scale = "bic")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-274-2} \end{center}

```r
par(mfrow = c(1, 2))
plot(regfit.fwd, scale = "Cp")
plot(regfit.bwd, scale = "Cp")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-274-3} \end{center}

```r
par(mfrow = c(1, 2))
plot(regfit.fwd, scale = "adjr2")
plot(regfit.bwd, scale = "adjr2")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-274-4} \end{center}

#### Regresión Ridge


```r
x <- model.matrix(Salary ~ ., Hitters)[, -1]
y <- Hitters$Salary
```

Usando el paquete `glmnet` y la función con el mismo nombre, ejecute el siguiente comando


```r
library(glmnet)
grid <- 10^seq(10, -2, length = 100)
ridge.mod <- glmnet(x, y, alpha = 0, lambda = grid)
```

El factor `lambda` representa el $\lambda$ de la fórmula


$$ \hat{\beta} = \underset{\beta}{\mathrm{argmin}} \left\{RSS + \lambda \Vert \beta \Vert_2^2\right\}.$$

Si no se incluye el paramétro lambda del modelo, R construye una secuencia de $\lambda'$s estimados por validación cruzada.

Haga lo siguiente:

1. Construya un modelo usando todos los datos (sin separar muestra de entrenamiento y prueba).

2. Construya el siguiente modelo



```r
set.seed(1)
train <- sample(1:nrow(x), nrow(x)/2)
test <- -train
y.test <- y[test]
ridge.mod <- glmnet(x[train, ], y[train], alpha = 0, 
    lambda = grid)
ridge.pred <- predict(ridge.mod, s = 4, newx = x[test, 
    ])

# MSE
mean((ridge.pred - y.test)^2)
```

```
## [1] 142226.5
```

¿Qué ocurre si se cambia el paramétro $s$ de `predict` por un `10e10` (i.e. $10^{10}$). Comente los resultados. ¿Y qué ocurre si $s=0$?

3. Finalmente, ejecute el siguiente código


```r
set.seed(1)
cv.out <- cv.glmnet(x[train, ], y[train], alpha = 0)
plot(cv.out)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-278-1} \end{center}

Busque la ayuda de `cv.glmnet` y deduzca qué significa el gráfico.


```r
library(glmnet)
grid <- 10^seq(10, -2, length = 100)
ridge.mod <- glmnet(x, y, alpha = 0, lambda = grid)

ridge.mod$lambda[50]
```

```
## [1] 11497.57
```

```r
coef(ridge.mod)[, 50]
```

```
##   (Intercept)         AtBat          Hits         HmRun          Runs 
## 407.356050200   0.036957182   0.138180344   0.524629976   0.230701523 
##           RBI         Walks         Years        CAtBat         CHits 
##   0.239841459   0.289618741   1.107702929   0.003131815   0.011653637 
##        CHmRun         CRuns          CRBI        CWalks       LeagueN 
##   0.087545670   0.023379882   0.024138320   0.025015421   0.085028114 
##     DivisionW       PutOuts       Assists        Errors    NewLeagueN 
##  -6.215440973   0.016482577   0.002612988  -0.020502690   0.301433531
```

```r
sqrt(sum(coef(ridge.mod)[-1, 50]^2))
```

```
## [1] 6.360612
```

```r
ridge.mod$lambda[60]
```

```
## [1] 705.4802
```

```r
coef(ridge.mod)[, 60]
```

```
##  (Intercept)        AtBat         Hits        HmRun         Runs          RBI 
##  54.32519950   0.11211115   0.65622409   1.17980910   0.93769713   0.84718546 
##        Walks        Years       CAtBat        CHits       CHmRun        CRuns 
##   1.31987948   2.59640425   0.01083413   0.04674557   0.33777318   0.09355528 
##         CRBI       CWalks      LeagueN    DivisionW      PutOuts      Assists 
##   0.09780402   0.07189612  13.68370191 -54.65877750   0.11852289   0.01606037 
##       Errors   NewLeagueN 
##  -0.70358655   8.61181213
```

```r
sqrt(sum(coef(ridge.mod)[-1, 60]^2))
```

```
## [1] 57.11001
```

```r
plot(ridge.mod)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-279-1} \end{center}

```r
ridge.mod <- glmnet(x, y, alpha = 0)
ridge.mod$lambda
```

```
##   [1] 255282.09651 232603.53866 211939.68139 193111.54424 175956.04690
##   [6] 160324.59666 146081.80138 133104.29678 121279.67791 110505.52560
##  [11] 100688.51928  91743.62874  83593.37763  76167.17236  69400.69070
##  [16]  63235.32462  57617.67267  52499.07743  47835.20409  43585.65640
##  [21]  39713.62682  36185.57767  32970.95069  30041.90230  27373.06250
##  [26]  24941.31507  22725.59739  20706.71795  18867.19020  17191.08102
##  [31]  15663.87277  14272.33748  13004.42236  11849.14532  10796.49991
##  [36]   9837.36861   8963.44390   8167.15625   7441.60860   6780.51660
##  [41]   6178.15419   5629.30400   5129.21215   4673.54708   4258.36204
##  [46]   3880.06089   3535.36698   3221.29472   2935.12377   2674.37547
##  [51]   2436.79132   2220.31350   2023.06697   1843.34327   1679.58574
##  [56]   1530.37597   1394.42159   1270.54502   1157.67330   1054.82879
##  [61]    961.12071    875.73740    797.93930    727.05257    662.46322
##  [66]    603.61182    549.98861    501.12914    456.61020    416.04621
##  [71]    379.08581    345.40887    314.72370    286.76452    261.28915
##  [76]    238.07694    216.92684    197.65566    180.09647    164.09720
##  [81]    149.51926    136.23638    124.13351    113.10583    103.05782
##  [86]     93.90245     85.56042     77.95946     71.03376     64.72332
##  [91]     58.97348     53.73443     48.96082     44.61127     40.64813
##  [96]     37.03706     33.74679     30.74882     28.01718     25.52821
```

```r
plot(ridge.mod)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-279-2} \end{center}

```r
predict(ridge.mod, s = 50, type = "coefficients")
```

```
## 20 x 1 sparse Matrix of class "dgCMatrix"
##                         1
## (Intercept)  4.821654e+01
## AtBat       -3.538650e-01
## Hits         1.953167e+00
## HmRun       -1.285127e+00
## Runs         1.156329e+00
## RBI          8.087771e-01
## Walks        2.709765e+00
## Years       -6.202919e+00
## CAtBat       6.085854e-03
## CHits        1.070832e-01
## CHmRun       6.290984e-01
## CRuns        2.172926e-01
## CRBI         2.152888e-01
## CWalks      -1.488961e-01
## LeagueN      4.586262e+01
## DivisionW   -1.182304e+02
## PutOuts      2.501647e-01
## Assists      1.208491e-01
## Errors      -3.277073e+00
## NewLeagueN  -9.423459e+00
```

```r
set.seed(1)
train <- sample(1:nrow(x), nrow(x)/2)
test <- -train
y.test <- y[test]
ridge.mod <- glmnet(x[train, ], y[train], alpha = 0, 
    lambda = grid)
ridge.pred <- predict.glmnet(ridge.mod, s = 4, newx = x[test, 
    ], exact = FALSE)

# MSE
mean((ridge.pred - y.test)^2)
```

```
## [1] 142226.5
```

```r
ridge.pred <- predict(ridge.mod, s = 1e+10, newx = x[test, 
    ], exact = TRUE)
mean((ridge.pred - y.test)^2)
```

```
## [1] 224669.8
```

```r
ridge.pred <- predict(ridge.mod, s = 0, newx = x[test, 
    ], exact = FALSE)
mean((ridge.pred - y.test)^2)
```

```
## [1] 166258.3
```

```r
lm(y ~ x, subset = train)
```

```
## 
## Call:
## lm(formula = y ~ x, subset = train)
## 
## Coefficients:
## (Intercept)       xAtBat        xHits       xHmRun        xRuns         xRBI  
##    274.0145      -0.3521      -1.6377       5.8145       1.5424       1.1243  
##      xWalks       xYears      xCAtBat       xCHits      xCHmRun       xCRuns  
##      3.7287     -16.3773      -0.6412       3.1632       3.4008      -0.9739  
##       xCRBI      xCWalks     xLeagueN   xDivisionW     xPutOuts     xAssists  
##     -0.6005       0.3379     119.1486    -144.0831       0.1976       0.6804  
##     xErrors  xNewLeagueN  
##     -4.7128     -71.0951
```

```r
predict(ridge.mod, s = 0, type = "coefficients", exact = FALSE)
```

```
## 20 x 1 sparse Matrix of class "dgCMatrix"
##                        1
## (Intercept)  275.7172204
## AtBat         -0.4118004
## Hits          -1.3490261
## HmRun          6.0905436
## Runs           1.4271781
## RBI            0.9898408
## Walks          3.8088184
## Years        -17.2171582
## CAtBat        -0.6086644
## CHits          3.0142526
## CHmRun         3.1935999
## CRuns         -0.9320183
## CRBI          -0.5105934
## CWalks         0.3200890
## LeagueN      116.5487876
## DivisionW   -145.0182286
## PutOuts        0.1959973
## Assists        0.6722372
## Errors        -4.6629290
## NewLeagueN   -68.0666960
```

```r
set.seed(1)
cv.out <- cv.glmnet(x[train, ], y[train], alpha = 0)

plot(cv.out)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-279-3} \end{center}

```r
bestlam <- cv.out$lambda.min
bestlam
```

```
## [1] 326.0828
```

```r
log(bestlam)
```

```
## [1] 5.787151
```

```r
ridge.pred <- predict(ridge.mod, s = bestlam, newx = x[test, 
    ])
mean((ridge.pred - y.test)^2)
```

```
## [1] 139833.6
```

```r
out <- glmnet(x, y, alpha = 0)
predict(out, type = "coefficients", s = bestlam, exact = FALSE)[1:20, 
    ]
```

```
##  (Intercept)        AtBat         Hits        HmRun         Runs          RBI 
##  15.44383135   0.07715547   0.85911581   0.60103107   1.06369007   0.87936105 
##        Walks        Years       CAtBat        CHits       CHmRun        CRuns 
##   1.62444616   1.35254780   0.01134999   0.05746654   0.40680157   0.11456224 
##         CRBI       CWalks      LeagueN    DivisionW      PutOuts      Assists 
##   0.12116504   0.05299202  22.09143189 -79.04032637   0.16619903   0.02941950 
##       Errors   NewLeagueN 
##  -1.36092945   9.12487767
```

### Regresión Lasso

Ejecute los procedimientos anteriores con glmnet pero modifique el paramétro `alpha = 0`. Compare los resultados.

En este caso, se están encontrando los valores de $\beta$ tal que
$$\hat{\beta} = \underset{\beta}{\mathrm{argmin}} \left\{RSS + \lambda \Vert \beta \Vert_1^2\right\}.$$

```r
lasso.mod <- glmnet(x[train, ], y[train], alpha = 1, 
    lambda = grid)
plot(lasso.mod)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-280-1} \end{center}

```r
set.seed(1)
cv.out <- cv.glmnet(x[train, ], y[train], alpha = 1)
plot(cv.out)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-280-2} \end{center}

```r
bestlam <- cv.out$lambda.min
bestlam
```

```
## [1] 9.286955
```

```r
log(bestlam)
```

```
## [1] 2.228611
```

```r
lasso.pred <- predict(lasso.mod, s = bestlam, newx = x[test, 
    ])
mean((lasso.pred - y.test)^2)
```

```
## [1] 143673.6
```

```r
out <- glmnet(x, y, alpha = 1, lambda = grid)
lasso.coef <- predict(out, type = "coefficients", s = bestlam)[1:20, 
    ]
lasso.coef
```

```
##   (Intercept)         AtBat          Hits         HmRun          Runs 
##    1.27479059   -0.05497143    2.18034583    0.00000000    0.00000000 
##           RBI         Walks         Years        CAtBat         CHits 
##    0.00000000    2.29192406   -0.33806109    0.00000000    0.00000000 
##        CHmRun         CRuns          CRBI        CWalks       LeagueN 
##    0.02825013    0.21628385    0.41712537    0.00000000   20.28615023 
##     DivisionW       PutOuts       Assists        Errors    NewLeagueN 
## -116.16755870    0.23752385    0.00000000   -0.85629148    0.00000000
```

```r
lasso.coef[lasso.coef != 0]
```

```
##   (Intercept)         AtBat          Hits         Walks         Years 
##    1.27479059   -0.05497143    2.18034583    2.29192406   -0.33806109 
##        CHmRun         CRuns          CRBI       LeagueN     DivisionW 
##    0.02825013    0.21628385    0.41712537   20.28615023 -116.16755870 
##       PutOuts        Errors 
##    0.23752385   -0.85629148
```


## Ejercicios 

- Del libro [@James2013b] 
    - Capítulo 5. 2, 5, 8.
    - Capítulo 6: 5, 6, 7, 8, 10.
  


<!--chapter:end:06-seleccion-de-variables.Rmd-->


# Análisis en componentes principales

Si se quiere seleccionar la mejor proyección de 2 variables de una nube de puntos $X_1,\dots, X_p$, se debe hacer $\binom{p}{2}$ gráficos de dispersión. Se debe seleccionar la que tenga menor varianza, es decir, en los siguientes gráficos, la mejor foto sería la que tenga la mayor variabilidad:



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-282-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-282-2} \end{center}

El ACP lo que busca es un número reducido de dimensión que represente el máximo de variabilidad en las observaciones.

## Primer componente principal


```
## Error in knitr::include_graphics("pca1.png"): Cannot find the file(s): "pca1.png"
```


$$ Z_1 := \phi_{11}x_1 +  \phi_{21}x_2 + \dots + \phi_{p1}x_p;\quad \text{con } \sum_{j=1}^{p}\phi_{j1} = 1$$
tal que $Z_1$ tenga la varianza máxima.

Al vector $\phi_1 = (\phi_{11}, \phi_{21},\dots,\phi_{p1})$ se le llama *pasos o cargas*. 

$X = (X_1,\dots,X_p)_{n\times p}$ es la *matriz de diseño* donde cada columna tiene media 0. Se resuelve el problema
$$\underset{\phi_1}{\max} \left\lbrace\dfrac{1}{n}\sum_{i=1}^{n}\left(\sum_{i=1}^p \phi_{j1} X_{ij} \right)^2 \right\rbrace \text{ sujeto a } \sum_{j=1}^p \phi_{j1}^2 = 1 $$
Los $Z_{11},\dots, Z_{n1}$ son los scores del primer componente principal.

*Representación gráfica*


```
## Error in knitr::include_graphics("representacion.jpg"): Cannot find the file(s): "representacion.jpg"
```

$\phi_1$ es la dirección en el espacio característico en $\mathbb{R}^p$ en donde los datos tengan la máxima varianza.

## Segunda componente principal


```
## Error in knitr::include_graphics("pca2.png"): Cannot find the file(s): "pca2.png"
```

$$ Z_{2}:= \phi_{12}x_1 + \phi_{22}x_2+\dots+\phi_{p2}x_p$$
 $$\underset{\phi_1}{\max} \left\lbrace\dfrac{1}{n}\sum_{i=1}^{n}\left(\sum_{i=1}^p \phi_{j2} X_{ij} \right)^2 \right\rbrace \text{ sujeto a } \sum_{j=1}^p \phi_{j1}^2 = 1$$
 Se tiene, además, que $\forall i$, $Z_{i2}\perp Z_1$, entonces 
 $$ Z_{i2}\perp Z_1 \implies \phi_{2} \perp \phi_{1}$$
De la misma forma se construye $\phi_3,\phi_4,\dots, \phi_p$.

Notas: 
\begin{itemize}
\item \textbf{Escalas}: la varianza de las variables depende de las unidades. El problema es que los pesos $\phi_i$ son distintos dependiendo de las escalas. La solución es estandarizar las variables: $\dfrac{X_i-\mu_i}{\hat\sigma_i}$.
\item \textbf{Unicidad}: los componentes principales son únicos, módulo cambio de signo.
\end{itemize}

## ¿Cuántos componentes usar?


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-286-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-286-2} \end{center}

# Laboratorio

Vamos a usar los datos `USArrests` que represente estadísticas de arrestos por motivos de asaltos, asesinatos, violaciones, etc; en 50 estados de EEUU en 1973.

El objetivo es encontrar si hay patrones entre ciudad y tipos de crimen.

Exploración de datos
Ejecute una exploración de datos



```r
library(GGally)
ggpairs(USArrests)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-287-1} \end{center}

```r
summary(USArrests)
```

```
##      Murder          Assault         UrbanPop          Rape      
##  Min.   : 0.800   Min.   : 45.0   Min.   :32.00   Min.   : 7.30  
##  1st Qu.: 4.075   1st Qu.:109.0   1st Qu.:54.50   1st Qu.:15.07  
##  Median : 7.250   Median :159.0   Median :66.00   Median :20.10  
##  Mean   : 7.788   Mean   :170.8   Mean   :65.54   Mean   :21.23  
##  3rd Qu.:11.250   3rd Qu.:249.0   3rd Qu.:77.75   3rd Qu.:26.18  
##  Max.   :17.400   Max.   :337.0   Max.   :91.00   Max.   :46.00
```

Use la función `prcomp` y ejecute un análisis en componentes principales.

Luego use la función `biplot` para visualizar los resultados. Nota: Es posible que los ejes estén invertidos!

Finalmente construya un gráfico que represente la varianza explicada por cada componente principal para identificar cuántos componentes principales se deberían usar.


```r
pr.out <- prcomp(USArrests, scale = TRUE)
summary(pr.out)
```

```
## Importance of components:
##                           PC1    PC2     PC3     PC4
## Standard deviation     1.5749 0.9949 0.59713 0.41645
## Proportion of Variance 0.6201 0.2474 0.08914 0.04336
## Cumulative Proportion  0.6201 0.8675 0.95664 1.00000
```

```r
pr.out$center
```

```
##   Murder  Assault UrbanPop     Rape 
##    7.788  170.760   65.540   21.232
```

```r
pr.out$scale
```

```
##    Murder   Assault  UrbanPop      Rape 
##  4.355510 83.337661 14.474763  9.366385
```

```r
pr.out$rotation
```

```
##                 PC1        PC2        PC3         PC4
## Murder   -0.5358995  0.4181809 -0.3412327  0.64922780
## Assault  -0.5831836  0.1879856 -0.2681484 -0.74340748
## UrbanPop -0.2781909 -0.8728062 -0.3780158  0.13387773
## Rape     -0.5434321 -0.1673186  0.8177779  0.08902432
```

```r
biplot(pr.out, scale = 0)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-288-1} \end{center}

```r
pr.out$rotation <- -pr.out$rotation
pr.out$x <- -pr.out$x
biplot(pr.out, scale = 0)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-288-2} \end{center}

```r
pr.out$rotation <- -pr.out$rotation
pr.out$x <- -pr.out$x
biplot(pr.out, scale = 0)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-288-3} \end{center}

```r
pr.var <- pr.out$sdev^2
pr.var
```

```
## [1] 2.4802416 0.9897652 0.3565632 0.1734301
```

```r
pve <- pr.var/sum(pr.var)
pve
```

```
## [1] 0.62006039 0.24744129 0.08914080 0.04335752
```

```r
plot(pve, xlab = "Principal Component", ylab = "Proportion of Variance Explained", 
    ylim = c(0, 1), type = "b")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-288-4} \end{center}

```r
plot(cumsum(pve), xlab = "Principal Component", ylab = "Cumulative Proportion of Variance Explained", 
    ylim = c(0, 1), type = "b")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-288-5} \end{center}

```r
a <- c(1, 2, 8, -3)
cumsum(a)
```

```
## [1]  1  3 11  8
```




<!--chapter:end:07-componentes-principales.Rmd-->

