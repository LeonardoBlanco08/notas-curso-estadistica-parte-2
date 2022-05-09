--- 
title: "Notas Curso de Estadística II"
author: "Maikol Solís Chacón y Luis Barboza Chinchilla"
date: "Actualizado el 09 mayo, 2022"
site: bookdown::bookdown_site
documentclass: book
fontsize: 12pt
monofont: "Source Code Pro"
colorlinks: true
bibliography: [bibliografia.bib]
biblio-style: authoryear
biblatexoptions: [url=false, doi=false, eprint=false, isbn=false]
# link-citations: yes
description: ""
---




# Introducción

Estas son las notas de clase del curso CA0403: Estadística Actuarial II para el primer semestre del 2022.

 

<!--chapter:end:index.Rmd-->



# Estimación no-paramétrica de densidades
 
## Histograma

El histograma es una de las estructuras básicas en estadística y es una herramienta descriptiva que permite visualizar la distribución de los datos sin tener conocimiento previo de los mismos. En esta sección definiremos el histograma más como un estadístico que como una herramienta de visualización de datos.

### Construcción Estadística

Suponga que \(X_1,X_2, \dots ,X_n\) es una muestra independiente que proviene de una distribución desconocida $f$. En este caso no asumiremos que $f$ tenga alguna forma particular, que permita definirla de manera paramétrica como en el curso anterior.

Construcción:

- Seleccione un origen \(x_0\) y divida la linea real en _segmentos_.
\begin{equation*}
B_j = [x_0 +(j - 1)h,x_0 + jh), \quad j\in \mathbb{Z}
\end{equation*}

- Cuente cuántas observaciones caen en el segmento $B_j$. Denótelo como \(n_j\).


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/observaciones-histograma-1} \end{center}
- Divida el número de observaciones en $B_j$ por el tamaño de muestra \(n\) y el ancho de banda \(h\) de cada caja.
\begin{equation*}
f_j = \frac{n_j}{nh}
\end{equation*}
De esta forma si se suma las áreas definidas por el histograma da un total de 1.

- Cuente la frecuencia por el tamaño de muestra $n$ y el ancho de banda $h$. 
\begin{equation*}
    f_j = \frac{n_j}{nh}
    \end{equation*}

- Dibuje el histograma.


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/ejemplo-inicial-histograma-1} \end{center}

Formalmente el histograma es el


\begin{equation*}
\hat{f}_h(x) = \frac{1}{nh} \sum_{i = 1}^{n} \sum_{j} I(X_i\in B_j) I(x\in B_j),
\end{equation*}

donde $I$ es la indicadora.

### Construcción probabilística

Denote $m_j=jh-h/2$ el centro del segmento,


\begin{align*}
    \mathbb{P}\left(X\in \left[m_j - \frac{h}{2},m_j + \frac{h}{2} \right)\right)
      & =
    \int_{m_j - \frac{h}{2}}^{m_j + \frac{h}{2}} f(u)du                                             \\
      & \approx f(m_j)h
\end{align*}

Otra forma de aproximarlo es:


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

Note que el estimador de histograma $\hat f_h$ tiende a ser más suave conforme aumenta el ancho de banda $h$. 

### Propiedades estadísticas 

Suponga que  \(x_0 = 0\) y que \(x \in B_j\) es un punto fijo, entonces el estimador evaluado en $x$ es:


\begin{equation*}
\hat{f}_h(x) =  \frac{1}{nh} \sum_{i = 1}^{n} I(X_i \in B_j)
\end{equation*}


### Sesgo

Para calcular el sesgo primero calculamos:


\begin{align*}
\mathbb{E}\left[ \hat{f}_h(x)\right]
& =  \frac{1}{nh} \sum_{i = 1}^{n} \mathbb{E}\left[ I(X_i \in B_j)\right] \\
& = \frac{1}{nh} n \mathbb{E}\left[ I(X_i \in B_j)\right]
\end{align*}

donde \(I(X_i \in B_j)\) es una variable Bernoulli con valor esperado:

\begin{align*}
\mathbb{E}\left[ I(X_i \in B_j)\right] = \mathbb{P}\left(I(X_i \in
B_j)=1\right) = \int_{(j - 1)h}^{jh} f(u)du.
\end{align*}

Entonces,
\begin{align*}
\mathbb{E}\left[{f}_h(x)\right]
& = \frac{1}{h} \int_{(j - 1)h}^{jh} f(u)du
\end{align*}

y por lo tanto el sesgo de $\hat f_h(x)$ es: 
\begin{equation*}
Sesgo(\hat{f}_h(x)) = \frac{1}{h} \int_{(j -
1)h}^{jh} f(u)du - f(x)
\end{equation*}

Esto se puede aproximar usando Taylor alrededor del centro
$m_j = jh - h/2$ de $B_j$ de modo que
$f(u) - f(x) \approx f^{\prime}(m_j)(u - x)$.


\begin{equation*}
Sesgo(\hat{f}_h(x)) =  \frac{1}{h} \int_{(j -
1)h}^{jh} [f(u) - f(x)] du \approx f^\prime(m_j)(m_j - x)
\end{equation*}
Entonces se puede concluir que:


- $\hat f_h(x)$ es un estimador sesgado de $f(x)$.
- El sesgo tiende a ser cero cerca del punto medio de $B_j$.
- El sesgo es creciente con respecto a la pendiente de la verdadera densidad evaluada en el punto medio $m_j$.

### Varianza

Dado que todos los $X_i$ son i.i.d., entonces


\begin{align*}
\mathrm{Var}\left( \hat{f}_h(x)\right) & =
\mathrm{Var}\left( \frac{1}{nh} \sum_{i = 1}^{n} I(X_i \in B_j)\right)                                  \\
& = \frac{1}{n^2h^2} n\mathrm{Var}\left( I(X_i \in B_j)\right)
\end{align*}


La variable $I$ es una bernoulli con parametro
$\int_{(j - 1)h}^{h} f(u)du$ por lo tanto su varianza es el


\begin{equation*}
\mathrm{Var}\left( \hat{f}_h(x)\right)\, =
\frac{1}{nh^2} \left(\int_{(j - 1)h}^{h} f(u)du \right)\left( 1 -\int_{(j - 1)h}^{h} f(u)du \right)
\end{equation*}


::: {.exercise #unnamed-chunk-4}
Usando un desarrollo de Taylor como en la parte anterior, pruebe que:
\begin{equation*}
\mathrm{Var}\left( \hat{f}_h(x)\right)\approx
\frac{1}{nh} f(x)
\end{equation*}
:::

Consecuencias:

- La varianza del estimador es proporcional a $f(x)$.
- La varianza decrece si el ancho de banda $h$ crece.

### Error cuadrático medio

El error cuadrático medio del histograma es el


\begin{equation*}
\mathrm{MSE}\left( \hat{f}_h(x)\right) =
\mathrm{E}\left[\left(\hat{f}_h(x) - f(x)\right)^2\right] = \mathrm{Sesgo}^2\left( \hat{f}_h(x)\right) + \mathrm{Var}\left( \hat{f}_h(x)\right).
\end{equation*}


::: {.exercise #unnamed-chunk-5}
¿Pueden probar la segunda igualdad de la expresión anterior?
:::



Retomando los términos anteriores se puede comprobar que:

\begin{align} 
\mathrm{MSE}\left( \hat{f}_h(x)\right) = \frac{1}{nh} f(x) +
f^\prime \left\{ \left( j - \frac{1}{2} \right) h \right\}^2 \left\{ \left( j -
\frac{1}{2} \right) h - x \right\}^2 \\
+ o\left(h \right) + 		o\left(\frac{1}{nh} \right)
(\#eq:MSE)
\end{align}

::: {.remark}
Si \(h \to 0\) y \(nh \to \infty\) entonces \(\mathrm{MSE}\left(  \hat{f}_h(x)\right) \to 0 \). Es decir, conforme usamos más observaciones, pero el ancho de banda de banda no decrece tan rápido, entonces el error cuadrático medio converge a 0.

Como \(\mathrm{MSE}\left(  \hat{f}_h(x)\right) \to 0 \) (convergencia en \(\mathbb{L}^2\)) implica que \(\hat{f}_h(x) \stackrel{\mathcal{P}}{\to} f(x)\), entonces \(\hat{f}_h\) es consistente. Además según la fórmula \@ref(eq:MSE), concluimos lo siguiente: 

-   Si $h\to 0$, la varianza crece (converge a $\infty$) y el sesgo
    decrece (converge a $f^\prime (0)x^2$).
-   Si $h\to \infty$, la varianza decrece (hacia 0) y el sesgo crece
    (hacia $\infty$)

:::
::: {.exercise #unnamed-chunk-8}
Si $f\sim N(0,1)$, aproxime los componentes de sesgo, varianza y MSE, y grafíquelos para distintos valores de $h$. 
:::

Solución:




\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/MSE-histograma-1} \end{center}

### Error cuadrático medio integrado

Uno de los problemas con el \(\mathrm{MSE}\left(  \hat{f}_h(x)\right)\) es que depende de $x$ y de la función de densidad $f$ (desconocida). Integrando con respecto a $x$ el MSE se logra resolver el primer problema:
  
\begin{align*}
\mathrm{MISE}\left(  \hat{f}_h\right)
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

Al $\mathrm{MISE}$ se le llama error cuadrático medio integrado. Además,


\begin{align*}
\mathrm{MISE} (\hat{f}_h)
& \approx \int_{ -\infty}^{\infty} \frac{1}{nh} f(x)dx                                                                                                                                          \\
& + \int_{ -\infty}^{\infty}\, \sum_{j}^{} I(x\in B_j) \left\{ \left( j- \frac{1}{2} \right)h -x  \right\}^2 \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2 dx \\
& = \frac{1}{nh} + \sum_{j}^{} \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2 \int_{ B_j}    \left\{ \left( j- \frac{1}{2} \right)h -x  \right\}^2 dx          \\
& =\frac{1}{nh} + \frac{h^2}{12} \sum_{j} \left [f^\prime \left( \left\{j - \frac{1}{2}\right\}h \right)  \right]^2                                                                       \\
& \approx \frac{1}{nh} + \frac{h^2}{12} \int \{f^\prime(x)\}^2 dx                                                                                                                         \\
& =\frac{1}{nh} + \frac{h^2}{12} \Vert f^\prime\Vert_{2}^2
\end{align*}

la cual es una buena aproximación si $h\rightarrow 0$. A este último término se le llama MISE asintótico.

### Ancho de banda óptimo para el histograma

El MISE tiene un comportamiento asintótico similar al observado en el MSE. La figura siguiente presenta el comportamiento de la varianza, sesgo y MISE para nuestro ejemplo anterior:

\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/MISE-histograma-1} 

}

\caption{ }(\#fig:MISE-histograma)
\end{figure}

Un problema frecuente en los histogramas es que la mala elección del parámetro $h$ causa que estos no capturen toda la estructura de los datos. Por ejemplo, en el siguiente caso se muestra histogramas construídos a partir de 1000 números aleatorios según una $N(0,1)$, bajo 4 distintas escogencias de ancho de banda.


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-10-1} \end{center}

Un criterio más preciso para seleccionar el ancho de banda es a través de la minimización del MISE:


\begin{equation*}
\frac{\partial \mathrm{MISE}(f_{h})}{\partial h} = -\frac{1}{nh^2} + \frac{1}{6} h \Vert f^\prime\Vert_{2}^2 = 0
\end{equation*}

lo implica que


\begin{equation*}
h_{opt} = \left(\frac{6}{n\Vert f^\prime\Vert_{2}^2}\right) ^{1/3} = O\left( n^{-1/3} \right).
\end{equation*}

y por lo tanto


\begin{equation*}
\mathrm{MISE}(\hat{f}_{h}) = \frac{1}{n} \left(\frac{n\Vert f^\prime\Vert_{2}^2}{6}\right)  ^{1/3}
\end{equation*}

::: {.remark name="Recuerde de Estadística I"}
Si \(X_1, \ldots, X_n \sim f_{\theta} \) i.i.d, con \(\mathrm{Var}(X) = \sigma^2\) y media $\theta$, recuerde que el estimador \(\hat{\theta}\)  de \(\theta\) tiene la característica que

\begin{equation*}
\mathrm{MSE}(\theta) = \mathrm{Var}(\hat{\theta}) +
\mathrm{Sesgo}^2(\hat{\theta}) = \frac{\sigma^2}{n}
\end{equation*}
:::

Según la nota anterior la tasas de convergencia del histograma es más lenta que la de un estimador parámetrico considerando la misma cantidad de datos, tal y como se ilustra en el siguiente gráfico:


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-12-1} \end{center}



Finalmente, podemos encontrar el valor óptimo  del ancho de banda ($h=$ 0.3285) del conjunto de datos en el ejemplo anterior.  

\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-14-1} \end{center}

