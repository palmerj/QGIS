/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/geometry/qgsgeometryengine.h                                *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/





class QgsGeometryEngine
{
%Docstring
 Contains geometry relation and modification algorithms.
.. versionadded:: 2.10
%End

%TypeHeaderCode
#include "qgsgeometryengine.h"
%End
  public:

    enum EngineOperationResult
    {
      Success,
      NothingHappened,
      MethodNotImplemented,
      EngineError,
      NodedGeometryError,
      InvalidBaseGeometry,
      InvalidInput,
      SplitCannotSplitPoint,
    };

    virtual ~QgsGeometryEngine();

    virtual void geometryChanged() = 0;
    virtual void prepareGeometry() = 0;

    virtual QgsAbstractGeometry *intersection( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the intersection of this and ``geom``.

.. versionadded:: 3.0
 :rtype: QgsAbstractGeometry
%End

    virtual QgsAbstractGeometry *difference( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the difference of this and ``geom``.

.. versionadded:: 3.0
 :rtype: QgsAbstractGeometry
%End

    virtual QgsAbstractGeometry *combine( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the combination of this and ``geom``.

.. versionadded:: 3.0
 :rtype: QgsAbstractGeometry
%End

    virtual QgsAbstractGeometry *combine( const QList< QgsAbstractGeometry * > &geometries, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the combination of this and ``geometries``.

.. versionadded:: 3.0
 :rtype: QgsAbstractGeometry
%End

    virtual QgsAbstractGeometry *symDifference( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the symmetric difference of this and ``geom``.

.. versionadded:: 3.0
 :rtype: QgsAbstractGeometry
%End
    virtual QgsAbstractGeometry *buffer( double distance, int segments, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End
    virtual QgsAbstractGeometry *buffer( double distance, int segments, int endCapStyle, int joinStyle, double miterLimit, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End
    virtual QgsAbstractGeometry *simplify( double tolerance, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End
    virtual QgsAbstractGeometry *interpolate( double distance, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End
    virtual QgsAbstractGeometry *envelope( QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End

    virtual QgsPoint *centroid( QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculates the centroid of this.
 May return a `None`.

.. versionadded:: 3.0
 :rtype: QgsPoint
%End

    virtual QgsPoint *pointOnSurface( QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate a point that is guaranteed to be on the surface of this.
 May return a `None`.

.. versionadded:: 3.0
 :rtype: QgsPoint
%End

    virtual QgsAbstractGeometry *convexHull( QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 Calculate the convex hull of this.
 :rtype: QgsAbstractGeometry
%End

    virtual double distance( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Calculates the distance between this and ``geom``.

.. versionadded:: 3.0
 :rtype: float
%End

    virtual bool intersects( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` intersects this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool touches( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` touches this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool crosses( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` crosses this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool within( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` is within this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool overlaps( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` overlaps this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool contains( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` contains this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual bool disjoint( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if ``geom`` is disjoint from this.

.. versionadded:: 3.0
 :rtype: bool
%End

    virtual QString relate( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Returns the Dimensional Extended 9 Intersection Model (DE-9IM) representation of the
 relationship between the geometries.
 \param geom geometry to relate to
 \param errorMsg destination storage for any error message
 :return: DE-9IM string for relationship, or an empty string if an error occurred
.. versionadded:: 2.12
 :rtype: str
%End

    virtual bool relatePattern( const QgsAbstractGeometry *geom, const QString &pattern, QString *errorMsg = 0 ) const = 0;
%Docstring
 Tests whether two geometries are related by a specified Dimensional Extended 9 Intersection Model (DE-9IM)
 pattern.
 \param geom geometry to relate to
 \param pattern DE-9IM pattern for match
 \param errorMsg destination storage for any error message
 :return: true if geometry relationship matches with pattern
.. versionadded:: 2.14
 :rtype: bool
%End

    virtual double area( QString *errorMsg = 0 ) const = 0;
%Docstring
 :rtype: float
%End
    virtual double length( QString *errorMsg = 0 ) const = 0;
%Docstring
 :rtype: float
%End
    virtual bool isValid( QString *errorMsg = 0 ) const = 0;
%Docstring
 :rtype: bool
%End

    virtual bool isEqual( const QgsAbstractGeometry *geom, QString *errorMsg = 0 ) const = 0;
%Docstring
 Checks if this is equal to ``geom``.
 If both are Null geometries, `false` is returned.

.. versionadded:: 3.0
 :rtype: bool
%End
    virtual bool isEmpty( QString *errorMsg ) const = 0;
%Docstring
 :rtype: bool
%End

    virtual bool isSimple( QString *errorMsg = 0 ) const = 0;
%Docstring
 Determines whether the geometry is simple (according to OGC definition).
.. versionadded:: 3.0
 :rtype: bool
%End

    virtual QgsGeometryEngine::EngineOperationResult splitGeometry( const QgsLineString &splitLine,
        QList<QgsAbstractGeometry *> &newGeometries,
        bool topological,
        QgsPointSequence &topologyTestPoints, QString *errorMsg = 0 ) const;
%Docstring
 :rtype: QgsGeometryEngine.EngineOperationResult
%End

    virtual QgsAbstractGeometry *offsetCurve( double distance, int segments, int joinStyle, double miterLimit, QString *errorMsg = 0 ) const = 0 /Factory/;
%Docstring
 :rtype: QgsAbstractGeometry
%End

  protected:

    QgsGeometryEngine( const QgsAbstractGeometry *geometry );
};

/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/geometry/qgsgeometryengine.h                                *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