::: {.exercise #unnamed-chunk-15}
Verifique que en el caso normal estándar: $h_{opt}\approx 3.5 n^{-1/3}$.
:::


## Estimación de densidades basada en kernels.

### Primera construcción

Sea $X_{1},\ldots,X_{n}$ variables aleatorias i.i.d. con distribución $f$ en $\mathbb{R}$. La distribución de  $f$ es $F(x)=\int_{-\infty}^{x}f(t)dt$.

La distribución empírica de $F$ es:
\[
F_{n}(x)=\frac{1}{n}\sum_{i=1}^{n}I(X_{i}\leq x).
\]

Por la ley de los grandes números tenemos que \(F_{n}(x)
\xrightarrow{c.s} F(x)\) para todo  $x$ en $\mathbb{R}$, conforme
$n\rightarrow\infty$. Entonces, $F_{n}(x)$ es un estimador consistente de $F(x)$ para todo $x$ in $\mathbb{R}$.

::: {.remark}
¿Podríamos derivar \(F_n\) para encontrar el estimador \(\hat{f}_n\)?
:::

La respuesta es si (más o menos).

Suponga que $h>0$ tenemos la aproximación 
\[
f(x)\approx\frac{F(x+h)-F(x-h)}{2h}.
\]

Remplazando $F$  por su estimador  $F_{n}$, defina
\[
\hat{f}_{n}^{R}(x)=\frac{F_{n}(x+h)-F_{n}(x-h)}{2h},
\] 
donde $\hat{f}_{n}^{R}(x)$ es el estimador de *Rosenblatt* .

Podemos rescribirlo de la forma, 
\[
\hat{f}_{n}^{R}(x)=\frac{1}{2nh}\sum_{i=1}^{n}I(x-h<X_{i}\leq x+h)=\frac{1}{nh}\sum_{i=1}^{n}K_{0}\left(\frac{X_{i}-x}{h}\right)
\]
con  $K_{0}(u)=\frac{1}{2}I(-1<u\leq1)$, lo cual es equivalente al caso del histograma.



### Otra construcción

Con el histograma construimos una serie de segmentos fijo \(B_{j}\) y contabamos el número de datos que estaban **contenidos en $B_{j}$**

::: {.remark}
¿Qué pasaría si cambiamos la palabra **contenidos** por **alrededor de "x"**?
:::

Suponga que se tienen intervalos de longitud $2h$, es decir, intervalos de la forma $[x-h,x+h)$.

El estimador de histograma se escribe como


\begin{equation*}
\hat{f_{h}}(x) = \dfrac{1}{2hn} \# \{ X_i \in [x-h,x+h) \}.
\end{equation*}

Note que si definimos
\begin{equation*}
K(u)=\frac{1}{2} I \left( \left\vert u \right\vert \leq 1 \right)
\end{equation*}
con \(u = \frac{x-x_i}{h}\), entonces parte del estimador de histograma se puede escribir como:
\begin{equation*}
\frac{1}{2}\# \{ X_i \in [x-h,x+h) \}
=\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)
=\sum_{i=1}^{n}  \frac{1}{2} I \left( \left\vert \frac{x-x_{i}}{h}
\right\vert \leq 1 \right)
\end{equation*}

Finalmente se tendría que


\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)
\end{equation*}

<!-- \begin{center} -->

<!-- \includegraphics[width=\linewidth]{manual_figure/np-density-interval-crop.pdf} -->

<!-- \end{center} -->

::: {.remark}
¿Qué pasaría si cambiaríamos la función \(K\) del histograma por una más general? Esto permitiría incluir la noción de "cercanía" de cada dato alrededor de $x$.
:::

Esta función debería cumplir las siguientes características:

-   $K(u)\geq 0$.
-   $\int_{-\infty}^{\infty} K(u)du = 1$.
-   $\int_{-\infty}^{\infty} u K(u)du = 0$.
-   $\int_{-\infty}^{\infty} u^{2} K(u)du <\infty$.

Por ejemplo:


- **Uniforme:** \(\frac{1}{2} I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Triangular:** \( (1-|u|) I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Epanechnikov:** \(\frac{3}{4} (1-u^{2}) I \left( \left\vert u \right\vert \leq 1 \right)\).
- **Gaussian:** \(\frac{1}{\sqrt{2\pi}} \exp \left( -\frac{1}{2}u^{2} \right)\).



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-19-1} \end{center}

Entonces se tendría que la expresión general para un estimador por núcleos (kernel) de $f$:


\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-x_{i}}{h} \right)=\frac{1}{n}\sum_{i=1}^{n} K_h(x-x_{i}) 
\end{equation*}

donde $x_1,\ldots,x_n$ es una muestra i.i.d. de $f$,
\begin{align*}
K_h(\cdot)=\frac 1 h K(\cdot /h).
\end{align*}
y $K$ es un kernel según las 4 propiedades anteriores. 

::: {.remark}
¿Qué pasaría si modificamos el ancho de banda \(h\) para un mismo kernel?
:::

Nuevamente controlaríamos la suavidad del estimador a como se ilustra a continuación:


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-21-1} \end{center}

Inconveniente: no tenemos aún un criterio para un $h$ óptimo.

::: {.remark}
¿Qué pasaría si modificamos el kernel para un mismo ancho de banda \(h\)?
:::
Usando 1000 números aleatorios según una normal estándar, con un ancho de banda fijo ($h=0.3$) podemos ver que no hay diferencias muy marcadas entre los estimadores por kernel:

\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-23-1} \end{center}

Recordemos nuevamente la fórmula


\begin{equation*}
\hat{f}_{h}\left( x \right) = \frac{1}{nh}\sum_{i=1}^{n} K\left( \frac{x-X_{i}}{h} \right)
\end{equation*}

Cada sumando de esta expresión es una función de la variable $x$. Si la integramos se obtiene que

\begin{equation*}
\frac{1}{nh}\int K\left( \frac{x-X_{i}}{h} \right) dx
= \frac{1}{nh} \int K\left( u \right) h du
= \frac{1}{n} \int K(u) du
= \frac{1}{n}
\end{equation*}

En el siguiente gráfico se generan 10 puntos aleatorios según una normal estándar (rojo) y se grafica cada uno de los 10 componentes del estimador de la densidad usando kernels gaussianos (azul). El estimador resultante aparece en color negro. Note que cada uno de los 10 componentes tiene la misma área bajo la curva, la cual en este caso es 0.1. 

\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-24-1} \end{center}



### Propiedades Estadísticas

Al igual que en el caso de histograma, también aplica lo siguiente:

\begin{align*}
\mathrm{MSE}(\hat{f}_{h}(x)) & =\mathrm{Var}(\hat{f}_{h}(x))+\mathrm{Sesgo}^{2} (\hat{f}_{h}(x))            \\
\mathrm{MISE}(\hat{f}_{h})   & =\int\mathrm{Var}(\hat{f}_{h}(x))dx+\int\mathrm{Sesgo}^{2}(\hat{f}_{h}(x))dx
\end{align*}

donde

\(\mathrm{Var}\left(\hat{f}_{h}(x)\right)=\mathbb{E}\left[\hat{f}_{h}(x)-\mathbb{E}\hat{f}_{h}(x)\right]^{2}\) and \(\mathrm{Sesgo}\left(\hat{f}_{h}(x)\right)=\mathbb{E}\left[\hat{f}_{h}(x)\right]-f(x)\).


En el caso de la varianza:

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
\end{align*} Usando que: \begin{align*}
\textcolor{red}{\mathbb{E}\left[K^{2}\left(\frac{x-X}{h}\right)\right]}
& =\int K^{2}\left(\frac{x-s}{h}\right)f(s)ds            \\
& =h\int K^{2}\left(u\right)f(uh+x)du                    \\
& =h\int K^{2}\left(u\right)\left\{ f(x)+o(1)\right\} du \\
& =h\left\{ \Vert K\Vert_{2}^{2}f(x)+o(1)\right\} .
\end{align*}


\begin{align*}
\textcolor{blue}{\mathbb{E}\left[K\left(\frac{x-X}{h}\right)\right]}
& =\int K\left(\frac{x-s}{h}\right)f(s)ds            \\
& = h\int K\left(u\right)f(uh+x)du                    \\
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


::: {.exercise #unnamed-chunk-25}
Usando el cambio de variable \(s=\frac{u-x}{h}\) y las propiedades del kernel pruebe que

\begin{equation*}
\mathrm{Sesgo}\left(\hat{f}_{h}(x)\right) = \frac{h^{2}}{2} f^{\prime\prime} \mu_{2}(K) + o(h^{2}), \text{ si } h\to 0
\end{equation*}
donde \(\mu_{2}=\int s^{2}K(s)ds\).

:::
::: {.remark}
En algunas pruebas más formales, se necesita además que  $f^{\prime\prime}$ sea absolutamente continua y que $\int(f^{\prime\prime\prime}(x))dx<\infty$.}
:::





En el siguiente gráfico se ilustra el estimador no paramétrico de la distribución de tiempos entre erupciones en la muy conocida tabla de datos *faithful*. El estimador se calcula bajo dos distintas escogencias de ancho de banda. 


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-28-1} \end{center}

::: {.remark}
Note como los cambios en el ancho de banda modifican la suavidad (sesgo) y el aplanamiento de la curva (varianza).
:::

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


Al igual que en el caso del histograma, el estimador por kernels es un estimador consistente de $f$ si $h\rightarrow 0$ y $nh\rightarrow \infty$. Además el MISE depende directamente de $f''$.

### Ancho de banda óptimo

Minimizando el $\mathrm{MISE}$ con respecto a $h$ obtenemos

\begin{equation*}
h_{opt}=\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right).
\end{equation*}


::: {.remark}
De forma práctica, $h_{opt}$ no es un estimador útil de $h$ porque depende de $\Vert f^{\prime\prime}\Vert_{2}^{2}$  que es desconocido. Más adelante veremos otra forma de encontrar este estimador.
:::

Evaluando $h_{opt}$ en el $\mathrm{MISE}$ tenemos que


\begin{equation*}
\mathrm{MISE}(\hat{f}_{h})=\frac{5}{4}\left(\Vert K\Vert_{2}^{2}\right)^{4/5}\left(\Vert f^{\prime\prime}\Vert_{2}^{2}\mu_{2}(K)\right)^{2/5}n^{-4/5} = O\left( n^{-4/5} \right).
\end{equation*}

y por lo tanto la tasa de convergencia del MISE a 0 es más rápida que para el caso del histograma:


\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-31-1} \end{center}






::: {.remark}
Como se comentó anteriormente, el principal inconveniente del ancho de banda:
\begin{equation*}
h_{opt}=\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right).
\end{equation*}
es que depende de $f''$.
:::

A continuación se explica dos posibles métodos para determinar para aproximar el ancho de banda óptimo:

#### Referencia normal

::: {.remark}
Este método es más efectivo si se conoce que la verdadera distribución es bastante suave, unimodal y simétrica. Más adelante veremos otro método para densidades más generales.
:::

Asuma que $f$ es normal distribuida y se utiliza un kernel $K$ gausiano.
Entonces se tiene que


\begin{align*}
\hat{h}_{rn} & =\left(\frac{\Vert K\Vert_{2}^{2}}{\Vert f^{\prime\prime}\Vert_{2}^{2}\left(\mu_{2}(K)\right)^{2}n}\right)^{1/5}=O\left( n^{-1/5} \right) \\
& =1.06 \hat{\sigma} n^{-1/5}.
\end{align*}

donde


\begin{equation*}
\hat{\sigma} = \sqrt{\frac{1}{n-1} \sum_{i=1}^{n} \left( x_{i}-\bar{x}^{2} \right)}
\end{equation*}

::: {.exercise #unnamed-chunk-35}
Pruebe que la ecuación anterior es verdadera. Utilice el hecho de que:
\begin{align*}
\Vert f^{\prime\prime}\Vert_{2}^{2}=\sigma^{-5}\int \phi^{\prime \prime}(x)^2 dx
\end{align*}
donde $\phi$ es la función de densidad de una $N(0,1)$.
:::

::: {.remark}
El principal inconveniente de \(\hat{h}_{rn}\) es su sensibilidad a los valores extremos:
:::

::: {.example #unnamed-chunk-37}
La varianza empírica de  1, 2, 3, 4, 5, es  2.5.

La varianza empírica de 1, 2, 3, 4, 5, 99, es 1538.
:::

Para solucionar el problema anterior, se puede considerar una medida más robusta de variación, por ejemplo el rango intercuantil IQR:

\begin{equation*}
\mathrm{IQR}^{X} = Q^{X}_{3} - Q^{X}_{1}
\end{equation*}
donde \(Q^{X}_{1}\) y \(Q^{X}_{3}\) son el primer y tercer cuartil de un conjunto de datos \(X_{1},\ldots, X_n\).

Con el supuesto que \(X\sim \mathcal{N}(\mu,\sigma^{2})\) entonces \(\displaystyle Z = \frac{X-\mu}{\sigma} \sim \mathcal{N}(0,1)\) y entonces:

\begin{align*}
\mathrm{IQR}
& = Q^{X}_{3} - Q^{X}_{1}                                                     \\
& = \left( \mu+\sigma Q^{Z}_{3} \right) - \left( \mu+\sigma Q^{Z}_{1} \right) \\
& = \sigma \left(Q^{Z}_{3} - Q^{Z}_{1} \right)                                \\
& \approx \sigma \left( 0.67 - (-0.67) \right)                                 \\
& =1.34 \sigma.
\end{align*}

Por lo tanto
$\displaystyle \hat{\sigma} = \frac{\widehat{\mathrm{IQR}}^{X}}{1.34}$

Podemos sustituir la varianza empírica de la fórmula inicial y tenemos
\begin{equation*}
\hat{h}_{rn} = 1.06 \frac{\widehat{\mathrm{IQR}}^{X}}{1.34} n^{-\frac{1}{5}} \approx 0.79\  \widehat{\mathrm{IQR}}^{X}\ n^{-\frac{1}{5}}
\end{equation*}

Combinando ambos estimadores, podemos obtener,


\begin{equation*}
\hat{h}_{rn} = 1.06 \min \left\{\frac{\widehat{\mathrm{IQR}}^{X}}{1.34}, \hat{\sigma }\right\} n^{-\frac{1}{5}}
\end{equation*}

pero esta aproximación es conveniente bajo el escenario de que la densidad $f$ sea similar a una densidad normal.

#### Validación Cruzada

Defina el *error cuadrático integrado* como \begin{align*}
\mathrm{ISE}(\hat{f}_{h}) & =\int\left(\hat{f}_{h}(x)-f(x)\right)^{2}dx\nonumber                   \\
& =\int \hat{f}_{h}^{2}(x)dx-2\int \hat{f}_{h}(x)f(x)dx+\int f^{2}(x)dx.
\end{align*}

::: {.remark}
El MISE es el valor esperado del ISE.
:::

Nuestro objetivo es minimizar el ISE con respecto a $h$.

Primero note que $\int f^{2}(x)dx$ NO DEPENDE de $h$. Podemos minimizar
la expresión \begin{equation*}
\mathrm{ISE}(\hat{f}_{h})-\int f^{2}(x)dx=
\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}
-2
\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}
\end{equation*}

Vamos a resolver esto en dos pasos partes

**Integral** $\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}$


**Integral \(\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}\)**   

El término \(\textcolor{blue}{\int\hat{f}_{h}(x)f(x)dx}\) es el valor esperado de
\(\mathrm{E}\left[\hat{f}_h(X)\right]\). Su estimador empírico sería:
\begin{equation*}
\widehat{\mathrm{E}\left[\hat{f}_h(X)\right]}
= \frac{1}{n}\sum_{i=1}^{n}\hat{f}_{h}(X_{i})
=\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{j=1}^{n}
K\left(\frac{X_{j}-X_{i}}{h}\right).
\end{equation*}

::: {.remark}
El problema con esta expresión es que las observaciones que se usan para estimar la esperanza son las mismas que se usan para estimar \(\hat{f}_{h}(x)\) (Se utilizan doble).
:::

La solución es remover la $i^{\text{ésima}}$ observación de
$\hat{f}_{h}$ para cada $i$.

Redefiniendo el estimador anterior tenemos una estimación de $\int \hat{f}_{h}(x)f(x)dx$ a través de:
\[
\frac{1}{n}\sum_{i=1}^{n}\hat{f}_{h,-i}(X_{i}),
\]
donde (estimador *leave-one-out*)
\[
\hat{f}_{h,-i}(x)=\frac{1}{(n-1)h}\sum_{\substack{j=1\\ j\neq i}}^{n}K\left( \frac{x-X_{j}}{h} \right) .
\]

de esta forma nos aseguramos que las observaciones que se usan para calcular $\hat{f}_{h,-i}(x)$ son independientes de la observación que uno usa para definir el estimador de $E[\hat f_h(x)]$.

Siguiendo con el término $\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}$
note que este se puede reescribir como


\begin{align*}
\textcolor{red}{\int\hat{f}_{h}^{2}(x)dx}
& =\int\left(\frac{1}{nh}\sum_{i=1}^{n}K\left( \frac{x-X_{i}}{h} \right)\right)^{2}dx                                    \\
& =\frac{1}{n^{2}h^{2}}\sum_{i=1}^{n}\sum_{i=1}^{n}\int K\left(\frac{x-X_{i}}{h}\right)K\left(\frac{x-X_{j}}{h}\right)dx \\
& =\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{i=1}^{n}\int K\left(u\right)K\left(\frac{X_{i}-X_{j}}{h}-u\right)du               \\
& =\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{i=1}^{n}K*K\left(\frac{X_{i}-X_{j}}{h}\right).
\end{align*}

donde $K*K$ es la convolución de $K$ consigo misma.

Finalmente tenemos la función,


Finalmente definimos la función objetivo del criterio de validación cruzada como:

\[
\mathrm{CV}(h)=\frac{1}{n^{2}h}\sum_{i=1}^{n}\sum_{j=1}^{n}K*K\left(\frac{X_{i}-X_{j}}{h}\right)-\frac{2}{n(n-1)h}\sum_{i=1}^{n}\mathop{\sum_{j=1}^{n}}_{j\neq i}K\left( \frac{X_{i}-X_{j}}{h} \right).
\]

::: {.remark}
Note que \(\mathrm{CV}(h)\) no depende de \(f\) o sus derivadas y además la función objetivo se adapta automáticamente a las características de la densidad $f$.
:::



### Intervalos de confianza para estimadores de densidad no paramétricos

Usando los resultados anteriores y asumiendo que $h=cn^{-\frac{1}{5}}$
entonces


\begin{equation*}
n^{\frac{2}{5}} \left\{ \hat{f}_{h}(x) -f(x)\right\}
\xrightarrow{\mathcal{L}} \mathcal{N}\left(\underbrace{\frac{c^{2}}{2} f^{\prime\prime}
\mu_{2}(K)}_{b_{x}}, \underbrace{\frac{1}{c}f(x) \left\Vert K \right\Vert_{2}^{2}}_{v_{x}}\right).
\end{equation*}

Si $z_{1-\frac{\alpha}{2}}$ es el cuantil $1-\frac{\alpha}{2}$ de una
distribución normal estándar, entonces


\begin{align*}
1-\alpha
& \approx \mathbb{P}\left(b_{x}-z_{1-\frac{\alpha}{2}} v_{x} \leq n^{2 / 5}\left\{\widehat{f}_{h}(x)-f(x)\right\} \leq b_{x}+z_{1-\frac{\alpha}{2}} v_{x}\right) \\
& =\mathbb{P}\left(\widehat{f}_{h}(x)-n^{-2 / 5}\left\{b_{x}+z_{1-\frac{\alpha}{2}} v_{x}\right\}\right.                                                         \\
& \qquad\qquad \left. \leq f(x)\leq \hat{f}_{h}(x)-n^{-2 / 5}\left\{b_{x}-z_{1-\frac{\alpha}{2}} v_{x}\right\}\right)
\end{align*}

Esta expresión nos dice que con una probabilidad de $1-\alpha$ se tiene
que


\begin{equation*}
\begin{aligned}
& \left[\hat{f}_{h}(x)-\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)-z_{1-\frac{\alpha}{2}} \sqrt{\frac{f(x)\|K\|_{2}^{2}}{n h}}\right. \\
& \left.\widehat{f}_{h}(x)-\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)+z_{1-\frac{a}{2}} \sqrt{\frac{f(x)\|K\|_{2}^{2}}{n h}}\right]
\end{aligned}
\end{equation*}

Al igual que en los casos anteriores, este invtervalo no es útil ya que
depende de $f(x)$ y $f^{\prime\prime} (x)$.

Si $h$ es pequeño relativamente a $n^{-\frac{1}{5}}$ entonces el segundo
término $\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)$ podría ser
ignorado.

Si \(h\) es pequeño relativamente a \(n^{-\frac{1}{5}}\) entonces el segundo término \(\frac{h^{2}}{2} f^{\prime \prime}(x) \mu_{2}(K)\) podría ser ignorado.

Podemos reemplazar \(f(x)\) por su estimador \(\hat{f}_{h}(x)\).  Entonces tendríamos una intervalo aplicable a nuestro caso:


\begin{equation*}
\left[\hat{f_{h}}(x)-z_{1-\frac{\alpha}{2}} \sqrt{\frac{\hat{f_{h}}(x)\|K\|_{2}^{2}}{n h}}, \hat{f}_{h}(x)+z_{1-\frac{\alpha}{2}} \sqrt{\frac{\hat{f}_{h}(x)\|\mathrm{K}\|_{2}^{2}}{n h}}\right]
\end{equation*}

::: {.remark}
Este intervalo de confianza está definido para $x$ fijo y no permite hacer inferencia sobre toda la función $f$. Una forma de determinar la banda de confianza de toda la función $f$ es a través de la fórmula 3.52 en la página 62 de [@HardleNonparametric2004].
:::

## Laboratorio

Comenzaremos con una librería bastante básica llamada
\texttt{KernSmooth}.

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-45-1} \end{center}

```r
fhat_unif <- bkde(x, kernel = "box", bandwidth = 0.05)
plot(fhat_unif, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-45-2} \end{center}

```r
fhat_epanech <- bkde(x, kernel = "epanech", bandwidth = 0.05)
plot(fhat_epanech, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-45-3} \end{center}

```r
fhat_biweight <- bkde(x, kernel = "biweight", bandwidth = 0.05)
plot(fhat_biweight, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-45-4} \end{center}

```r
fhat_triweight <- bkde(x, kernel = "triweight", bandwidth = 0.05)
plot(fhat_triweight, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-45-5} \end{center}

### Efecto del ancho de banda en la estimación

\*\* Kernel uniforme \*\*


```r
fhat <- bkde(x, kernel = "box", bandwidth = 0.001)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-46-1} \end{center}

```r
fhat <- bkde(x, kernel = "box", bandwidth = 0.5)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-46-2} \end{center}

\*\* Kernel Epanechnikov \*\*


```r
fhat <- bkde(x, kernel = "epa", bandwidth = 0.001)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-47-1} \end{center}

```r
fhat <- bkde(x, kernel = "epa", bandwidth = 0.5)
plot(fhat, type = "l")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-47-2} \end{center}


```r
suppressMessages(library(tidyverse))
library(gganimate)

fani <- tibble()

for (b in seq(0.001, 0.02, length.out = 40)) {
    f <- bkde(x, kernel = "epa", bandwidth = b, gridsize = length(x))
    fani <- fani %>%
        bind_rows(tibble(xreal = sort(x), x = f$x,
            y = f$y, bw = b))
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

::: {.remark}

- Construya una variable llamada `u` que sea una secuencia de -0.15 a 0.15 con un paso de 0.01
- Asigne `x` a los datos `stockrel` y calcule su media y varianza.
- Usando la función `dnorm` construya los valores de la distribución de los datos usando la media y varianza calculada anteriormente. Asigne a esta variable `f\_param`.
- Defina un ancho de banda `h` en 0.02
- Construya un histograma para estos datos con ancho de banda `h`. Llame a esta variable `f\_hist`
- Usando el paquete `KernSmooth` y la función `bkde`, construya una función que calcule el estimador no paramétrico con un núcleo Epanechivok para un ancho de banda  $h$.  Llame a esta variable `f\_epa`.
- Dibuje en el mismo gráfico la estimación paramétrica y no paramétrica.

:::


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-50-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-50-2} \end{center}

### Ancho de banda óptimo

Usemos la regla de la normal o también conocida como Silverman.
**Primero recuerde que en este caso se asume que** $f(x)$ sigue una
distribución normal. En este caso, lo que se obtiene es que


\begin{align*}
\Vert f^{\prime \prime} \Vert_2^2 & = \sigma ^{-5} \int \{\phi^{\prime \prime}\}^2 dx              \\
& = \sigma ^{-5} \frac{3}{8\sqrt{\pi}} \approx 0.212 \sigma^{-5}
\end{align*}

donde $\phi$ es la densidad de una normal estándar.

El estimador para $\sigma$ es

$$
s = \sqrt{\frac{1}{n-1} \sum_{i=1}^n (x_i - \bar{x})^2  }.
$$

Y usando el cálculo realizado anteriormente, se obtiene que

$$
h_{normal} = \left( \frac{4 s^5}{3n} \right)^{1/5} \approx 1.06 s n^{-1/5}.
$$

Un estimador más robusto es

$$
h_{normal} =  1.06 \min \left\{ s , \frac{IQR}{1.34} \right\} n^{-1/5}.
$$

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-52-1} \end{center}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-53-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-54-1} \end{center}

### Validación cruzada

La forma que vimos en clase es la de validación cruzada por mínimos
cuadrados\`\`least-square cross validation'' la cual se puede ejecutar
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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-55-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..),
    binwidth = h_cv_np_ls$bw, col = "black", fill = "white") +
    stat_function(fun = dnorm, args = list(mean = mu,
        sd = sigma), color = "red") + geom_line(data = dens.np.df,
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-56-1} \end{center}

### Temas adicionales

\*\* Reducción del sesgo \*\* Como lo mencionamos en el texto, una forma
de mejorar el sesgo en la estimación es suponer que la función de
densidad es más veces diferenciable.

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-57-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..),
    binwidth = h_cv_np_ls$bw, col = "black", fill = "white") +
    stat_function(fun = dnorm, args = list(mean = mu,
        sd = sigma), color = "red") + geom_line(data = dens.np.df,
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-58-1} \end{center}

**Otra forma de estimar el ancho de banda** Otra forma de estimar ancho
de bandas óptimos es usando máxima verosimilitud. Les dejo de tarea
revisar la sección 1.1 del artículo de [@Hall1987] para entender su
estructura.


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-59-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..),
    binwidth = h_cv_np_ml$bw, col = "black", fill = "white") +
    stat_function(fun = dnorm, args = list(mean = mu,
        sd = sigma), color = "red") + geom_line(data = dens.np.df,
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-60-1} \end{center}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-61-1} \end{center}


```r
dens.np.df <- data.frame(x = dens.np$eval[, 1], y = dens.np$dens)

ggplot(x_df, aes(x)) + geom_histogram(aes(y = ..density..),
    binwidth = h_cv_np_ml$bw, col = "black", fill = "white") +
    stat_function(fun = dnorm, args = list(mean = mu,
        sd = sigma), color = "red") + geom_line(data = dens.np.df,
    aes(x, y), color = "blue") + theme_minimal(base_size = 20)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-62-1} \end{center}


```r
fani <- tibble()

for (b in seq(0.001, 0.05, length.out = 40)) {
    f <- npudens(tdat = x, ckertype = "epanechnikov",
        bandwidth.compute = FALSE, bws = b)
    fani <- fani %>%
        bind_rows(tibble(xreal = sort(x), x = f$eval$x,
            y = f$dens, bw = b))
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

::: {.exercise #unnamed-chunk-64}
Implementar el intervalo confianza visto en clase para estimadores de densidades por núcleos y visualizarlo de en ggplot. 

**Si se atreven: ¿Se podría hacer una versión animada de ese gráfico para visualizar el significado real de este el intervalo de confianza?**
:::

## Ejercicios

Del libro de [@HardleNonparametric2004] hagan los siguientes ejercicios

1.  **Sección 2:** 1, 2, 3, 5, 7, 14
2.  **Sección 3:** 4, 8, 10, 11, 16,

<!--chapter:end:01-estimacion-densidades-no-parametricas.Rmd-->


# Jackknife y Bootstrap

Suponga que se quiere estimar un intervalo de confianza para la media
\(\mu\) desconocida de un conjunto de datos \(X_{1},\ldots, X_{n}\)
que tiene distribución  \(\mathcal{N}\left(\mu ,\sigma^{2}\right)\).

Primero se  conoce que

\begin{equation*}
\sqrt{n}\left( \hat{\mu} - \mu \right)
\sim \mathcal{N}\left(0,\sigma^{2}\right),
\end{equation*}

y esto nos permite escribir el intervalo de confianza como

\begin{equation*}
\left[ \hat{\mu} - \hat{\sigma}z_{1-\frac{\alpha}{2}} ,
\hat{\mu} + \hat{\sigma}z_{1-\frac{\alpha}{2}}\right]
\end{equation*}

donde \(z_{1-\frac{\alpha}{2}}\) es el cuantil \(1-\frac{\alpha}{2}\)
de una normal estándar.

La expresión anterior es posible dado que la distribución de \(\hat{\mu}\) es normal.

::: {.remark}
¿Qué pasaría si no conocemos la distribución de \(\hat{\mu}\)?
  
¿Cómo podemos encontrar ese intervalo de confianza?
:::



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
para la varianza?

Note que esta pregunta es difícil ya que no tenemos ningún tipo de
información adicional para inferir la variación de la varianza $T_n$.

Las dos técnicas que veremos a continuación nos permitirán extraer
_información adicional_ de la muestra para inferir propiedades distribucionales de $T_n$.

::: {.remark}
Para efectos de este capítulo, llamaremos \(T_{n}=T\left(
  X_{1},\ldots,X_{n}\right)\) al estadístico $T$ formado por la muestra de
los \(X_{i}\)'s.
:::



## Jackknife

Esta técnica fue propuesta por [@Quenouille1949]. Primero que todo se puede probar que existen estimadores que cumplen la siguiente propiedad:

\begin{equation}
\operatorname{Sesgo}\left(T_{n}\right)=\frac{a}{n}+\frac{b}{n^{2}}+O\left(\frac{1}{n^{3}}\right)
\end{equation}

para algún $a$ and $b$.

Por ejemplo sea $\sigma^{2}=\mathrm{Var}\left(X_{i}\right)$ y sea
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
\(i\)-ésimo elemento de la muestra.

Es claro que en este contexto, se tiene que

\begin{equation}
\operatorname{Sesgo}\left(T_{(-i)}\right)=\frac{a}{n-1}+\frac{b}{(n-1)^{2}}+O\left(\frac{1}{(n-1)^{3}}\right)
\end{equation}

::: {.exercise #unnamed-chunk-70}
Una forma fácil de construir los \(T_{(-i)}\) es primero replicando
la matriz de datos múltiple veces usando el producto de kronecker
:::


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



Definimos el estimador de sesgo _jackknife_ de $T_n$ como

\begin{equation*}
b_{jack} = (n-1) (\overline{T}_{n} - T_{n})
\end{equation*}

donde
\begin{equation*}
\overline{T}_{n} = \frac{1}{n} \sum_{i=1}^{n} T_{(-i)}
\end{equation*}

y el estimador corregido por sesgo es: $T_{jack}=T_n-b_{jack}$.
::: {.exercise #unnamed-chunk-74}
En nuestro caso tendríamos lo siguiente:
:::


```r
(bjack <- (n - 1) * (mean(T_i) - Tn))
```

```
## [1] 0
```

Es decir, el sesgo aproximado (jackknife) del estimador $T_n$ es 0.


Si se asume que $T_n$ es un estimador del parámetro $\theta$ entonce se puede comprobar que \(b_{jack}\) cumple:


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

::: {.remark}
Es decir, en general, el estimador \(b_{\text{jack}}\)  aproxima
correctamente \(\mathrm{Sesgo}\left( T_{n} \right)\) hasta con un
error del \(n^{-2}\).
:::


Podemos usar los $T_i$ para generar muestras adicionales para
estimar el parámetro \(\theta\) a través del siguiente estimador:

\[
\widetilde{T}_{i}=n T_{n}-(n-1) T_{(-i)}.
\]

::: {.remark}
A \(\widetilde{T}_{i}\) se le llaman **pseudo-valor** y
representa el aporte o peso que tiene la variable \(X_{i}\) para
estimar \(T_{n}\).
:::

::: {.exercise #unnamed-chunk-78}
Usado un cálculo similar para el \(b_{jack}\) pruebe que

\[
\operatorname{Sesgo}\left(T_{\text {jack}
}\right)=-\frac{b}{n(n-1)}+O\left(\frac{1}{n^{2}}\right)=O\left(\frac{1}{n^{2}}\right).
\]

¿Qué conclusión se obtiene de este cálculo?
:::


::: {.exercise #unnamed-chunk-79}
Los pseudo-valores se estiman de forma directa como,
:::


```r
pseudo <- n * Tn - (n - 1) * T_i

pseudo[1:10]
```

```
##  [1] 199.02972209 957.16225222 252.64417993 365.79679037  -0.06666345
##  [6] 957.16225222 252.64417993 365.79679037  16.09799519 199.02972209
```


Lo importante acá es notar la asociación o correspondencia que tiene con los datos reales,


```r
plot(x = x, y = pseudo)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-81-1} \end{center}



Con estos pseudo-valores, es posible estimar la media y la varianza de
\(T_{n}\) con los siguientes estimadores respectivos:

\[
T_{\text {jack }}=\frac{1}{n} \sum_{i=1}^{n} \widetilde{T}_{i}
\]

y

\[
v_{jack}=\frac{\sum_{i=1}^{n}\left(\widetilde{T}_{i}-\frac{1}{n}
\sum_{i=1}^{n} \widetilde{T}_{i}\right)^{2}}{n-1}.
\]



<!-- # NO ESTOY SEGURO DE QUE LOS SEUDOVALORES SEAN INDEPENDIENTES. Dado que -->
<!-- # cada pseudovalor es independiente e idénticamente distribuido (iid), -->
<!-- # se deduce que su promedio se ajusta a una distribución normal a medida -->
<!-- # que el tamaño de la muestra aumenta. -->
::: {.remark}

Sin embargo, se puede demostrar fácilmente que se pueden usar
pseudovalores para construir una prueba normal de hipótesis.

Como los pseudovalores son idénticamente distribuidos entonces su promedio se ajusta de forma aproximada a una distribución normal a medida
que el tamaño de la muestra aumenta. Por lo tanto, tenemos que
\[
  \frac{\sqrt{n}\left(T_{jack}-\theta\right)}{\sqrt{v_{jack}}}
  \rightarrow N(0,1).
\]
:::




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


Este método es un poco más sencillo de implementar que Jackknife y es
igualmente de eficaz. Este fue propuesto por Bradley Efron en [@Efron1979].

Primero recordemos que estamos estimando la variabilidad propia de un estadístico a partir de
una muestra. Asuma que este estadístico tiene la forma \(T_{n}=g\left( X_{1},\ldots,X_{n} \right)\)
donde \(g\) es cualquier función (media, varianza, quantiles, etc).


Supongamos que conocemos la distribución real de los \(X\)'s, llamada \(F(x)\) y asumamos que $T_n=\bar X_n$. Si uno
quisiera estimar la varianza de \(T_n\) basta con hacer

\begin{equation*}
\mathbb{V}_{F}\left(T_{n}\right):=\mathrm{Var}_{F}\left(T_{n}\right)
= \frac{\sigma^{2}}{n}=\frac{\int x^{2}  dF(x)-\left(\int x
dF(x)\right)^{2}}{n}
\end{equation*}

donde \(\sigma^{2} = \mathrm{Var}\left(X\right)\) y el subindice \(F\) es solo para indicar la dependencia con la distribución real.

Ahora dado que no tenemos la distribución  real \(F(x)\), una opción es utilizar el estimador empírico \(\hat{F}_n\) como estimador plug-in en la formulación de la varianza de $T_n$.

De manera sencilla se puede resumir la técnica de bootstrap como una simulación iid de la distribución \(\hat{F}_n\) de modo que se pueda conocer la varianza del estadístico $T_n$.

En simples pasos la técnica es

1.  Seleccione \(X_{1}^{*}, \ldots, X_{n}^{*} \sim \widehat{F}_{n}\)
2.  Estime \(T_{n}^{*}=g\left(X_{1}^{*}, \ldots, X_{n}^{*}\right)\)
3.  Repita los Pasos 1 y 2, \(B\) veces para obtener \(T_{n, 1}^{*}, \ldots, T_{n, B}^{*}\)
4.  Estime
\[
v_{\mathrm{boot}}=\frac{1}{B} \sum_{b=1}^{B}\left(T_{n, b}^{*}-\frac{1}{B} \sum_{r=1}^{B} T_{n, r}^{*}\right)^{2}
\]


Por la ley de los grandes números tenemos que

\begin{equation}
v_{\mathrm{boot}} \stackrel{\mathrm{a.s.}}{\longrightarrow} \mathbb{V}_{\widehat{F}_{n}}\left(T_{n}\right), \quad  \text{si} \quad B\rightarrow \infty.
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

producto de la ley de grandes números en ambos casos.

::: {.remark}
¿Cómo extraemos una muestra de \(\hat{F}_n\)?
:::


Recuerden que \(\hat{F}_{n}\) asigna la probabilidad de \(\frac{1}{n}\) a cada valor usado para construirla.

Por lo tanto, todos los puntos originales \(X_{1},\ldots,X_{n}\) tienen probabilidad \(\frac{1}{n}\) de ser escogidos, que resulta ser equivalente a un muestreo con remplazo \(n\)-veces.

Así que basta cambiar el punto 1. del algoritmo mencionando anteriormente con


1. Seleccione una muestra con remplazo  \(X_{1}^{*}, \ldots, X_{n}^{*}\) de  \(X_{1},\ldots,X_{n}\).


::: {.exercise #unnamed-chunk-89}
En este ejemplo podemos tomar \(B=1000\) y construir esa cantidad de veces nuestro estimador de varianza:
:::


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-91-1} \end{center}

```r
hist(Tboot_b)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-91-2} \end{center}

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

::: {.remark}
Si $\hat \theta$ es un estimador de $\theta$ (bajo cualquier método) entonces podemos sustituir el paso 1 en el algoritmo de Bootstrap por lo siguiente:

  1. Seleccione \(X_{1}^{*}, \ldots, X_{n}^{*} \sim F_{\hat \theta}\)

A este algoritmo modificado le llamamos Bootstrap paramétrico.
:::


### Intervalos de confianza

#### Intervalo Normal

Este es el más sencillo y se escribe como

\begin{equation}
T_{n} \pm z_{\alpha / 2} \widehat{\mathrm{Se}}_{\mathrm{boot}}
\end{equation}

::: {.remark}
Este intervalo solo funciona si la distribución de \(T_{n}\) es normal.
:::


El cálculo de este intervalo es

```r
c(Tn - z * sdboot, Tn + z * sdboot)
```

```
## [1] 283.8315 574.6653
```

#### Intervalo pivotal

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

::: {.remark}
\(C_{n}^{\star}=(a, b)\)  es un intervalo de confianza al (\(1-\alpha\))%.

El problema es que este intervalo depende de \(H\) desconocido.

:::

Para resolver este problema, se puede construir una versión _bootstrap_ de \(H\) usando lo que sabemos hasta ahora:

\[
\widehat{H}(r)=\frac{1}{B} \sum_{b=1}^{B} I\left(R_{n, b}^{*} \leq r\right)
\]
donde \(R_{n, b}^{*}=\widehat{\theta}_{n, b}^{*}-\widehat{\theta}_{n}\).

Sea  \(r_{\beta}^{*}\) el cuantil muestral de tamaño  \(\beta\) de  \(\left(R_{n, 1}^{*}, \ldots, R_{n, B}^{*}\right)\) y sea \(\theta_{\beta}^{*}\) el cuantil muestral de tamaño  \(\beta\) de \(\left(\theta_{n, 1}^{*}, \ldots, \theta_{n, B}^{*}\right)\).

::: {.remark}
Según la notación anterior se cumple que:
\begin{equation*}
r_{\beta}^{*}= \theta_{\beta}^{*}-\widehat{\theta}_{n}
\end{equation*}
:::



A partir de loa estadísticos anteriores se puede construir un intervalo de confianza aproximado \(C_{n}=(\widehat{a}, \widehat{b})\) al (\(1-\alpha\))% donde:

\begin{align*}
\widehat{a}&= \widehat{\theta}_{n}-\widehat{H}^{-1}\left(1-\frac{\alpha}{2}\right) = \widehat{\theta}_{n}-r_{1-\alpha / 2}^{*} = \widehat{\theta}_{n}-\theta_{1-\alpha / 2}^{*} + \widehat{\theta}_{n} =2 \widehat{\theta}_{n}-\theta_{1-\alpha / 2}^{*} \\
\widehat{b} &=\widehat{\theta}_{n}-\widehat{H}^{-1}\left(\frac{\alpha}{2}\right)
=\widehat{\theta}_{n}-r_{\alpha / 2}^{*}
= \widehat{\theta}_{n}-\theta_{\alpha / 2}^{*} + \widehat{\theta}_{n}
=2 \widehat{\theta}_{n}-\theta_{\alpha / 2}^{*}
\end{align*}

::: {.remark}
El intervalo de confianza pivotal de tamaño \(1-\alpha\) es
\[
  C_{n}=\left(2 \widehat{\theta}_{n}-\widehat{\theta}_{((1-\alpha / 2) B)}^{*}, 2 \widehat{\theta}_{n}-\widehat{\theta}_{((\alpha / 2) B)}^{*}\right)
  \]
:::


El intervalo anterior para un nivel de 95\% se estima de la siguiente forma

```r
c(2 * Tn - quantile(Tboot_b, 1 - 0.05/2), 2 * Tn -
    quantile(Tboot_b, 0.05/2))
```

```
##    97.5%     2.5% 
## 267.1250 552.9294
```


#### Intervalo pivotal studentizado

Una versión mejorada del intervalo pivotal sería a través de la normalización de los estimadores de $T_n$:

\[
Z_{n}=\frac{T_{n}-\theta}{\widehat{\mathrm{se}}_{\mathrm{boot}}}.
\]
Como \(\theta\) es desconocido, entonces la versión a estimar es
\[
Z_{n, b}^{*}=\frac{T_{n, b}^{*}-T_{n}}{\widehat{\mathrm{se}}_{b}^{*}}
\]
donde  \(\widehat{\mathrm{se}}_{b}^{*}\) es un estimador del error estándar de  \(T_{n, b}^{*}\) no de \(T_{n}\).

::: {.remark}
Para calcular $Z_{n, b}^{*}$ requerimos estimar la varianza de \(T_{n,b}^*\) para cada \(b\).
:::

Con esto se puede obtener  cantidades \(Z_{n, 1}^{*}, \ldots, Z_{n, B}^{*}\) que debería ser próximos a \(Z_{n}\). (Bootstrap de los estadísticos normalizados)

Sea \(z_{\alpha}^{*}\) el \(\alpha\)-cuantil de \(Z_{n, 1}^{*}, \ldots, Z_{n, B}^{*},\) entonces  \(\mathbb{P}\left(Z_{n} \leq z_{\alpha}^{*}\right) \approx \alpha\).

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



Note que para este caso tenemos que hacer bootstrap para cada estimador bootstrap calculado.

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




### Resumiendo


Resumiendo todos lo métodos de cálculo de intervalos obtenemos


```r
knitr::kable(data.frame(Metodo = c("Jackknife", "Bootstrap Normal",
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
Jackknife & 285.1679 & 573.3289\\
\hline
Bootstrap Normal & 283.8315 & 574.6653\\
\hline
Bootstrap Pivotal & 271.2827 & 551.4989\\
\hline
Bootstrap Pivotal Estudentizado & 317.7259 & 707.0044\\
\hline
\end{tabular}

## Ejercicios


1. Repita los ejercicios anteriores para calcular intervalos de confianza para la distancia promedio y la varianza del desplazamiento de las personas. Use los métodos de Jackknife y Bootstrap (con todos sus intervalos de confianza).
Dada que la distancia es una medida que puede ser influenciada por distancias muy cortas o muy largas, se puede calcular el logaritmo de esta variable para eliminar la escala de la distancias.

2. Verifique que esta última variable se podría estimar paramétricamente con una distribución normal.
Repita los cálculos anteriores tomando como cuantiles los de una normal con media 0 y varianza 1.

3. Compare los intervalos calculados y comente los resultados.

4. Del libro [@Wasserman2006] **Sección 3:** 2, 3, 7, 9, 11.

  

<!--chapter:end:02-jacknife-bootstrap.Rmd-->


 
# Métodos lineales de regresión

**NOTA: Para los siguientes capítulos nos basaremos en los libros [@HastieElements2009] y [@James2013b].**


## Introducción al Aprendizaje Estadístico.

Supongamos que tenemos \(p\) variables de entrada que provocan una respuesta \(Y\) (variable dependiente) a través de la siguiente relación:

\begin{equation}
Y = f(X_{1},\ldots,X_{p}) + \varepsilon
(\#eq:regresion-general)
\end{equation}
donde \(f\) es desconocida, las variables \(X\)'s son las variables de entrada (covariables o predictores) y \(\varepsilon\) representa un error aditivo a la relación definida por $f$.



Hay dos motivos por los que estimamos \(f\):

1. **Predicción:** Si se estima \(f\) con \(\hat{f}\) entonces
\begin{equation*}
\hat{Y} = \hat{f}(X_{1},\ldots,X_{p}). 
\end{equation*}
asumiendo que el valor medio del error $\epsilon$ es cero. Si tuvieramos valores nuevos de los \(X\)'s entonces podríamos estimar el valor que el corresponde a \(Y\). 

En este caso obtener una estructura óptima o precisa de la función $\hat f$ no es importante, siempre y cuando sea posible obtener buenas predicciones de $Y$. Para entender mejor esta idea se puede definir:

  a. **Error reducible:** Error de \(\hat{f}\) alrededor de \(f\), el cual es propio de la escogencia del modelo. 
  a. **Error irreducible:** Error que escapa a una estimación perfecta de $f$. Puede venir de covariables no consideradas en el problema, fuentes de error que no se pueden cuantificar, etc.

\begin{align*}
\mathbb{E}\left[(\hat{Y}-Y\right)^2] 
&=  \mathbb{E}\left[\left(  f(X_{1},\ldots,X_{p}) + \varepsilon - \hat{f}(X_{1},\ldots,X_{p}) \right)^{2}  \right] \\
&= \underbrace{\left( f(X_{1},\ldots,X_{p})- \hat{f}(X_{1},\ldots,X_{p})  \right) ^{2} }_{\text{Reducible}}
+\underbrace{\mathrm{Var}\left(\varepsilon\right)}_{\text{irreducible}}.
\end{align*}
asumiendo que $f$ y $X$ son conocidas y determinísticas.

2. **Inferencia:**  Entender la relación entre \(X\) y \(Y\), es decir entender cómo $Y$ cambia como función de las covariables. 
En este caso sí nos interesa obtener un estimador preciso e interpretable de la función $f$. Las siguientes preguntas son de interés:
- ¿Cuáles covariables están asociadas con la variable respuesta o dependiente?
- ¿Cuál es la relación entre cada variable predictora y la respuesta?
- ¿La relación entre covariables y variable dependiente es lineal? o ¿la relación es más compleja?

### Formas de estimar $f$

El proceso de estimación de $f$ a través de $\hat f$ se realiza sobre un subconjunto de los datos disponibles. A este conjunto se le llama *datos de entrenamiento*. El resto de los datos se puede utilizar para probar la capacidad predictiva del modelo seleccionado. 

Existen varias clasificaciones de modelos para estimar $f$:

- Modelos paramétricos vs modelos no parámetricos. Los modelos pueden tener parámetros que facilitan el proceso de estimación, pero el número de parámetros debe ser conservador para evitar situaciones de *sobreajuste*. Los modelos no-paramétricos requieren de mucha información para dar un buen ajuste, sea a través de una muestra grande o a través de manipular parámetros generales de suavidad (ancho de banda).
- Modelos predictivos vs modelos interpretativos. Entre más flexible (complejo) sea un modelo, más dificil es su interpretación, por lo tanto más dificil es hacer inferencia. Hay modelos muy flexibles que permiten hacer muy buena predicción, pero fácilmente se puede caer en sobreajuste.
- Modelos supervisados vs no supervisados. ¿La variable $Y$ está disponible en la muestra?
- Modelos de regresión vs modelos de clasificación. ¿La variable $Y$ es continua o es una variable categórica?

### Medidas de bondad de ajuste

En el caso de regresión, la medida más utilizada es el Error Cuadrático Medio (MSE):
\begin{align*}
MSE=\frac 1 n \sum_{i=1}^n(y_i-\hat f(x_i))^2
\end{align*}
calculada sobre la base de entrenamiento del modelo para evaluar la capacidad de ajuste de $\hat f$. Para evaluar la capacidad predictiva del modelo se puede usar el mismo concepto sobre la *base de prueba*. La diferencia entre la magnitud del MSE en los dos conjuntos de datos, puede ser un indicador de sobreajuste. 

Para el caso de un problema de aprendizaje estadístico hay interpretaciones de los componentes de sesgo y varianza:

- *Varianza*: variación de $\hat f$ ante cambios en los datos de entrenamiento. Modelos más flexibles tienen mayor varianza.
- *Sesgo*: error al aproximar la realidad complicada con un modelo más simple.  Modelos más flexibles tienen menor sesgo.

**Estrategia de búsqueda de modelos**: conforme aumenta la flexibilidad de un modelo el sesgo disminuye, y la varianza no aumenta en el mismo ritmo. A partir de un cierto momento la disminución del sesgo no es lo suficientemente fuerte como para contrarrestar el crecimiento en varianza. 

**Conclusión**: un modelo parsimonioso posiblemente garantizará un valor óptimo en MSE.

## Regresión lineal

El caso más sencillo es cuando se asume que la relación es lineal y se describe de la siguiente forma: 

\begin{equation*}
Y = \beta_{0} + \beta_{1}X_{1} + \cdots +  \beta_{p}X_{p} + \varepsilon.
\end{equation*} 
 
 Aquí los valores \(\beta\)'s son constantes a estimar, las variables \(X\)'s son las variables de entrada y  \(\varepsilon\) es el error irreducible cometido por hacer esta aproximación. 
 

Las covariables en un modelo de regresión pueden ser: 

1. Cuantitativas: variables continuas. 
2. Categóricas: variables tipo factor que admiten un número de niveles. Estas variables pueden ser ordinales o nominales, dependiendo si hay un orden natural en la escala de los niveles. Para incorporarla en el modelo de regresión debemos *codificar* la variable:

::: {.example #unnamed-chunk-107}
Se tiene la variable \(G\) codificada con Casado (1), Soltero (2), Divorciado (3) y Unión Libre (4). Si queremos incorporar esta variable en una regresión podríamos usar la siguiente codificación: 

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

Existen otras formas de codificar este tipo de variables, pero esta es una de las más usuales.

:::


### Forma matricial

Podemos escribir el modelo de regresión en forma matricial: 

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
\boldsymbol{X} = 
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

Suponemos que \(\mathbb{E}\left[\varepsilon_{i}\right] = 0\) y \(\mathrm{Var}\left(\varepsilon_{i}\right) = \sigma^{2}\).

La forma de resolver este problema es  por minimos cuadrados.  Es decir, buscamos el \(\hat{\beta}\) que cumpla lo siguiente:


\begin{align}
\hat{\beta} &= 
 \operatorname{argmin}_\beta (\boldsymbol{Y} - \boldsymbol{X} \boldsymbol{\beta})^{\top} (\boldsymbol{Y} - \boldsymbol{X} \boldsymbol{\beta})\\
 &=  \operatorname{argmin}_\beta \sum_{i=1}^n \left( Y_{i} -\beta_{0} - \sum_{j=1}^p X_{j,i} \beta_{j} \right)^2 
 (\#eq:minimos-cuadrados)
 \end{align}


![Tomado de https://www.wikiwand.com/en/Ordinary_least_squares](manual_figures/ols.png)
Por lo tanto buscaríamos minimizar la suma de *residuos* al cuadrado.

Suponga que \(\gamma\) es un vector cualquiera en \(\mathbb{R}^{p+1}\)  y defina \(V := \{\boldsymbol{X}\boldsymbol{\gamma}, \gamma \in \mathbb{R}^{p+1}\}\), es decir el espacio lineal generado por las columnas (covariables) de $\boldsymbol{X}$. Buscamos entonces un vector $\beta$ que cumpla:

\begin{align*}
\boldsymbol{X}\boldsymbol{\beta}
 &= \operatorname{Proy}_{V} \boldsymbol{Y}
\end{align*}

Entonces dado que $\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta} \perp V$, es decir $\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta} \perp \boldsymbol{X}\boldsymbol{\gamma}, \forall \boldsymbol{\gamma} \in \mathbb{R}^{p+1}$ entonces:

\begin{align*}
 \boldsymbol{X}\boldsymbol{\gamma} \cdot \left(\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta}\right)  &=  0 \\
 \boldsymbol{\gamma}^{\top}\boldsymbol{X}^{\top}(\boldsymbol{Y}-\boldsymbol{X}\boldsymbol{\beta}) &=  0 \\
 \boldsymbol{\gamma}^{\top}\boldsymbol{X}^{\top}\boldsymbol{Y} &= \boldsymbol{\gamma}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X}\boldsymbol{\beta}  \\
  \boldsymbol{X}^{\top}\boldsymbol{Y} &=  \boldsymbol{X}^{\top} \boldsymbol{X}\boldsymbol{\beta}  \\
  \boldsymbol{\beta}  &=  (\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\boldsymbol{Y} 
\end{align*}




Donde se asume que \(\boldsymbol{X}^{\top} \boldsymbol{X}\) debe ser invertible. Si no es así, se puede construir su inversa generalizada pero no garantiza la unicidad de los \(\beta\)'s. Es decir, puede existir \(\hat{\beta} \neq \tilde{\beta}\) tal que \(\boldsymbol{X}\boldsymbol{\hat{\beta}} = \boldsymbol{X}\boldsymbol{\tilde{\beta}} \). A $\hat \beta$ se le llama estimador por mínimos cuadrados de $\beta$.

En el caso de predicción tenemos que 

\begin{align*}
\hat{Y} &=  X\hat \beta \\
&= \boldsymbol{X}(\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\boldsymbol{Y} \\
&=  H \boldsymbol{Y} 
\end{align*}

Donde \(H\) es la matriz "techo" o  "hat". La matriz $H$ es la matriz de proyección de Y al espacio de las columnas de \(X\).

::: {.exercise #unnamed-chunk-108}
Suponga que tenemos la regresión simple

\begin{equation*}
Y = \beta_{0} + \beta_{1}X_{1}+\varepsilon.
\end{equation*}


Verifique que los estimadores de mínimos cuadrados de \(\beta_{0}\) y \(\beta_{1}\) son: 

\begin{align*}
\hat{\beta}_{1}&= \frac{\sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)\left(Y_{i}-\overline{Y}\right)}{\sum_{i=1}^{n}\left(X_{i}-\overline{x}\right)^{2}} \\ 
\hat{\beta}_{0}&= \bar{Y}-\widehat{\beta}_{1} \bar{X}
\end{align*}

usando los siguiente métodos:

1. El método de proyecciones. 
2. Aplicando el criterio de mínimos cuadrados. Ecuación \@ref(eq:minimos-cuadrados).

:::

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-110-1} \end{center}

El objetivo es tratar la eficiencia del automóvil `mpg` con respecto a su peso `wt`. 


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-112-1} \end{center}

en donde podemos concluir que la relación lineal no modela de manera apropiada la relación observada en los datos. Por lo tanto es necesario incluir el intercepto $\beta_0$ al modelo lineal:


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-114-1} \end{center}

El mismo resultado se puede obtener a través del comando \verb|lm|: 


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

Suponga que queremos trabajar con la variable categorica `cyl` (Número de cilindros) como única covariable.  Lo que se debe hacer es codificar la variable categórica: 


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

Hasta ahora se han hecho pocos supuestos acerca de la distribución de los datos. Si asumimos que las observaciones $Y_i$ son no correlacionadas y que tienen varianza constante $\sigma^2$ y además las covariables son fijas (no aleatorias), entonces:

\begin{align*}
E[\hat \beta]&=(\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}E[\boldsymbol{Y}] \\ 
&=(\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\boldsymbol{X}\beta\\
&=\beta \\
\text{Var}[\hat \beta] &= (\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top}\text{Var}[\boldsymbol{Y}] ((\boldsymbol{X}^{\top} \boldsymbol{X})^{-1} \boldsymbol{X}^{\top})^{\top} \\
& = \sigma^2 (\boldsymbol{X}^{\top} \boldsymbol{X})^{-1}
\end{align*}

Note que \(\sigma^{2}\) puede ser estimado a través de:
 
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
= \frac{1}{\operatorname{dim}(V^{\top})}\left\Vert \operatorname{Proy}_{V^{\top}}\varepsilon\right\Vert \\
\end{equation*}
 
Cumple con la propiedad que \(\mathbb{E}\left[\hat{\sigma}^{2}\right] = \sigma^{2}\) (estimador insesgado).

Para poder hacer inferencia sobre $\beta$ y $\sigma^2$ se puede asumir además que los errores son gaussianos:

\begin{equation*}
\varepsilon\sim \mathcal{N}\left(0,\sigma^{2}I\right).
\end{equation*} 

y de esta forma se obtiene:

\begin{equation*}
Y = X\beta + \varepsilon \sim \mathcal{N}\left(X\beta,\sigma^{2}I\right)
\end{equation*} 

Y además: 

\begin{align*}
\hat{\beta} \sim  \mathcal{N}\left(\beta,\sigma^2 (X^{\top}X)^{-1}\right) 
\end{align*}

Por otro lado se puede comprobar que: 
$$(n-p-1)\hat{\sigma}^{2} \sim \sigma^{2} \chi^{2}_{n-p-1}.$$
y además se puede comprobar que $\hat \beta$ y $\hat \sigma^2$ son independientes. 

::: {.exercise #unnamed-chunk-118}
Encuentre la varianza para \(\hat \beta_{0}\) y \(\hat \beta_{1}\) para el caso de la regresión simple. 
:::

### Prueba \(t\)
 
La significancia de los parámetros $\beta_j$ se puede verificar a través de la siguiente prueba de hipótesis:

 \begin{equation*}
 H_{0}: \beta_{j} = 0 \quad \text{ vs } \quad H_{1}:\beta_{j}\neq 0.
 \end{equation*}
 
 En donde el estadístico de prueba es: 
 
 \begin{equation*}
 z_{j} = \frac{\hat{\beta}_{j}}{\hat{\sigma} \sqrt{v_{j}}} 
 \end{equation*}
 
 donde \(v_{j}\) es el \(j\)-esimo elemento de la diagonal de \((X^{\top}X)^{-1}\).
 
 Bajo \(H_{0}\):  \(z_{j} \sim t_{n-p-1}\) y se rechaza \(H_{0}\) al nivel $\alpha$ si: 
 
 \begin{equation*}
 \left\vert z_{j} \right\vert > t_{n-p-1, 1-\frac{\alpha}{2}} 
 \end{equation*}
 
### Prueba \(F\)

Si uno busca medir la significancia de todos los parámetros $\beta_j$ de forma simultánea, excepto el intercepto. En este caso podemos definir la siguiente hipótesis nula:
 \begin{equation*}
 H_{0}: \beta_{1} = \cdots =\beta_{p} = 0 \quad 
 \text{  vs   }\quad H_{1}: \text{ al menos un \(\beta\) no es cero}.
 \end{equation*}
 
 
Lo cual es equivalente a comparar el modelo  nulo \(Y=\beta_{0}+\varepsilon\) contra el modelo completo \(Y=\beta_{0}+ \beta_{1}X_{1} + \cdots + \beta_{p}X_{p} + \varepsilon\). 
 
 Defina la suma total de cuadrados ($TSS$) y la suma de residuos al cuadrado ($RSS$) como: 
 \begin{align*}
 TSS &= \sum_{i=1}^{n} \left( Y_{i} -\overline{Y} \right)^{2} \\
 RSS &= \sum_{i=1}^{n} \left( Y_{i} -\hat{Y_i} \right)^{2} \\
 \end{align*}
 
 Entonces el estadístico de prueba es:
 
 \begin{equation*}
 F = \frac{\frac{TSS-RSS}{p}}{\frac{RSS}{n-p-1}} \stackrel{H_0}{\sim} \frac{\chi^{2}_{p}}{\chi^{2}_{n-p-1}}.
 \end{equation*}
 
 y rechazaríamos \(H_{0}\) al nivel $\alpha$ si: 
 
 \begin{equation*}
 F > F_{p, n-p-1, 1-\alpha}.
 \end{equation*}
 
 Si por otro lado queremos probar que un conjunto de $q$ covariables son no-significativas entonces probamos (sin pérdida de generalidad):
\begin{align*}
H_0: \beta_{p-q+1}=\beta_{p-q+2}=\cdots=\beta_p=0
\end{align*}

a través de la comparación de un modelo completo y uno reducido:
\begin{align*}
Y&=\beta_{0}+ \beta_{1}X_{1} + \cdots + \beta_{p}X_{p} + \varepsilon \qquad \text{Modelo completo} \\
Y&=\beta_{0}+ \beta_{1}X_{1} + \cdots + \beta_{p-q}X_{p-q} + \varepsilon \qquad \text{Modelo reducido}
\end{align*}

usando el estadístico de prueba:

 \begin{equation*}
 F = \frac{\frac{RSS_0-RSS}{q}}{\frac{RSS}{n-p-1}} \stackrel{H_0}{\sim} \frac{\chi^{2}_{q}}{\chi^{2}_{n-p-1}}.
 \end{equation*}

donde $RSS_0$ es la suma de residuos al cuadrado del modelo reducido. En este caso se rechazaría $H_0$ al nivel $\alpha$ si $F>F_{q, n-p-1, 1-\alpha}$. 
 
###  Laboratorio


Siguiendo con nuestro ejemplo, vamos a explorar un poco más la función `lm`. 

```r
modelo_wt <- lm(mpg ~ wt, data = mtcars)
summary(modelo_wt)
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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
## wt           -5.3445     0.5591  -9.559 1.29e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.046 on 30 degrees of freedom
## Multiple R-squared:  0.7528,	Adjusted R-squared:  0.7446 
## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10
```

```r
modelo_wt_cyl <- lm(mpg ~ wt + cyl, data = mtcars)
summary(modelo_wt_cyl)
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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  33.9908     1.8878  18.006  < 2e-16 ***
## wt           -3.2056     0.7539  -4.252 0.000213 ***
## cyl6         -4.2556     1.3861  -3.070 0.004718 ** 
## cyl8         -6.0709     1.6523  -3.674 0.000999 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.557 on 28 degrees of freedom
## Multiple R-squared:  0.8374,	Adjusted R-squared:   0.82 
## F-statistic: 48.08 on 3 and 28 DF,  p-value: 3.594e-11
```

```r
anova(modelo_wt, modelo_wt_cyl)
```

```
## Analysis of Variance Table
## 
## Model 1: mpg ~ wt
## Model 2: mpg ~ wt + cyl
##   Res.Df    RSS Df Sum of Sq      F   Pr(>F)   
## 1     30 278.32                                
## 2     28 183.06  2    95.263 7.2856 0.002835 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
modelo_nulo <- lm(mpg ~ 1, data = mtcars)
summary(modelo_nulo)
```

```
## 
## Call:
## lm(formula = mpg ~ 1, data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -9.6906 -4.6656 -0.8906  2.7094 13.8094 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   20.091      1.065   18.86   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.027 on 31 degrees of freedom
```

```r
anova(modelo_nulo, modelo_wt_cyl)
```

```
## Analysis of Variance Table
## 
## Model 1: mpg ~ 1
## Model 2: mpg ~ wt + cyl
##   Res.Df     RSS Df Sum of Sq      F    Pr(>F)    
## 1     31 1126.05                                  
## 2     28  183.06  3    942.99 48.079 3.594e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
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

A través de la prueba $F$ uno puede concluir si un modelo es significativo o no bajo un cierto nivel de confianza, o bien puede comparar si un modelo reducido es más significativo que uno completo, pero no nos da herramientas para decidir si un modelo es mejor que otro.

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

Interpretación: proporción de variabilidad en $Y$ que es explicada a través de las covariables en $X$. Ya que $TSS-RSS$ representa la variabilidad explicada a través del modelo de regresión.

Limitación: puede tener un valor alto bajo un número grande de covariables, ya que $RSS$ tiende a ser bajo conforme aumenta la complejidad del modelo (sobreajuste).


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
## [1] 1404.421
```

```r
(RSS <- sum((y - fitted(fit))^2))
```

```
## [1] 256.8679
```

```r
1 - RSS/TSS
```

```
## [1] 0.8171005
```

Otra forma de entender el $R^2$ es notando que 


```r
cor(y, fitted(fit))^2
```

```
## [1] 0.8171005
```



#### $R^2$ ajustado

```r
(TSS_adj <- TSS/(n - 1))
```

```
## [1] 1.405827
```

```r
(RSS_adj <- RSS/(n - p - 1))
```

```
## [1] 0.2576408
```

```r
1 - RSS_adj/TSS_adj
```

```
## [1] 0.8167336
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
## -1.73583 -0.35052  0.01175  0.33270  1.42618 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.05443    0.03252   32.42   <2e-16 ***
## x1           1.02131    0.01573   64.92   <2e-16 ***
## x2           0.91189    0.05655   16.13   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5076 on 997 degrees of freedom
## Multiple R-squared:  0.8171,	Adjusted R-squared:  0.8167 
## F-statistic:  2227 on 2 and 997 DF,  p-value: < 2.2e-16
```



 
## Predicción 

Hay dos tipos de errores que se deben considerar en regresiones lineales: 

1. **Error Reducible:** Recuerde que \(\hat{Y} = X\hat{\beta} \) es el estimador de la función \(f(X)=X\beta = \beta_{0} + \beta_{1}X_{1}+\cdots+\beta_{p}X_{p}\). 

Por lo tanto su error (reducible) es: 

\begin{equation*}
\left(  f(X) - \hat{Y}\right) ^{2}. 
\end{equation*}

Para un conjunto de datos \(X_{0}\), tenemos que  

\begin{align*}
 & \hat{\beta} \sim  \mathcal{N}\left(\beta, \sigma^{2}\left( (X_{0}^{\top}X_{0})^{-1} \right)\right) \\
 \implies & \hat{Y} = X_{0}\hat{\beta} \sim \mathcal{N}\left((X_{0}\beta,\sigma^{2}X_{0}^{\top}((X_{0}^{\top}X_{0})^{-1}X_{0})) \right)
\end{align*}

Por lo tanto un **intervalo de confianza** al \(1-\alpha\) para \(X_0\beta\) es 

\begin{equation*}
X_{0}\hat \beta \pm z_{1-\frac{\alpha}{2}} \hat{\sigma} \sqrt{X_{0}^{\top}(X_{0}^{\top}X_{0})^{-1}X_{0}}.
\end{equation*}

2. **Error irreducible:** Aún conociendo perfectamente los \(\beta\)'s, existe  el error desconocido \(\varepsilon\sim \mathcal{N}\left(0,\sigma^{2}\right)\) del modelo 

\begin{equation*}
Y = X\beta + \varepsilon.
\end{equation*} 

Entonces la varianza total de la predicción sería 

\begin{equation*}
\sigma^{2} +  \sigma^{2}X_{0}^{\top}((X_{0}^{\top}X_{0})^{-1}X_{0}) 
\end{equation*}


Entonces un **intervalo de predicción** al \(1-\alpha\) debe tomar en cuenta ese error  y por lo tanto 

\begin{equation*}
X_{0}\beta \pm z_{1-\frac{\alpha}{2}} \hat{\sigma} \sqrt{1+X_{0}^{\top}(X_{0}^{\top}X_{0})^{-1}X_{0}}.
\end{equation*}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-126-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-127-1} \end{center}

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
# Agregue una banda de tamaño [lwr, upr] para
# cada punto y llamela 'predicción'
p <- p + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = "predicción"),
    alpha = 0.3)
# Agregue el intervalo de confianza usual y llame
# a ese intervalo 'confianza'
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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-128-1} \end{center}

```r
# # Guardar el gráfico en un archivo pdf
# ggsave(filename = 'linear_reg_con_IC_IP.pdf') #
```


Repitamos el mismo ejercicio anterior pero con un caso más sencillo. 


```r
n <- 1000

X <- runif(n, 0, 10)
Y <- 10 + sin(5 * X) + X + rnorm(1000, 0, 1)
toyex.initial <- data.frame(X, Y) %>%
    arrange(X)

plot(toyex.initial)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-129-1} \end{center}



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
## -3.4587 -0.8232  0.0468  0.8709  3.4115 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.01402    0.07847  127.61   <2e-16 ***
## X            0.98895    0.01340   73.81   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.208 on 998 degrees of freedom
## Multiple R-squared:  0.8452,	Adjusted R-squared:  0.845 
## F-statistic:  5448 on 1 and 998 DF,  p-value: < 2.2e-16
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
    toyexi <- toyexi %>%
        arrange(X)
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

Suponga un modelo lineal con dos covariables:

\begin{equation*}
Y = \beta_{0} + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon
\end{equation*}

Aumentemos en 1 unidad \(X_{1}\) y rescribamos el modelo original 

\begin{align*}
Y &=  \beta_{0} + \beta_{1} (X_{1}+1) + \beta_{2} X_{2} + \varepsilon \\
Y &=  (\beta_{0} + \beta_{1}) + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon \\
Y &=  \tilde{\beta_{0}} + \beta_{1} X_{1} + \beta_{2} X_{2} + \varepsilon \\
\end{align*}

Es decir, el modelo original sigue siendo teniendo la misma estructura aunque hayamos cambiado el \(X_1\). Este fenómeno ocurre siempre bajo transformaciones lineales de las variables. 


Ahora suponga que tenemos el siguiente modelo:
\begin{align*}
Y =  \beta_{0} + \beta_{1} X_{1} X_{2} +\varepsilon \\
\end{align*}

y aumentamos en 1 el \(X_1\):

\begin{align*}
Y &=  \beta_{0} + \beta_{1} (X_{1}+1) X_{2} +\varepsilon \\
Y &=  \beta_{0} + \beta_{1}X_{2} +  \beta_{1} X_{1} X_{2} +\varepsilon \\
\end{align*}

Note que en este caso no se logra mantener el mismo tipo de estructura. Una forma de arreglar el problema es incluir las *interacciones* junto con todos sus *efectos principales*. 

\begin{equation*}
Y =  \beta_{0} + \beta_{1}X_{1} + \beta_{2} X_{2} +  \beta_{3} X_{1} X_{2} +\varepsilon \\
\end{equation*}

Este modelo se le conoce como modelo lineal con interacciones (caso de 2 covariables). Este modelo considera la posible interacción entre las covariables $X_1$ y $X_2$ que permiten cambiar tanto el intercepto como las pendientes de los efectos principales.

**Principio de jerarquía**. Con el fin de mantener la estructura del modelo lineal, siempre es necesario incluir los efectos principales cuando se determina que una interacción entre ellos es significativa.


::: {.exercise #unnamed-chunk-133}
Compruebe que para el caso anterior, si aumenta en una unidad \(X_{1}\), el modelo preserva su estructura. 
:::

### Laboratorio


Generamos una base de datos nueva con solamente `wt` centrado


```r
# La función across y where solo funciona solo
# para dplyr 1.0 Si tienen otra versión, pueden
# usar mutate_if

mtcars_centered <- mtcars %>%
    mutate(across("wt", scale, scale = FALSE, center = TRUE))

# Si no se tiene dplyr 1.0

mtcars_centered <- mtcars %>%
    mutate_at("wt", scale, scale = FALSE, center = TRUE)
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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 34.96055    2.16454  16.151 4.91e-16 ***
## wt          -3.35082    1.16413  -2.878  0.00743 ** 
## disp        -0.01773    0.00919  -1.929  0.06362 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.917 on 29 degrees of freedom
## Multiple R-squared:  0.7809,	Adjusted R-squared:  0.7658 
## F-statistic: 51.69 on 2 and 29 DF,  p-value: 2.744e-10
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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 24.18011    2.18221  11.081 6.12e-12 ***
## wt          -3.35082    1.16413  -2.878  0.00743 ** 
## disp        -0.01773    0.00919  -1.929  0.06362 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.917 on 29 degrees of freedom
## Multiple R-squared:  0.7809,	Adjusted R-squared:  0.7658 
## F-statistic: 51.69 on 2 and 29 DF,  p-value: 2.744e-10
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
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 26.2621926  1.0418029  25.208  < 2e-16 ***
## wt:disp     -0.0072897  0.0009721  -7.499 2.33e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.614 on 30 degrees of freedom
## Multiple R-squared:  0.6521,	Adjusted R-squared:  0.6405 
## F-statistic: 56.24 on 1 and 30 DF,  p-value: 2.329e-08
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
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 21.460008   0.859706  24.962  < 2e-16 ***
## wt:disp     -0.013127   0.002714  -4.837 3.69e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.592 on 30 degrees of freedom
## Multiple R-squared:  0.4382,	Adjusted R-squared:  0.4195 
## F-statistic:  23.4 on 1 and 30 DF,  p-value: 3.686e-05
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
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 44.081998   3.123063  14.115 2.96e-14 ***
## wt          -6.495680   1.313383  -4.946 3.22e-05 ***
## disp        -0.056358   0.013239  -4.257  0.00021 ***
## wt:disp      0.011705   0.003255   3.596  0.00123 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.455 on 28 degrees of freedom
## Multiple R-squared:  0.8501,	Adjusted R-squared:  0.8341 
## F-statistic: 52.95 on 3 and 28 DF,  p-value: 1.158e-11
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
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 23.183772   1.857605  12.480 5.87e-13 ***
## wt          -6.495680   1.313383  -4.946 3.22e-05 ***
## disp        -0.018699   0.007741  -2.416  0.02248 *  
## wt:disp      0.011705   0.003255   3.596  0.00123 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.455 on 28 degrees of freedom
## Multiple R-squared:  0.8501,	Adjusted R-squared:  0.8341 
## F-statistic: 52.95 on 3 and 28 DF,  p-value: 1.158e-11
```


:::{.exercise data-latex=""}

Repita los comandos anteriores con la siguiente base de datos y explique los resultados. 

```r
mtcars_scaled <- mtcars %>%
    mutate(across(c("wt", "disp"), scale, scale = TRUE,
        center = TRUE))
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






## Supuestos 

El modelo lineal tiene los siguientes supuestos:

Linealidad
: En la forma lineal de la relación variable dependiente-covariables.

Errores centrados
: $\mathbb{E}(\varepsilon_i) = 0$.

Homocedasticidad
: $\text{Var}(\varepsilon_t) = \mathbb{E}(\varepsilon_t - \mathbb{E} \varepsilon_t)^2 = \mathbb{E} \varepsilon_t^2 = \sigma^2$ para todo $t$. Es decir, la varianza del modelo (**error irreducible**) no depende de las variables independientes u otro factor. 

Normalidad de los residuos
: $\varepsilon \sim N(0, \sigma^2 )$.

Independencia de los errores
: $\text{Cov}(\varepsilon_t,\varepsilon_s ) = \mathbb{E} (\varepsilon_t - \mathbb{E} \varepsilon_t) (\varepsilon_s - \mathbb{E} \varepsilon_s) = \mathbb{E} \varepsilon_t \varepsilon_s = 0$ para todo $t,s$ con $t\neq s$: si para una observación dada existe un error, este no debe depender del error de otra observación.

Si este supuesto no se cumple puede provocar que los errores estándar en intervalos de confianza y predicción sean subestimados. Es decir que un intervalo del 95\% tendrá un margen de error menor y se rechazaría más fácilmente la hipotesis nula de las pruebas $t$ y $F$.

Multicolinealidad 
: Se asume que la matriz $X^TX$ es invertible, es decir $X$ es una matriz de rango completo. Para esto cada una las covariables no debe ser linealmente dependientes, es decir $X^TX$ de debe acercarse a ser a una matriz singular con determinante cercano a 0. Es decir que cada variable explica aproximadamente "un aspecto o característica" del modelo. Sin embargo puede pasar que varias variables expliquen la misma característica y el modelo se vuelve __inestable__ por decidir entre las dos variables. Por ejemplo: la temperatura en grados centigrados y farenheit. 

Esto generaría que \(\mathrm{Var}\left(\beta\right)\) sea alto ya que 
\begin{equation*}
\text{Var}(\beta) =  \sigma^2(X^{\top}X)^{-1}
\end{equation*}


Más observaciones que predictores
: En caso contrario existen formas alternativas de definir el problema de regresión. (Volveremos a esto cuando veamos selección de modelos)


### Chequeos básicos de las hipótesis de regresión lineal 

#### Linealidad, Errores con esperanza nula, Homocedasticidad

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-139-1} \end{center}



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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-140-1} \end{center}



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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-141-1} \end{center}

```r
plot(fitted(fit), residuals(fit))
abline(h = 0, col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-141-2} \end{center}
:::


#### Independencia de los errores

En este caso defina $\rho(k) = \text{Cov}(\varepsilon_i,\varepsilon_{i+k} )$. Si los residuos son independientes, entonces debe ocurrir que 

\begin{equation*}
\rho(k) = \begin{cases}
1 & k=0\\
0 & k\neq 0.
\end{cases}  
\end{equation*}

Se calcula la función de autocorrelación empírica y se grafica para analizar su comportamiento 

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-143-1} \end{center}



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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.04643    0.03183   32.87   <2e-16 ***
## x            0.95650    0.03287   29.10   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.007 on 998 degrees of freedom
## Multiple R-squared:  0.4589,	Adjusted R-squared:  0.4584 
## F-statistic: 846.6 on 1 and 998 DF,  p-value: < 2.2e-16
```

```r
acf(residuals(fit))
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-144-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-146-1} \end{center}



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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  43.4918     0.4791  90.787  < 2e-16 ***
## x             1.5347     0.4771   3.217  0.00134 ** 
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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-147-1} \end{center}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-149-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-151-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-153-1} \end{center}


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
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.01010    0.01979   0.511   0.6098    
## x           -0.03009    0.01587  -1.896   0.0582 .  
## I(x^2)       0.99172    0.01196  82.906   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5001 on 997 degrees of freedom
## Multiple R-squared:  0.8734,	Adjusted R-squared:  0.8731 
## F-statistic:  3438 on 2 and 997 DF,  p-value: < 2.2e-16
```



```r
qqnorm(residuals(fit), asp = 0)
qqline(residuals(fit), col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-155-1} \end{center}

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
mtcars_kg <- mtcars %>%
    mutate(wt_kg = wt * 1000 * 0.4535 + rnorm(32))


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
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  36.263681   2.143546  16.918 3.11e-16 ***
## disp         -0.016980   0.008712  -1.949   0.0614 .  
## wt          455.378192 220.448899   2.066   0.0482 *  
## wt_kg        -1.012338   0.486488  -2.081   0.0467 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.762 on 28 degrees of freedom
## Multiple R-squared:  0.8103,	Adjusted R-squared:  0.7899 
## F-statistic: 39.86 on 3 and 28 DF,  p-value: 3.079e-10
```


```r
library(car)
options(scipen = 1000)

VIFs <- vif(fit_kg)

VIFs <- as.data.frame(VIFs) %>%
    rownames_to_column(var = "vars")

ggplot(VIFs, aes(x = vars, y = VIFs, group = 1)) +
    geom_point() + geom_line() + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-157-1} \end{center}





### Otros chequeos importantes 

#### Puntos extremos 

Estos puntos son aquellos que $Y_i$ esta lejos de $\hat{Y}_i$, es decir son puntos en donde los residuos son particularmente muy altos. 


Se puede hacer un gráfico de los residuos vs los valores ajustados como en \@ref(fig:grafico-residuos-lineal) y \@ref(fig:grafico-residuos-no-lineal). 


¿Qué tan grande deben ser los residuos?

**Solución:** Se debe escalar los residuos adecuadamente. 

Se construyen los residuos semi-studendizados 

\begin{equation*}
r_{i}^{s} = \frac{e_{i}}{\sqrt{\mathrm{Var}\left(e_{i}\right)}} 
\end{equation*}

donde $e_i=Y_i-\hat Y_i$. Como \(H=X(X^{\top}X)^{-1}X^{\top}\) es la matriz de proyección entonces sabemos que 

\begin{align*}
\hat{Y}&=  H Y \\
e &= Y - \hat{Y}  
\end{align*}

Entonces tenemos que 

\begin{align*}
\mathrm{Var}\left(e\right) 
&=  \mathrm{Var}\left((I-H)Y\right)\\
&= (I-H)^{2}\mathrm{Var}\left(Y\right)\\
&= (I-H) \sigma^{2} 
\end{align*} 

ya que $I-H$ es idempotente. Por lo tanto 

\begin{equation*}
\mathrm{Var}\left(e_{i}\right) = (1-h_{ii}) \sigma^{2}
\end{equation*}

Para cada observación se estandarizan los residuos de siguiente forma 

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-158-1} \end{center}

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

**Caso con valores extremos**


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-159-1} \end{center}

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

Como la matriz $H$ es de idempotente y de rango completo:

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-162-1} \end{center}
 


```r
plot(hatvalues(modelo), col = c(rep("black", 10), "red"),
    cex = 2, pch = 16)
abline(h = 2/10, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-163-1} \end{center}



```r
plot(apa_df, col = c(rep("black", 10), "red"), cex = 2,
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-164-1} \end{center}

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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-166-1} \end{center}





```r
plot(hatvalues(modelo_1), col = c(rep("black", 10),
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-167-1} \end{center}



```r
plot(apa_df_1, col = c(rep("black", 10), "red"), cex = 2,
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_1)[1], b = coef(modelo_1)[2],
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-168-1} \end{center}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-170-1} \end{center}



```r
plot(hatvalues(modelo_2), col = c(rep("black", 10),
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-171-1} \end{center}



```r
plot(apa_df_2, col = c(rep("black", 10), "red"), cex = 2,
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_2)[1], b = coef(modelo_2)[2],
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-172-1} \end{center}


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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-174-1} \end{center}




```r
plot(hatvalues(modelo_3), col = c(rep("black", 10),
    "red"), cex = 2, pch = 16)
abline(h = 2/11, col = "blue")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-175-1} \end{center}
 


```r
plot(apa_df_3, col = c(rep("black", 10), "red"), cex = 2,
    pch = 16)
abline(a = coef(modelo)[1], b = coef(modelo)[2], col = "blue")
abline(a = coef(modelo_3)[1], b = coef(modelo_3)[2],
    col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-176-1} \end{center}

```r
`?`(stats:::plot.lm)
```
 


```r
plot(modelo_3, which = 1:6)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-2} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-3} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-4} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-5} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-178-6} \end{center}



```r
plot(modelo, which = 1:6)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-1} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-2} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-3} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-4} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-5} \end{center}



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-179-6} \end{center}

## Ejercicios 

Del libro [@James2013b] 

- Capítulo 3: 1, 3, 4, 5, 8, 9



<!--chapter:end:04-metodos-lineares-regresion.Rmd-->



# Regresión Logística

## Preliminares

Asuma que la variable dependiente \(Y\) solo contiene valores 0 o 1 y queremos hacer la regresión: 

\begin{equation*}
Y = \beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p} + \varepsilon.
\end{equation*} 

El problema es que \(\mathbb{E}\left[Y | \boldsymbol{X}\right] = \mathbb{P}\left(Y=1\vert \boldsymbol{X}\right)\) y se debe cumplir que 

\begin{equation*}
0\leq \mathbb{E}\left[Y | \boldsymbol{X}\right]\leq 1.
\end{equation*} 

pero el rango de \(\beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p} \) es todo \(\mathbb{R}\). 

Solución: Cambiar \(Y\) por \(g(Y)\in [0,1]\), donde:

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
titanic <- titanic %>%
    select(Survived, Fare, Age) %>%
    drop_na()

fit_lm <- lm(Survived ~ Fare + Age, data = titanic)
```



```r
library(ggiraphExtra)
ggPredict(fit_lm) + theme_minimal(base_size = 16)
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-183-1} \end{center}



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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-185-1} \end{center}

**Nota:** Existen otros tipos de regresión y estas se definen a través del parámetro `family`. En este curso solo nos enfocaremos en el parámetro `family="binomial"`.

### Oportunidad relativa (Odds Ratio) 

Defina la oportunidad relativa:

\begin{equation*}
O(X) = \frac{g(X)}{1-g(X)} = e^{\beta_{0} +\beta_{1} X_{1} + \cdots + \beta_{p} X_{p}} \in [0,1].
\end{equation*}

como la razón de la probabilidad de obtener un 1 con respecto a la de obtener un 0. 

Por ejemplo, suponga que  \(\mathbb{P}\left(Y=1\vert \boldsymbol{X}\right) = g(\boldsymbol{X}) = 0.8\) es la probabilidad de pagar la tarjeta de crédito y  \(1-g(\boldsymbol{X}) = 0.2\) es  la probabilidad de no pagar.  

Entonces la oportunidad relativa de pagar la tarjeta es \(O(X) = \frac{0.8}{0.2} = \frac{4}{1}\), lo que se interpreta como que es 4 veces más probable de pagar que no pagar. 


## Máxima verosimilitud 

Los valores de \(\beta\) se pueden encontrar por máxima verosimilitud. 

Defina \(p_{\beta}(\boldsymbol{X}) = \mathbb{P}\left(Y=1\vert \boldsymbol{X}\right)\).

La verosimilitud es (donde asumimos sin pérdida de generalidad que $p(\boldsymbol{X}):=p_{\beta}(\boldsymbol{X})$):

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

**Solución:** Algoritmo de Netwon-Raphson.

:::{.exercise data-latex=""}
Muestre que 

\begin{equation*}
\frac{\partial^{2} \ell}{\partial \beta^{2}} = -\boldsymbol{X}W\boldsymbol{X} 
\end{equation*}

donde \(W_\beta = \mathrm{diag}\{p(\boldsymbol{X}_{i})(1-p(X_{i}))\}\).

:::


El algoritmo de Netwon-Raphson usa el hecho que 

\begin{equation*}
\beta^{(t)} = \beta ^{(t-1)} - \left(  \frac{\partial^{2} \ell}{\partial \beta^{2}}\right)^{-1} \frac{\partial \ell}{\partial \beta}  \Bigg\vert_{\beta ^{(t-1)}}
\end{equation*}

:::{.exercise data-latex=""}
Muestre que 

\begin{equation*}
\beta^{(t)} = \left( X^{\top}W_\beta X \right)^{-1}X^{\top}Z_{\beta},
\end{equation*}

donde \(Z_{\beta} = Z\beta + W^{-1}_{\beta} (Y-p(X))\) y $\beta=\beta^{(t-1)}$.
:::


A esta técnica se le conoce como __mínimos cuadrados ponderados e iterados__ o en inglés __Iteratively Re-Weighted Least Squares__ (IRLS).

<!-- Se comienza con \(\beta^{(0)}\) cualquiera y se va iterando \(\beta^{(1)}, \beta^{(2)}, \ldots\) hasta encontrar la convergencia.  -->

<!-- Para cada \(t\) se resueelve el problema  -->

<!-- \begin{equation*} -->
<!-- \beta ^{t} = \operatorname{argmin}_{\beta} (Z-X\beta)^{\top}W(Z-X\beta). -->
<!-- \end{equation*} -->


### Resultados adicionales

La suma al cuadrado de los residuos estandarizados se convierte en el estadístico de pearson: 


\begin{align*}
\chi^{2}=\sum_{i=1}^{n} \frac{\left(Y_{i}-\hat{p}(X_{i})\right)^{2}}{\hat{p}(X_{i})}
\end{align*}

la cual es una aproximación cuadrática de la devianza (Curso pasado). 

\begin{equation*}
D = -2 \ell(\hat{\beta})
\end{equation*} 

Además tenemos los resultados que 

- \(\hat{\beta} \xrightarrow{\mathbb{P}} \beta \)
- \(\hat{\beta} \xrightarrow{\mathcal{D}} \mathcal{N}\left(\beta,(X^{\top}WX)^{-1}\right) \) (Prueba de Wald)
- Se pueden comparar un modelo completo con un reducido a través de pruebas asintóticas LRT: 
\begin{equation*}
D_c -D_r \stackrel{H_0}{\sim} =\chi^{2}_{df_{c}-df_r}.
\end{equation*}


## Diágnosticos del modelo

 
 **Advertencia**: La función `glm` no tiene un equivalente de `plot` como en los modelos lineales. De esta forma, si se aplica `plot` a un objeto `glm` solo generará los mismos chequeos que el capítulo anterior. Sin embargo estos podrían estar equivocados si no se leen con cuidado.
 
 
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

df <- titanic %>%
    select(Fare, Age) %>%
    mutate(logit = qlogis(probs)) %>%
    pivot_longer(names_to = "predictores", values_to = "valores.predictores",
        -logit)


ggplot(df, aes(valores.predictores, logit)) + geom_point(size = 0.5,
    alpha = 0.5) + geom_smooth(method = "loess") +
    theme_bw() + facet_wrap(~predictores, scales = "free")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-187-1} \end{center}



### Valores de gran influencia 



```r
library(broom)
fit_data <- broom::augment(fit_glm) %>%
    mutate(indice = 1:n())

fit_data %>%
    top_n(3, .cooksd)
```

```
## # A tibble: 3 x 10
##   Survived  Fare   Age .fitted .resid .std.resid    .hat .sigma .cooksd indice
##      <int> <dbl> <dbl>   <dbl>  <dbl>      <dbl>   <dbl>  <dbl>   <dbl>  <int>
## 1        0  263     19    3.79  -2.76      -2.77 0.00862   1.12   0.129     24
## 2        0  248.    24    3.43  -2.63      -2.65 0.0103    1.12   0.109     94
## 3        0  263     64    3.00  -2.47      -2.49 0.0171    1.12   0.118    352
```


```r
ggplot(fit_data, aes(indice, .std.resid)) + geom_point(aes(color = as.factor(Survived)),
    alpha = 0.5) + theme_bw()
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-190-1} \end{center}


```r
fit_data %>%
    filter(abs(.std.resid) > 3)
```

```
## # A tibble: 0 x 10
## # ... with 10 variables: Survived <int>, Fare <dbl>, Age <dbl>, .fitted <dbl>,
## #   .resid <dbl>, .std.resid <dbl>, .hat <dbl>, .sigma <dbl>, .cooksd <dbl>,
## #   indice <int>
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

La capacidad predictiva de un modelo de clasificación como el de regresión logística se debe medir conforme a la naturaleza de la variable dependiente. Primero recordemos que el modelo predictivo en este caso estaría definido por: 

\begin{equation*}
\hat{p}(X)=\frac{1}{1+e^{-(\hat{\beta}_{0}+\hat{\beta}_{1} X_{1}+\cdots+\hat{\beta}_{p} X_{p})}}
\end{equation*}

donde los \(\beta\)'s son estimados usando IRLS. 


Ahora imaginemos que tenemos un conjunto de datos nuevo \((X^{*}_{1},\ldots,X^{*}_{p})\) y queremos ver que tipo de respuesta \(Y^{*}\) obtenemos (0 o 1) para este conjunto de datos. 

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


Noten que se utilizó un umbral de .5 como separador de que un evento genera un 1 o un 0 a nivel de predicción. Para entender la siguiente tabla vamos a definir los siguientes términos:

Exactitud (Accuracy)
: Es la tasa de que un individuo esté bien identificado por el modelo de clasificación $(TP+TN)/(TP+TN+FN+FP)$.

Precisión
: Es la tasa de elementos identificados como 1 de forma correcta con respecto a los que fueron identificados con un valor de 1 $Precisión = TP/P^*$


Sensibilidad (Exhaustividad)
: Es la tasa de elementos identificados como 1 de forma correcta con respecto a los que realmente son 1. $Sensibilidad = TP/P$

F-Score
: Es la media armónica entre la precisión y la sensibilidad. $F-Score = 2*(Sensibilidad * Precisión)/(Sensibilidad + Precisión)$

Especificidad
: Es la tasa de elementos identificados correctamente como 0 que realmente estaban etiquetados como 0. 

Entonces esto nos da las siguientes posibilidades. 


| Tipo                          | Cálculo                                               | Sinónimos                                                      |
|:------------------------------|:------------------------------------------------------|:---------------------------------------------------------------|
| Tasa Falsos Positivos         | $FP/N$                                                | Error Tipo I, 1-Especificidad                                  |
| Tasa Verdaderos Positivos     | \(TP/P\)                                              | 1-Error Tipo II, Poder, Sensibilidad,   Exhaustividad (Recall) |
| Valor de Predicción Positivos | $TP/P^{*}$                                            | Precisión, 1 - Proporción de Falsos Descubrimientos            |
| Valor de Predicción Negativos | $TN/N^{*}$                                            |                                                                |
| F-Score                       | $\frac{2(TP/P^{*} \times TP/P )}{(TP/P^{*} + TP/P )}$ |                                                                |



**Nota:**

- Exactitud es un buen indicador cuando los datos son simétricos (igual número de FP y FN). 
- F-Scores es un mejor indicador cuando los datos son asimétricos
- La precisión nos permite describir la capacidad del modelo de predecir verdaderos positivos. 
- La sensibilidad nos permite describir la capacidad de categorizar los verdaderos positivos de forma correcta. 

En un modelo se debe escoger entre sensibilidad y precisión de acuerdo a ciertas ideas:

- **Sensibilidad** es importante si la ocurrencia de **falsos negativos** es inaceptable. Por ejemplo en el caso de pruebas clínicas. Posiblemente obtener falsos positivos en este caso es aceptable. 
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


Un excelente clasificador debería detectar correctamente los **verdaderos positivos (TP)** e ignorar los **falsos positivos (FP)**. Puesto de otra forma, si el clasificador es malo, los **verdaderos positivos** serían indistingibles de los **falsos positivos**. 

La curva ROC (Receiver Operation Curve) grafica la Tasa Falsos Positivos vs Sensibilidad del modelo. Y el estadístico AUC mide el área bajo la curva ROC.



```r
library(ROCR)

logist.pred.ROCR <- prediction(predict_numeric, titanic$Survived)

logist.perf <- performance(logist.pred.ROCR, "tpr",
    "fpr")

plot(logist.perf)
abline(0, 1, col = "red")
```



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-195-1} \end{center}

```r
auc <- performance(logist.pred.ROCR, measure = "auc")

auc@y.values
```

```
## [[1]]
## [1] 0.7063313
```
**Nota:**

Hasta este momento estamos verificando el poder de clasificación del modelo con los mismos datos que usamos para ajustarlo. Es decir, le estamos diciendo al modelo que compruebe la veracidad de la clasificación que ya se hizo previamente. 

Esto es incorrecto, ya que el modelo ya sabe "las respuestas"  y no estamos midiendo su poder de clasificación sino más bien su capacidad predictiva dentro del conjunto de entrenamiento. 

Para resolver esto, debemos tomar otra muestra de prueba (__training__) que nos diga si el ajuste que hicimos es correcto. 


```r
titanic$id <- 1:nrow(titanic)

train <- titanic %>%
    sample_frac(0.75)

test <- titanic %>%
    anti_join(train, by = "id")
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



\begin{center}\includegraphics[width=0.7\linewidth]{Notas-Curso-Estadistica_files/figure-latex/unnamed-chunk-200-1} \end{center}

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


\backmatter



<!--chapter:end:referencias.Rmd-->

